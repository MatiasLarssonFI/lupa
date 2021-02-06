<?php

require_once(__DIR__ . "/iemail_message.class.php");
require_once(__DIR__ . "/imailer.class.php");
require_once(__DIR__ . "/dbif.class.php");
require_once(__DIR__ . "/site_config_factory.class.php");

require_once(__DIR__ . "/../lib_autoload.php");
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
        
        $sc = \SiteConfigFactory::get()->get_site_config();
        
        $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . "/../templates");
        $twig_opt = $sc->twig_compilation_cache_path() !== null
                ? [ "cache" => $sc->twig_compilation_cache_path(), ]
                : [];
        $twig = new \Twig\Environment($loader, $twig_opt);
        
        $host = $sc->host();
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
        
        $html_tmpl = $twig->load($contactmsg->get_html_template_name());
        $text_tmpl = $twig->load($contactmsg->get_text_template_name());
        
        $mail->addReplyTo($contactmsg->get_reply_to_address(), $contactmsg->get_reply_to_name());
        // note that $mail->setFrom() does not really work (on PHPMailer 5.2 anyway)
        $mail->From = $contactmsg->get_sender_address();
        $mail->FromName = $contactmsg->get_sender_name();
        $mail->addAddress($contactmsg->get_recipient_address());
        $mail->isHTML(true);
        
        $mail->CharSet = PHPMailer::CHARSET_UTF8;
        $mail->Subject = $contactmsg->get_subject_line();
        $mail->Body    = $html_tmpl->render([ "message" => $contactmsg->get_message_data() ]);
        $mail->AltBody = $text_tmpl->render([ "message" => $contactmsg->get_message_data() ]);

        if(!$mail->send()) {
            throw new \RuntimeException("Failed to send contact form e-mail.");
        }
    }
}
