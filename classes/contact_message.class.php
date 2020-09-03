<?php

require_once(dirname(__FILE__) . "/icontact_message.class.php");
require_once(dirname(__FILE__) . "/iemail_message.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");
require_once(dirname(__FILE__) . "/site_config_factory.class.php");


class ContactMessage implements IContactMessage, IEmailMessage {
    /**
     * Constructor.
     * 
     * @param string $name
     * @param string $email
     * @param string $subject
     * @param string $message
     */
    public function __construct($name, $email, $subject, $message) {
        $this->_name = $name;
        $this->_email = $email;
        $this->_subject = $subject;
        $this->_message = $message;
    }
    
    // IContactMessage
    
    public function get_name() {
        return $this->_name;
    }
    
    
    public function get_email() {
        return $this->_email;
    }
    
    
    public function get_subject() {
        $host = \SiteConfigFactory::get()->get_site_config()->host();
        return "{$this->_subject} - {$host} contact";
    }
    
    
    public function get_message() {
        return $this->_message;
    }

    
    // IEmailMessage
    
    public function get_subject_line() {
        return $this->get_subject();
    }
    
    
    public function get_recipient_address() {
        return \DBIF::get()->get_contact_email();
    }
    
    
    public function get_message_data() {
        return [
            "message" => $this->_message,
            "email" => $this->_email,
            "subject" => $this->_subject,
            "name" => $this->_name,
        ];
    }
    
    
    public function get_sender_name() {
        return "Contact Form";
    }
    
    
    public function get_sender_address() {
        return "contactform@" . \SiteConfigFactory::get()->get_site_config()->email_address_host();
    }
    
    
    public function get_reply_to_address() {
        return $this->get_email();
    }
    
    
    public function get_reply_to_name() {
        return $this->get_name();
    }
    
    
    public function get_html_template_name() {
        return "contact_email.html";
    }
    
    
    public function get_text_template_name() {
        return "contact_email.txt";
    }
}
