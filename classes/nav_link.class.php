<?php


class NavLink {
    private $_action;
    private $_text;
    private $_is_active;
    
    
    /**
     * Constructor.
     * 
     * @oaram string $action
     * @oaram string $text
     * @param boolean $is_active
     */
    public function __construct($action, $text, $is_active) {
        $this->_action = $action;
        $this->_text = $text;
        $this->_is_active = $is_active;
    }
    
    
    /**
     * Returns the nav link action name.
     * 
     * @return string
     */
    public function get_action() {
        return $this->_action;
    }
    
    
    /**
     * Returns the nav link text.
     * 
     * @return string
     */
    public function get_text() {
        return $this->_text;
    }
    
    
    /**
     * Returns true if link is active, i. e. the current page.
     * 
     * @return boolean
     */
    public function is_active() {
        return $this->_is_active;
    }
}
