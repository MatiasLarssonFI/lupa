<?php

interface INavigableLink {
    /**
     * Returns the nav link action name.
     * 
     * @return string
     */
    public function get_action();
    
    
    /**
     * Returns the nav link text.
     * 
     * @return string
     */
    public function get_text();
    
    
    /**
     * Returns true if link is active, i. e. the current page.
     * 
     * @return boolean
     */
    public function is_active();
    
    
    /**
     * Returns true if the nav link points to a separate page.
     * @return boolean
     */
    public function is_page();
}