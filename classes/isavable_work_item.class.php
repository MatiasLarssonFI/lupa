<?php

interface ISavableWorkItem {
    /**
     * @return int
     */
    public function get_id();
    
    
    /**
     * @return string
     */
    public function get_subject_reference();
    
    
    /**
     * @return string
     */
    public function get_state();
    
    
    /**
     * @return string
     */
    public function get_notes();
    
    
    /**
     * @return boolean
     */
    public function is_archived();
}
