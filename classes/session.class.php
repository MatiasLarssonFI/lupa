<?php

require_once(__DIR__ . "/isession.class.php");
require_once(__DIR__ . "/site_config_factory.class.php");


/**
 * Singleton.
 *
 * Guest session - doesn't actually start any session.
 */
class Session implements ISession {
    private $_request_storage;
    private static $_inst = null;
    
    const ANTI_CSRF_NAME = "lupaCsrf";
    
    
    /**
     * Returns the Session object.
     * 
     * @return Session
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    public function get_csrf_token() {
        $this->try_generate_csrf_token();
        return $this->_request_storage["csrf_token"];
    }
    
    
    /**
     * Generates the CSRF token if not generated already for the session.
     * 
     * Also ensures that the token is accessible from this->_request_storage.
     */
    private function try_generate_csrf_token() {
        if (!array_key_exists(self::ANTI_CSRF_NAME, $_COOKIE)) {
            if (!array_key_exists("csrf_token", $this->_request_storage)) {
                $this->_request_storage["csrf_token"] = hash("sha256", bin2hex(openssl_random_pseudo_bytes(4)) . "Houston, we have woodparts.");
            }
            if (PHP_VERSION_ID >= 70300) {
                setcookie(self::ANTI_CSRF_NAME, $this->_request_storage["csrf_token"], $this->make_cookie_options());
            } else {
                // legacy, missing SameSite attribute
                setcookie(self::ANTI_CSRF_NAME, $this->_request_storage["csrf_token"], 0, "/", SiteConfigFactory::get()->get_site_config()->host(), true, true);
            }
        } else if (!array_key_exists("csrf_token", $this->_request_storage)) {
            $this->_request_storage["csrf_token"] = $_COOKIE[self::ANTI_CSRF_NAME];
        }
    }
    
    
    public function validate_csrf_token($token) {
        return array_key_exists(self::ANTI_CSRF_NAME, $_COOKIE) && $token === $_COOKIE[self::ANTI_CSRF_NAME];
    }
    
    
    private function make_cookie_options() {
        return [
            "expires" => 0,
            "path" => "/",
            "domain" => SiteConfigFactory::get()->get_site_config()->host(),
            "secure" => true,
            "httponly" => true,
            "samesite" => "Strict",
        ];
    }
    
    
    public function get_storage_data() {
        return [];
    }
    
    
    public function logout() {}
    
    
    public function login() {
        return true;
    }
    
    
    private function clear() {}
    
    
    protected function __construct() {
        $this->_request_storage = [];
    }
}
