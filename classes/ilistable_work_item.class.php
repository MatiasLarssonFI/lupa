<?php

interface IListableWorkItem {
    /**
     * @return int
     */
    public function get_id();
    
    
    /**
     * @return string
     */
    public function get_name();
    
    
    /**
     * @return string
     */
    public function get_email();
    
    
    /**
     * @return string
     */
    public function get_subject();
    
    
    /**
     * @return string
     */
    public function get_message();
    
    
    /**
     * @return string
     */
    public function get_notes();
    
    
    /**
     * @return string
     **/
    public function get_state_action();
    
    
    /**
     * @return boolean
     */
    public function is_archivable();
    
    
    /**
     * @return boolean
     */
    public function is_haltable();
    
    
    /**
     * @return string
     */
    public function get_datetime_created();
    
    
    /**
     * @return string
     */
    public function get_datetime_state();
}
