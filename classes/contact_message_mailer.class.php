<?php

require_once(dirname(__FILE__) . "/iemail_message.class.php");
require_once(dirname(__FILE__) . "/imailer.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");
require_once(dirname(__FILE__) . "/site_config_factory.class.php");

require_once(dirname(__FILE__) . "/../lib/Twig-1.24.0/Twig-1.24.0/lib/Twig/Autoloader.php");
require_once(dirname(__FILE__) . "/../lib/PHPMailer-5.2.21/PHPMailerAutoload.php");


class ContactMessageMailer implements IMailer {
    public function send(IEmailMessage $contactmsg) {
        $mail = new PHPMailer;
        
        \Twig_Autoloader::register();
        $loader = new \Twig_Loader_Filesystem(dirname(__FILE__) . "/../templates");
        $twig = new \Twig_Environment($loader, array());
        
        $host = \SiteConfigFactory::get()->get_site_config()->host();
        $db = \DBIF::get();
        
        $mail_user = $db->get_mail_user();
        $mail->Port = 25;
        if (strlen($mail_user) > 0) { // username can also just indicate SMTP
            $mail->isSMTP();
            $mail->Host = $db->get_mail_server();
            $mail_password = $db->get_mail_password();
            if (strlen($mail_password) > 0) {
                $mail->SMTPAuth = true;
                $mail->Username = $mail_user;
                $mail->Password = $mail_password;
                $mail->Port = 587;
            }
        }
        

        $mail->addReplyTo($contactmsg->get_email(), $contactmsg->get_name());
        $mail->setFrom('contactform@{$host}', 'LU-PA Contact Form');
        $mail->addAddress($db->get_contact_email());     // Add a recipient
        $mail->isHTML(true);                                  // Set email format to HTML
    
        $mail->CharSet = 'UTF-8';
        $mail->Subject = "LU-PA-CONTACT: {$contactmsg->get_subject()}";
        $mail->Body    = $twig->render("contact_email.html", array("message" => $contactmsg));
        $mail->AltBody = $twig->render("contact_email.txt", array("message" => $contactmsg));

        if(!$mail->send()) {
            throw new \RuntimeException("Failed to send contact mail. Mail error: {$mail->ErrorInfo}");
        }
    }
}
