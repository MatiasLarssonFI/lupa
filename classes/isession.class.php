<?php


interface ISession {
    /**
     * Returns the anti-CSRF token.
     * 
     * @return string
     */
    public function get_csrf_token();
    
    
    /**
     * Returns true if the given token is the valid CSRF token.
     * 
     * @return boolean
     */
    public function validate_csrf_token($token);
    
    
    /**
     * Returns the session storage as an associative array.
     * 
     * @return array
     */
    public function get_storage_data();
    
    
    /** 
     * Destroy the current session.
     */
    public function logout();
    
    
    /**
     * Start a new session.
     *
     * @param bool $new_session
     * @return bool True on success
     */
    public function login($new_session);
}
