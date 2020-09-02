<?php

require_once(__DIR__ . "/iemail_message.class.php");
require_once(__DIR__ . "/imailer.class.php");
require_once(__DIR__ . "/dbif.class.php");
require_once(__DIR__ . "/site_config_factory.class.php");

require_once(__DIR__ . "/../lib/Twig-1.24.0/Twig-1.24.0/lib/Twig/Autoloader.php");
require_once(__DIR__ . "/../lib/PHPMailer-6.1.7/src/Exception.php");
require_once(__DIR__ . "/../lib/PHPMailer-6.1.7/src/PHPMailer.php");
require_once(__DIR__ . "/../lib/PHPMailer-6.1.7/src/SMTP.php");

use PHPMailer\PHPMailer\PHPMailer;


class ContactMessageMailer implements IMailer {
    private $_mail;
    
    public function send(IEmailMessage $contactmsg) {
        try {
            $this->_send($contactmsg);
        } catch (\Exception $e) {
            $dt = date("Y-m-d H:i:s");
            file_put_contents(__DIR__ . "/../contact_email_error_log", "[{$dt}] {$e->getMessage()} - Mail error: {$this->_mail->ErrorInfo}" . PHP_EOL, FILE_APPEND);
            throw $e;
        }
    }
    
    private function _send(IEmailMessage $contactmsg) {
        $mail = new PHPMailer;
        $this->_mail = $mail;
        
        \Twig_Autoloader::register();
        $loader = new \Twig_Loader_Filesystem(__DIR__ . "/../templates");
        $twig = new \Twig_Environment($loader, array());
        
        $host = \SiteConfigFactory::get()->get_site_config()->host();
        $db = \DBIF::get();
        
        $mail_user = $db->get_mail_user();
        $mail->Port = 25;
        if (strlen($mail_user) > 0) { // username can also just indicate SMTP
            $mail->isSMTP();
            $mail->Port = 587;
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Host = $db->get_mail_server();
            $mail_password = $db->get_mail_password();
            if (strlen($mail_password) > 0) {
                $mail->SMTPAuth = true;
                $mail->Username = $mail_user;
                $mail->Password = $mail_password;
            }
        }
        

        $mail->addReplyTo($contactmsg->get_email(), $contactmsg->get_name());
        // note that $mail->setFrom() does not really work
        $mail->From = "contactform@{$host}";
        $mail->FromName = 'Contact Form';
        $mail->addAddress($db->get_contact_email());
        $mail->isHTML(true);
    
        $mail->CharSet = PHPMailer::CHARSET_UTF8;
        $mail->Subject = "{$contactmsg->get_subject()} - LUPA contact";
        $mail->Body    = $twig->render("contact_email.html", array("message" => $contactmsg));
        $mail->AltBody = $twig->render("contact_email.txt", array("message" => $contactmsg));

        if(!$mail->send()) {
            throw new \RuntimeException("Failed to send contact form e-mail.");
        }
    }
}
