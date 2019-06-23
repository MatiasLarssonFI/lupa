<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../contact_message_factory.class.php");
require_once(dirname(__FILE__) . "/../session.class.php");
require_once(dirname(__FILE__) . "/../dbif.class.php");


class ContactSubmitView extends AbstractView {
    protected function get_required_params() {
        return array("__csrf_token", "name", "email", "subject", "message", "is_ajax", "url");
    }
    
    
    protected function get_template_name() {
        return "contact_submit.html";
    }
    
    
    protected function get_view_data(array $params) {
        $is_success = false;
        $text_storage = \UITextStorage::get();
        $errors = array();
        if (strlen($params["url"]) === 0 && // url is actually a hidden captcha field, not to be filled
            strlen($params["company"] === "company name oy")) { // hidden captcha as well
            $errors = $this->get_form_errors($params, $text_storage);
            if (empty($errors)) {
                $f = \ContactMessageFactory::get();
                $message = $f->make_from_values($params["name"], $params["email"], $params["subject"], $params["message"]);
                $mailer = $f->get_mailer();
                \DBIF::get()->insert_contact_message($message);
                $mailer->send($message);
                $is_success = true;
            }
        }
        
        return array(
            "strings" => array(
                "success_text" => $text_storage->text("CONTACT_SUBMIT_TEXT"),
                "page_title" => $text_storage->text("CONTACT_TITLE"),
            ),
            "prefill" => $params,
            "errors" => $errors,
            "is_ajax" => (bool)$params["is_ajax"],
            "is_success" => $is_success,
        );
    }
    
    
    private function get_form_errors(array $form, \UITextStorage $text_storage) {
        $errors = array();
        $session = \Session::get();
        $validators = array(
            "__csrf_token" => function($token) use ($session) {
                return $session->validate_csrf_token($token);
            },
            "name" => function($str) {
                $len = strlen($str);
                return $len > 0 && $len <= 255;
            },
            "email" => function($email) {
                $at_pos = strpos($email, "@");
                $len = strlen($email);
                return $at_pos !== false &&
                        $at_pos !== 0 &&
                        $at_pos !== $len - 1 &&
                        $len > 3 && $len <= 255;
            },
            "subject" => function($str) {
                $len = strlen($str);
                return $len > 0 && $len <= 255;
            },
            "message" => function($message) {
                return strlen($message) > 3 && strlen($message) <= 4000;
            }
        );
        
        $errstr = array();
        foreach ($this->get_required_params() as $param) {
            $param_upper = strtoupper($param);
            $errstr[$param] = $text_storage->text("CONTACT_FIELD_ERROR_{$param_upper}");
        }
        
        foreach ($validators as $field => $f) {
            if (!$f($form[$field])) {
                $errors[$field] = $errstr[$field];
            }
        }
        
        return $errors;
    }
}
