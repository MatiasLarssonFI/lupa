<?php

require_once(__DIR__ . "/isession.class.php");
require_once(__DIR__ . "/site_config_factory.class.php");
require_once(__DIR__ . "/dbif.class.php");


/**
 * Singleton.
 * 
 * 'Management' session, meaning that the session has elevated
 * priviledges.
 * 
 * Security features:
 *   - timestamp-based session management
 *   - network/user error tolerant session ID regeneration
 *   - strong anti-CSRF token
 *   - strong session cookie security in terms of cryptography and cookie attributes
 *   - prevent access from changed client IP address
 *   - access log
 *
 * Requires PHP 7.1.0 or newer.
 *
 * See https://www.php.net/manual/en/session.security.php
 */
class ManagementSession implements ISession {
    private $_session_storage; // $_SESSION
    private $_started;
    private $_log_mask;
    
    private static $_inst = null;
    
    // cookie names
    
    const SESSION_NAME = "lupaSession";
    
    // time limits
    
    const SEC_UNTIL_REFRESH = 60 * 15; // regenerate session ID if older than 15 minutes
    const SEC_UNTIL_EXPIRE = 3600 * 4; // stop using session if older than 4 hours
    const SEC_EXPIRE_MARGIN = 60 * 5;  // explicitly invalidated sessions will be valid for 5 more minutes
    
    // bits for the log mask, used for selecting which events are to be logged
    
    const L_CREATED =           1 << 0; // created a new session
    const L_REFRESHED =         1 << 1; // regenerated the session ID for an exsisting session
    const L_NORMAL_ACCESS =     1 << 2; // good access of an existing session
    const L_BAD_IPADDR_ACCESS = 1 << 3; // access of an existing session with changed client IP address
    const L_EXPIRED_ACCESS =    1 << 4; // access of an existing expired session
    const L_DELETED_ACCESS =    1 << 5; // access of a nonexistent session
    const L_INVALIDATED_ACCESS =1 << 6; // access of an invalidated session
    const L_REFRESH_ERROR =     1 << 7; // failure during session ID regeneration
    const L_SID_CORRECT_ERROR = 1 << 8; // failure during session ID correction when accessing an invalidated session
    
    const LOG_FILE = __DIR__ . "/../session_log";
    
    /**
     * Returns the Session object.
     * 
     * @return ISession
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    
    public function get_csrf_token() {
        $this->try_generate_csrf_token();
        return isset($this->_session_storage["csrf_token"]) ? $this->_session_storage["csrf_token"] : null;
    }
    
    
    /**
     * Generates the CSRF token if not generated already for the session.
     */
    private function try_generate_csrf_token() {
        if (!array_key_exists("csrf_token", $this->_session_storage) && $this->_started) {
            $this->_session_storage["csrf_token"] = hash("sha256", bin2hex(openssl_random_pseudo_bytes(4)) . substr(session_id(), 0, 6) . "Flkj)I9HU#sd%43");
        }
    }
    
    
    public function validate_csrf_token($token) {
        return array_key_exists("csrf_token", $this->_session_storage) && $token === $this->_session_storage["csrf_token"];
    }
    
    
    public function get_storage_data() {
        return $this->_session_storage;
    }
    
    
    public function logout() {
        $this->invalidate();
    }
    
    
    public function login($new_session) {
        /* Either open an existing session or create a new one, depending on
         * bool $new_session. First make sure that any already opened session
         * is invalidated before creating a new one so that later access to it 
         * will be denied. Open the session file and either create or validate
         * the data. Regenerate or correct the session ID if needed. An expired
         * session will be destroyed immediately on access. */
        
        if ($new_session) {
            $this->invalidate();
        }
        
        if (!$this->_started) {
            $this->_started = session_start($this->make_session_config(true));
        }
        
        $success = false;
        
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
            
            if ($new_session) {
                $this->create();
                $this->log(self::L_CREATED, $this->_session_storage);
                $success = true;
            } else {
                $logmask = $this->validate();
                $ok = !$logmask;
                if ($logmask === self::L_INVALIDATED_ACCESS) { // only if this is the one and only validation error
                    $logmask = $this->handle_invalidated_access($logmask);
                    $ok = true;
                }
                if ($ok) {
                    $logmask |= self::L_NORMAL_ACCESS;
                    $success = true;
                    if ($this->should_refresh()) {
                        $this->refresh();
                        $logmask |= self::L_REFRESHED;
                    }
                    $this->log($logmask, $this->_session_storage);
                } else {
                    // Access to an expired session, or changed IP address.
                    // Remove all data from session.
                    $this->log($logmask, $this->_session_storage);
                    $this->destroy();
                }
            }
        }
        
