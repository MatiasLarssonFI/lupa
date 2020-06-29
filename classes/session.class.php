<?php


/**
 * Singleton.
 */
class Session {
    private $_session_storage;
    private $_request_storage;
    private static $_inst = null;
    
    
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
    
    
    
    /**
     * Returns the CSRF token.
     * 
     * @return string
     */
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
        if (!array_key_exists("WP_csrf", $_COOKIE)) {
            $this->_request_storage["csrf_token"] = hash("sha256", bin2hex(openssl_random_pseudo_bytes(4)) . "Houston, we have woodparts.");
            setcookie("WP_csrf", $this->_request_storage["csrf_token"]);
        } else if (!array_key_exists("csrf_token", $this->_request_storage)) {
            $this->_request_storage["csrf_token"] = $_COOKIE["WP_csrf"];
        }
    }
    
    
    /**
     * Returns true if the given token is the valid CSRF token.
     * 
     * @return boolean
     */
    public function validate_csrf_token($token) {
        return $token === $_COOKIE["WP_csrf"];
    }
    
    
    /**
     * Returns the session storage as an associative array.
     * 
     * @return array
     */
    public function get_storage_data() {
        return $this->_session_storage;
    }
    
    
    protected function __construct() {
        session_start();
        $this->_session_storage = &$_SESSION;
        $this->_request_storage = array();
    }
}
