<?php

interface ISavableWorkItem {
    // Change-mask bits
    const CM_ARCHIVED      = 1 << 0;
    const CM_UNARCHIVED    = 1 << 1;
    const CM_STATE_CHANGED = 1 << 2;
    const CM_HOUSEKEEPER   = 1 << 3;
    
    
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
     * @return int Change-mask
     */
    public function get_change_mask();
    
    
    /**
     * Returns a stable subject reference for given id.
     *
     * @param int $id
     * @return string
     */
    public function make_subject_reference($id);
}
