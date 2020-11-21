<?php

require_once(dirname(__FILE__) . "/iemail_message.class.php");
require_once(dirname(__FILE__) . "/icontact_message.class.php");
require_once(dirname(__FILE__) . "/site_config_factory.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


/**
 * Confirmation message sent to the user.
 */
class ContactConfirmationMessage implements IEmailMessage {
    private $_name;
    private $_email;
    private $_subject;
    private $_subject_reference;
    private $_contact_message;
    
    
    /**
     * Constructor.
     * 
     * @param string $name
     * @param string $email
     * @param string $subject
     * @param string $subject_reference
     * @param \IContactMessage $contact_message
     */
    public function __construct($name, $email, $subject, $subject_reference, \IContactMessage $contact_message) {
        $this->_name = $name;
        $this->_email = $email;
        $this->_subject = $subject;
        $this->_subject_reference = $subject_reference;
        $this->_contact_message = $contact_message;
    }
    
    
    public function get_recipient_address() {
        return $this->_email;
    }
    
    
    public function get_subject_line() {
        $host = \SiteConfigFactory::get()->get_site_config()->host();
        $ts = \UITextStorage::get();
        return "[{$this->_subject_reference}] {$this->_subject} - {$host} {$ts->text("CONTACT_TITLE")}";
    }
    
    
    public function get_message_data() {
        return [
            "name" => $this->_name,
            "contact_person" => \DBIF::get()->get_contact_person(),
            "contact_company" => \UITextStorage::get()->text("CONTACT_TEXT_NAME"),
            "body" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_BODY"),
            "greet" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_GREET"),
            "contact_message_label" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_CONTACT_MESSAGE_LABEL"),
            "contact_message" => $this->_contact_message,
            "br" => \UITextStorage::get()->text("CONTACT_CONFIRMATION_BR"),
            "subject_reference" => sprintf(\UITextStorage::get()->text("CONTACT_CONFIRMATION_SUBJECT_REFERENCE_TMPL"), $this->_subject_reference),
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
