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
     * Set data to session.
     *
     * @param string $key
     * @param mixed $value
     */
    public function set_data($key, $value);
    
    
    /**
     * Returns true if the data exists.
     *
     * @param string $key
     * @return bool True if the data exists.
     */
    public function has_data($key);
    
    
    /**
     * Get data from session previously set with set_data().
     *
     * @param string $key
     * @return mixed
     */
    public function get_data($key);
    
    
    /** 
     * Destroy the current session.
     */
    public function logout();
    
    
    /**
     * Start a new session.
     *
     * @return bool True on success
     */
    public function login();
}
