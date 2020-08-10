<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../management_session.class.php");
require_once(dirname(__FILE__) . "/../session.class.php");


class ManagementLoginSubmitView extends AbstractView {
    protected function get_required_params() {
        return [ "__csrf_token", "password", "is_ajax", "url", "company" ];
    }
    
    
    protected function get_template_name() {
        return "management_login_submit.html";
    }
    
    
    protected function allow_tracking() {
        return false;
    }
    
    
    protected function get_view_data(array $params) {
        $is_success = false;
        $text_storage = \UITextStorage::get();
        $errors = array();
        if (strlen($params["url"]) === 0 && // url is actually a hidden captcha field, not to be filled
            $params["company"] === "company name oy") { // hidden captcha as well
            $errors = $this->get_form_errors($params, $text_storage);
            if (empty($errors)) {
                \Session::get()->logout();
                $ms = \ManagementSession::get();
                $ms->logout();
                $is_success = $ms->login();
                if (!$is_success) {
                    $errors["generic"] = $text_storage->text("MANAGEMENT_LOGIN_GENERIC_ERROR");
                }
            }
        }
        
        return array(
            "strings" => array(
                "page_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "success_text" => $text_storage->text("MANAGEMENT_LOGIN_SUCCESS"),
                "select_prompt" => $text_storage->text("MANAGEMENT_LOGIN_SELECT_PROMPT"),
                "submit" => $text_storage->text("MANAGEMENT_LOGIN_SUBMIT"),
                "field_password" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_PASSWORD"),
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
            "password" => function($str) {
                $len = strlen($str);
                // TBD
                return $len > 0 && $len < 64 && hash("sha256", "{$str}treehelp") === "b2cf9e5b6d2f066c0bc18125a14f9b65c7b5669a04e996871a2883fca931707f";
            },
        );
        
        $errstr = array();
        foreach ($this->get_required_params() as $param) {
            $param_upper = strtoupper($param);
            $errstr[$param] = $text_storage->text("MANAGEMENT_LOGIN_FIELD_ERROR_{$param_upper}");
        }
        
        foreach ($validators as $field => $f) {
            if (!$f($form[$field])) {
                $errors[$field] = $errstr[$field];
            }
        }
        
        return $errors;
    }
}
