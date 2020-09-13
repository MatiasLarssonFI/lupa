<?php

interface ISavableWorkItem {
    const CM_ARCHIVED      = 1 << 0;
    const CM_UNARCHIVED    = 1 << 1;
    const CM_STATE_CHANGED = 1 << 2;
    
    
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
    
    
    /**
     * @return string
     */
    public function get_previous_state();
    
    
    /**
     * @return int 
     */
    public function get_change_mask();
}
