<?php

interface IEmailMessage {
    /**
     * @return array Data for the template
     */
    public function get_message_data();
    
    
    /**
     * @return string
     */
    public function get_subject_line();
    

    /**
     * @return string
     */
    public function get_recipient_address();
    
    
    /**
     * @return string
     */
    public function get_sender_name();
    
    
    /**
     * @return string
     */
    public function get_sender_address();
    
    
    /**
     * @return string
     */
    public function get_reply_to_address();
    
    
    /**
     * @return string
     */
    public function get_reply_to_name();
    
    
    /**
     * @return string
     */
    public function get_html_template_name();
    
    
    /**
     * @return string
     */
    public function get_text_template_name();
}
