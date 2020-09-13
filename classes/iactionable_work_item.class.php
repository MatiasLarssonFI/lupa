<?php

interface IActionableWorkItem {
    /**
     * @return string
     **/
    public function get_state_action();
    
    
    /**
     * @return boolean
     **/
    public function try_perform_state_action();
    
    
        /**
     * @return boolean
     **/
    public function try_perform_archive();
    
    
    /**
     * @return boolean
     **/
    public function try_perform_halt();
    
    
    /**
     * @param string $notes
     */
    public function set_notes($notes);
    
    
    /**
     * @return string
     */
    public function get_notes();
}
