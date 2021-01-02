<?php


interface ISession {
    /**
     * Returns the anti-CSRF token.
     * 
     * @return string
     */
    public function get_csrf_token();
    
    
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
     * The data must have been previously set with set_data().
     *
     * @param string $key
     * @return bool True if the data exists.
     */
    public function has_data($key);
    
    
    /**
     * Get data from session.
     *
     * The data must have been previously set with set_data().
     *
     * @param string $key
     * @return mixed
     */
    public function get_data($key);
    
    
    /**
     * Returns all data from session as an associative array.
     *
     * @return array
     */
    public function get_all_data();
    
    
    /**
     * Returns the session ID.
     *
     * @return string The session ID
     */
    public function get_session_id();
    
    
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