        return $success;
    }
    
    
    private function create() {
        session_regenerate_id();
        $t = time();
        $this->_session_storage["p_mngmnt"] = 1; // 'permission' flag checked by controller
        $this->_session_storage["ip_address"] = $_SERVER["REMOTE_ADDR"];
        $this->_session_storage["expire"] = $t + self::SEC_UNTIL_EXPIRE;
        $this->_session_storage["refresh"] = $t + self::SEC_UNTIL_REFRESH;
        if (array_key_exists("invalidated", $this->_session_storage)) {
            unset($this->_session_storage["invalidated"]);
        }
    }
    
    
    private function refresh() {
        /* Regenerate session ID. Add new session ID info to the invalidated
         * session so it can be corrected if it's accessed before expiration.
         * Write and close the session and start a new one with a new ID. */
        
        $expire = $this->_session_storage["expire"];
        $ipaddr = $this->_session_storage["ip_address"];
        
        $this->invalidate();
        
        $new_sid = session_create_id();
        $this->_session_storage["new_sid"] = $new_sid;
        
        session_write_close();
        
        session_id($new_sid);
        $this->_started = session_start($this->make_session_config(false));
        
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
            $this->_session_storage["p_mngmnt"] = 1;
            $this->_session_storage["ip_address"] = $ipaddr;
            $this->_session_storage["refresh"] = time() + self::SEC_UNTIL_REFRESH;
            $this->_session_storage["expire"] = $expire;
            foreach ([ "invalidated", "new_sid", ] as $key) {
                unset($this->_session_storage[$key]);
            }
        } else {
            $this->log(self::L_REFRESH_ERROR, $this->_session_storage);
            $this->destroy();
        }
    }
    
    
    private function invalidate() {
        if ($this->_started && !isset($this->_session_storage["invalidated"])) {
            $this->_session_storage["expire"] = time() + self::SEC_EXPIRE_MARGIN;
            $this->_session_storage["invalidated"] = 1;
            unset($this->_session_storage["refresh"]);
        }
    }
    
    
    private function destroy() {
        foreach ([ "p_mngmnt", "ip_address", "expire", "refresh", ] as $key) {
            if (array_key_exists($key, $this->_session_storage)) {
                unset($this->_session_storage[$key]);
            }
        }
    }
    
    
    private function validate() {
        foreach ([ "expire", "ip_address", ] as $key) {
            if (!array_key_exists($key, $this->_session_storage)) {
                return self::L_DELETED_ACCESS;
            }
        }
        
        $mask = 0;
        if (time() > $this->_session_storage["expire"])                         $mask |= self::L_EXPIRED_ACCESS;
        if ($this->_session_storage["ip_address"] !== $_SERVER["REMOTE_ADDR"])  $mask |= self::L_BAD_IPADDR_ACCESS;
        if (array_key_exists("invalidated", $this->_session_storage))           $mask |= self::L_INVALIDATED_ACCESS;
        
        return $mask;
    }
    
    
    private function should_refresh() {
        return array_key_exists("refresh", $this->_session_storage) && time() > $this->_session_storage["refresh"];
    }
    
    
    private function handle_invalidated_access($mask) {
        /* Set the proper session ID in an attempt to prevent
         * subsequent usage of the invalidated session because
         * it will expire soon. Open the proper session. */
        
        session_write_close();
        
        // open proper session
        session_id($this->_session_storage["new_sid"]);
        $this->_started = session_start($this->make_session_config(true));
        
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
            foreach ([ "invalidated", "new_sid", ] as $key) {
                unset($this->_session_storage[$key]);
            }
        } else {
            $mask |= self::L_SID_CORRECT_ERROR;
        }
        return $mask;
    }
    
    
    private function make_session_config($strict_mode) {
        // following the recommendations at https://www.php.net/manual/en/session.security.php
        $sess_conf = [
            "name" => self::SESSION_NAME,
            "use_strict_mode" => $strict_mode,
            "cookie_path" => "/",
            "cookie_domain" => \SiteConfigFactory::get()->get_site_config()->host(),
            "cookie_secure" => true,
            "cookie_httponly" => true,
            "cookie_lifetime" => 0,
            "use_cookies" => true,
            "use_only_cookies" => true,
            "sid_length" => 48,
            "sid_bits_per_character" => 6,
            "cache_limiter" => "nocache",
        ];
        if (PHP_VERSION_ID >= 70300) {
            $sess_conf["cookie_samesite"] = "Strict";
        };
        return $sess_conf;
    }
    
    
    private function log($mask, array $data) {
        if ($this->_log_mask & $mask) {
            if (is_writable(self::LOG_FILE) || is_writable(dirname(self::LOG_FILE))) {
                $mask_str = dechex($mask);
                $data_str = json_encode($data);
                $dt = date("Y-m-d H:i:s");
                $sid = substr(session_id(), 0, 64); // substr just for input sanitation
                file_put_contents(self::LOG_FILE, "[{$dt}] [{$sid}] [0x{$mask_str}] {$data_str}" . PHP_EOL, FILE_APPEND);
            } else {
                $f = self::LOG_FILE;
                $d = dirname(self::LOG_FILE);
                trigger_error("Failed to log session event: output file {$f} and parent directory {$d} not writable.");
                // or throw new \RuntimeException(...) if you dare
            }
        }
    }
    
    
    protected function __construct() {
        if (PHP_VERSION_ID < 70100) {
            throw new \LogicException("PHP 7.1.0 or newer is required.");
        }
        
        $this->_started = false;
        $this->_log_mask = \DBIF::get()->get_session_notifications_mask();
        $this->login(false);
    }
}
