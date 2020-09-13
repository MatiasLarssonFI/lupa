<?php

interface IEMailConfirmable {
    /**
     * @return string Recipient address.
     */
    public function get_email();
    
    
    /**
     * @return string Subject line
     */
    public function get_subject();
    
    
    /**
     * @return string Recipient name
     */
    public function get_name();
    
    
    /**
     * @return string
     */
    public function get_subject_reference();
}