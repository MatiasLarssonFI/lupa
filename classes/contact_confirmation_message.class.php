<?php

require_once(dirname(__FILE__) . "/iemail_message.class.php");
require_once(dirname(__FILE__) . "/site_config_factory.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


class ContactConfirmationMessage implements IEmailMessage {
    private $_name;
    private $_email;
    private $_subject;
    private $_subject_reference;
    
    
    /**
     * Constructor.
     * 
     * @param string $name
     * @param string $email
     * @param string $subject
     * @param string $subject_reference
     */
    public function __construct($name, $email, $subject, $subject_reference) {
        $this->_name = $name;
        $this->_email = $email;
        $this->_subject = $subject;
        $this->_subject_reference = $subject_reference;
    }
    
    
    public function get_recipient_address() {
        return $this->_email;
    }
    
    
    public function get_subject_line() {
        return "[{$this->_subject_reference}] {$this->_subject}";
    }
    
    
    public function get_message_data() {
        return [
            "name" => $this->_name,
            "subject_reference" => $this->_subject_reference,
            "contact_person" => \DBIF::get()->get_contact_person(),
            "contact_company" => \UITextStorage::get()->text("CONTACT_TEXT_NAME"),
            "body" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_BODY"),
            "greet" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_GREET"),
            "br" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_BR"),
        ];
    }
    
    
    public function get_sender_name() {
        return \UITextStorage::get()->text("CONTACT_TEXT_NAME");
    }
    
    
    public function get_sender_address() {
        return \DBIF::get()->get_contact_email();
    }
    
    
    public function get_reply_to_address() {
        return  $this->get_sender_address();
    }
    
    
    public function get_reply_to_name() {
        return $this->get_sender_name();
    }
    
    
    public function get_html_template_name() {
        return "contact_confirmation_email.html";
    }
    
    
    public function get_text_template_name() {
        return "contact_confirmation_email.txt";
    }
}
