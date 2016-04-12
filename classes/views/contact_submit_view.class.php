<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
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
        if (strlen($params["url"]) === 0) { // url is actually a hidden captcha field, not to be filled
            $errors = $this->get_form_errors($params, $text_storage);
            if (empty($errors)) {
                \DBIF::get()->insert_contact_message($params["name"], $params["email"], $params["subject"], $params["message"]);
                $is_success = true;
            }
        }
        
        return array(
            "strings" => array(
                "success_text" => $text_storage->text("CONTACT_SUBMIT_TEXT"),
                "page_title" => $text_storage->text("CONTACT_TITLE"),
                "field_name" => $text_storage->text("CONTACT_FIELD_NAME"),
                "field_email" => $text_storage->text("CONTACT_FIELD_EMAIL"),
                "field_subject" => $text_storage->text("CONTACT_FIELD_SUBJECT"),
                "field_message" => $text_storage->text("CONTACT_FIELD_MESSAGE"),
                "submit" => $text_storage->text("CONTACT_SUBMIT")
            ),
            "prefill" => $params,
            "errors" => $errors,
            "is_ajax" => (bool)$params["is_ajax"],
            "is_success" => $is_success,
            "lang" => $text_storage->get_language()
        );
    }
    
    
    private function get_form_errors(array $form, \UITextStorage $text_storage) {
        $errors = array();
        $validators = array(
            "name" => "strlen",
            "email" => function($email) {
                $at_pos = strpos($email, "@");
                $len = strlen($email);
                return $at_pos !== false &&
                        $at_pos !== 0 &&
                        $at_pos !== $len - 1 &&
                        $len > 3;
            },
            "subject" => "strlen",
            "message" => function($message) {
                return strlen($message) > 3;
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