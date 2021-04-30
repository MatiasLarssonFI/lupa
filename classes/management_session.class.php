<?php

require_once(__DIR__ . "/isession.class.php");
require_once(__DIR__ . "/client_info.class.php");


/**
 * Singleton.
 * 
 * 'Management' session, meaning that the session has elevated
 * priviledges.
 * 
 * Security features:
 *   - timestamp-based session management
 *   - network-/user-error-tolerant session ID regeneration
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
    private $_client_info;
    
    private static $_inst = null;
    private static $_log_mask = 0x0;
    private static $_log_file = null;
    private static $_cookie_domain = "";
    private static $_cookie_name = "sid";
    
    // time limits
    
    private const SEC_UNTIL_REFRESH = 60 * 15; // regenerate session ID if older than 15 minutes
    private const SEC_UNTIL_EXPIRE = 3600 * 4; // stop using session if older than 4 hours
    private const SEC_EXPIRE_MARGIN = 60 * 5;  // explicitly invalidated sessions will be valid for 5 more minutes
    
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
    
    
    /**
     * Configure the session log.
     *
     * Mask selects events to be logged.
     * 
     * @param string $file The log file, e.g. "/media/wwwuser/logs/session_log"
     * @param int $mask Events to be logged, e.g. ManagementSession::L_BAD_IPADDR_ACCESS | ManagementSession::L_DELETED_ACCESS
     */
    public static function configure_log($file, $mask) {
        self::$_log_file = $file;
        self::$_log_mask = $mask;
    }
    
    
    /**
     * Configure the session cookie.
     * 
     * @param string $name The cookie name, e.g. "sid"
     * @param string $domain The cookie domain, e.g. "my-site.com"
     */
    public static function configure_cookie($name, $domain) {
        self::$_cookie_name = $name;
        self::$_cookie_domain = $domain;
    }
    
    
    public function get_csrf_token() {
        $this->try_generate_csrf_token();
        return $this->_session_storage["csrf_token"] ?? null;
    }
    
    
    /**
     * Generates the CSRF token if not generated already for the session.
     */
    private function try_generate_csrf_token() {
        if (!array_key_exists("csrf_token", $this->_session_storage) && $this->_started) {
            $this->_session_storage["csrf_token"] = bin2hex(random_bytes(256 / 8)); // 256-bit
        }
    }
    
    
    public function set_data($key, $value) {
        $this->_session_storage["user_{$key}"] = $value;
    }
    
    
    public function get_data($key) {
        return $this->_session_storage["user_{$key}"] ?? null;
    }
    
    
    public function has_data($key) {
        return array_key_exists("user_{$key}", $this->_session_storage);
    }
    
    
    public function get_all_data() {
        return $this->get_user_data();
    }
    
    
    public function get_session_id() {
        return $this->_started ? session_id() : "(none)";
    }
    
    
    public function logout() {
        $this->invalidate();
    }
    
    
    public function login() {
        return $this->access(true);
    }
    
    
    private function get_user_data() {
        $ret = [];
        foreach ($this->_session_storage as $key => $value) {
            if (substr($key, 0, 5) === "user_") {
                $ret[$key] = $value;
            }
        }
        return $ret;
    }
    
    
    private function access($new_session) {
        /* Either open an existing session or create a new one, depending on
         * bool $new_session. First invalidate any already opened session before
         * creating a new one ensuring that later access to it will be denied.
         * Open the session file and either create or validate the data. Correct
         * and regenerate the session ID if needed. If the session is expired or
         * the IP address has changed, session data is cleared. */
        
        if ($new_session) {
            $this->invalidate();
        }
        
        if (!$this->_started && ($new_session || array_key_exists(self::$_cookie_name, $_COOKIE))) {
            $this->_started = session_start($this->make_session_config(true));
        }
        
        $success = false;
        
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
            $logmask = 0;
            $is_valid = true;
            
            if ($new_session) {
                $this->clear();
                $this->create();
                $logmask = self::L_CREATED;
                $success = true;
            } else {
                $logmask = $this->validate();
                $is_valid = !$logmask;
                if ($logmask === self::L_INVALIDATED_ACCESS) { // only if this is the one and only validation error
                    $logmask |= $this->handle_invalidated_access();
                    $is_valid = ($logmask & self::L_SID_CORRECT_ERROR) == 0; // clear session also if failed to correct
                }
                if ($is_valid) {
                    $logmask |= self::L_NORMAL_ACCESS;
                    $success = true;
                    if ($this->should_refresh()) {
                        $logmask |= $this->refresh();
                        if ($logmask & self::L_REFRESH_ERROR) {
                            $success = false;
                            $is_valid = false; // clear session also if failed to refresh
                        }
                    }
                }
            }
            
            $this->log($logmask, $this->_session_storage);
            if (!$is_valid) {
                $this->clear();
            }
        }
        
        return $success;
    }
    
    
    private function create() {
        session_regenerate_id();
        $t = time();
        $this->_session_storage["ip_address"] = $this->make_client_address_string();
        $this->_session_storage["expire"] = $t + self::SEC_UNTIL_EXPIRE;
        $this->_session_storage["refresh"] = $t + self::SEC_UNTIL_REFRESH;
    }
    
    
    private function refresh() {
        /* Regenerate session ID. Add new session ID info to the invalidated
         * session so it can be corrected if it's accessed before expiration.
         * Write and close the session and start a new one with the new ID. */
        
        $expire = $this->_session_storage["expire"];
        $ipaddr = $this->_session_storage["ip_address"];
        $user_data = $this->get_user_data();
        
        $this->invalidate();
        
        $new_sid = session_create_id();
        $this->_session_storage["new_sid"] = $new_sid;
        
        session_write_close();
        
        session_id($new_sid);
        $this->_started = session_start($this->make_session_config(false));
        
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
            foreach($user_data as $usr_key => $usr_value) {
                $this->_session_storage[$usr_key] = $usr_value;
            }
            $this->_session_storage["ip_address"] = $ipaddr;
            $this->_session_storage["refresh"] = time() + self::SEC_UNTIL_REFRESH;
            $this->_session_storage["expire"] = $expire;
            
            return self::L_REFRESHED;
        } else {
            return self::L_REFRESH_ERROR;
        }
    }
    
    
    private function invalidate() {
        if ($this->_started && !isset($this->_session_storage["invalidated"])) {
            $this->_session_storage["expire"] = time() + self::SEC_EXPIRE_MARGIN;
            $this->_session_storage["invalidated"] = 1;
            unset($this->_session_storage["refresh"]);
        }
    }
    
    
    private function clear() {
        foreach ([ "ip_address", "expire", "refresh", "invalidated", "new_sid", "csrf_token" ] as $key) {
            if (array_key_exists($key, $this->_session_storage)) {
                unset($this->_session_storage[$key]);
            }
        }
        foreach ($this->_session_storage as $key => $value) {
            if (substr($key, 0, 5) === "user_") {
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
        if (time() > $this->_session_storage["expire"]) {
            $mask |= self::L_EXPIRED_ACCESS;
        }
        if ($this->_session_storage["ip_address"] !== $this->make_client_address_string()) {
            $mask |= self::L_BAD_IPADDR_ACCESS;
        }
        if (array_key_exists("invalidated", $this->_session_storage)) {
            $mask |= self::L_INVALIDATED_ACCESS;
        }
        
        return $mask;
    }
    
    
    private function should_refresh() {
        return array_key_exists("refresh", $this->_session_storage) && time() > $this->_session_storage["refresh"];
    }
    
    
    private function handle_invalidated_access() {
        /* Open the proper session which invalidated this one.
         * The proper session ID cookie will be sent to client. */
        
        session_write_close();
        
        if (array_key_exists("new_sid", $this->_session_storage)) {
            // open proper session
            session_id($this->_session_storage["new_sid"]);
            $this->_started = session_start($this->make_session_config(true));
        } else {
            $this->_started = false;
        }
        
        $mask = 0;
        if ($this->_started) {
            $this->_session_storage = &$_SESSION;
        } else {
            $mask |= self::L_SID_CORRECT_ERROR;
        }
        return $mask;
    }
    
    
    private function make_session_config($strict_mode) {
        // following the recommendations at https://www.php.net/manual/en/session.security.php
        $sess_conf = [
            "name" => self::$_cookie_name,
            "use_strict_mode" => $strict_mode,
            "cookie_path" => "/",
            "cookie_domain" => self::$_cookie_domain,
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
    
    
    private function make_client_address_string() {
        $addrs = $this->_client_info->get_ip_addresses();
        return implode("_", array_map(function($ipaddr, $key) {
            return "{$key}:{$ipaddr}";
        }, $addrs, array_keys($addrs)));
    }
    
    
    private function log($mask, array $data) {
        if (self::$_log_mask & $mask) {
            if (self::$_log_file && (is_writable(self::$_log_file) || (!file_exists(self::$_log_file) && is_writable(dirname(self::$_log_file))))) {
                $mask_str = dechex($mask);
                $data_str = json_encode($data);
                $dt = date("Y-m-d H:i:s");
                $sid = substr(session_id(), 0, 64); // substr just for input sanitation
                file_put_contents(self::$_log_file, "[{$dt}] [{$sid}] [{$this->make_client_address_string()}] [0x{$mask_str}] {$data_str}" . PHP_EOL, FILE_APPEND);
            } else {
                $strfile = self::$_log_file ?? "(null)";
                trigger_error("Failed to log session event: output file {$strfile} not writable");
                // or throw new \RuntimeException(...) if you dare
            }
        }
    }
    
    
    protected function __construct() {
        if (PHP_VERSION_ID < 70100) {
            throw new \LogicException("PHP 7.1.0 or newer is required.");
        }
        
        ini_set("session.gc_maxlifetime", self::SEC_UNTIL_EXPIRE);
        
        // This because of session_create_id().
        foreach ($this->make_session_config(true) as $key => $value) {
            ini_set("session.{$key}", $value);
        }
        
        $this->_session_storage = [];
        $this->_started = false;
        $this->_client_info = new \ClientInfo();
        $this->access(false);
    }
}
