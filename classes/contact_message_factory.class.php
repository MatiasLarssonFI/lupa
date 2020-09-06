<?php

require_once(dirname(__FILE__) . "/contact_message.class.php");
require_once(dirname(__FILE__) . "/contact_confirmation_message.class.php");
require_once(dirname(__FILE__) . "/contact_message_mailer.class.php");


class ContactMessageFactory {
    private static $_inst;
    
    
    /**
     * Returns the ContactMessageFactory object.
     * 
     * @return ContactMessageFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Creates an IContactMessage object.
     * 
     * @param string $name
     * @param string $email
     * @param string $subject
     * @param string $message
     * 
     * @return IContactMessage|IEmailMessage
     */
    public function make_from_values($name, $email, $subject, $message) {
        return new ContactMessage($name, $email, $subject, $message);
    }
    
    
    /**
     * Creates an IEMailMessage object out of an IEMailConfirmable object.
     * 
     * The returned IEMailMessage is inteded as a confirmation to be sent
     * to the user.
     * 
     * @param \IEMailConfirmable $item
     * @return \IEMailMessage
     */
    public function make_confirmation(\IEMailConfirmable $item) {
        return new ContactConfirmationMessage($item->get_name(), $item->get_email(), $item->get_subject(), $item->get_subject_reference());
    }
    
    
    /**
     * Returns the contact message mailer.
     * 
     * @return IMailer
     */
    public function get_mailer() {
        return new ContactMessageMailer();
    }
    
    
    protected function __construct() {}
}
