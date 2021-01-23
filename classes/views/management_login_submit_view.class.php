<?php

namespace Views;

require_once(__DIR__ . "/abstract_view.class.php");
require_once(__DIR__ . "/../session_var.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../management_session.class.php");
require_once(__DIR__ . "/../session.class.php");
require_once(__DIR__ . "/../counter_attack.class.php");
require_once(__DIR__ . "/../hook/mediator.class.php");


class ManagementLoginSubmitView extends AbstractView {
    protected function get_required_params() {
        return [ "__csrf_token", "password", "username", "is_ajax", "url", "company" ];
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
        $errors = [];
        $login_messages = [];
        if (strlen($params["url"]) === 0 && // url is actually a hidden captcha field, not to be filled
            $params["company"] === "company name oy") { // hidden captcha as well
            $errors = $this->get_form_errors($params, $text_storage);
            if (empty($errors)) {
                \Session::get()->logout();
                $ms = \ManagementSession::get();
                $ms->logout();
                $is_success = $ms->login();
                if ($is_success) {
                    $ms->set_data(\SessionVar::MANAGEMENT_PERMISSION, 1);
                    $login_messages = $this->make_login_messages();
                } else {
                    $errors["generic"] = $text_storage->text("MANAGEMENT_LOGIN_GENERIC_ERROR");
                }
            }
        } else {
            $ms = \ManagementSession::get();
            $session = $ms->has_data(\SessionVar::MANAGEMENT_PERMISSION) ? $ms : \Session::get();
            \CounterAttack::get()->handle(new \Attack\CaptchaFail("Login submit", $session, $params));
        }
        
        return [
            "strings" => [
                "page_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "success_text" => $text_storage->text("MANAGEMENT_LOGIN_SUCCESS"),
                "select_prompt" => $text_storage->text("MANAGEMENT_LOGIN_SELECT_PROMPT"),
                "submit" => $text_storage->text("MANAGEMENT_LOGIN_SUBMIT"),
                "field_password" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_PASSWORD"),
                "field_user" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_USERNAME"),
                "table_view" => $text_storage->text("MANAGEMENT_WORK_LIST_TABLE_VIEW"),
                "list_view" => $text_storage->text("MANAGEMENT_WORK_LIST_LIST_VIEW"),
            ],
            "login_messages" => $login_messages,
            "prefill" => $params,
            "errors" => $errors,
            "is_ajax" => (bool)$params["is_ajax"],
            "is_success" => $is_success,
        ];
    }
    
    
    private function make_login_messages() {
        $msgs = \Hook\Mediator::get()->notify("login.management.success")->get_messages();
        $ret = [];
        
        foreach ($msgs as $msg) {
            foreach (explode(PHP_EOL, $msg) as $line) {
                $ret[] = $line;
            }
        }
        
        return $ret;
    }
    
    
    private function get_form_errors(array $form, \UITextStorage $text_storage) {
        $errors = [];
        $ms = \ManagementSession::get();
        $session = $ms->has_data(\SessionVar::MANAGEMENT_PERMISSION) ? $ms : \Session::get();
        $user_ok = false;
        $csrf_ok = false;
        $user = $form["username"] ?? "";
        $last_failed_ts = 0;
        $retry_delay_s = 10;
        
        $validators = [
            "__csrf_token" => function($token) use ($session, &$csrf_ok, $form) {
                $csrf_ok = (strlen($token) > 16 && $token === $session->get_csrf_token());
                if (!$csrf_ok) {
                    \CounterAttack::get()->handle(new \Attack\CSRF("Login submit", $session, $form));
                }
                return $csrf_ok;
            },
            "username" => function($str) use (&$user_ok, &$last_failed_ts, $retry_delay_s, &$csrf_ok) {
                if (!$csrf_ok) return true;
                
                // enforce delay between login retries
                
                $len = strlen($str);
                if ($len > 0 && $len < 255) {
                    $last_failed_ts = \DBIF::get()->get_user_last_failed_login_ts($str);
                    if ($last_failed_ts) {
                        $ts_unix = strtotime($last_failed_ts);
                        $user_ok = time() >= $ts_unix + $retry_delay_s;
                        return $user_ok;
                    }
                }
                
                $user_ok = true;
                return true;
            },
            "password" => function($str) use (&$user_ok, &$user, &$csrf_ok) {
                if (!$csrf_ok) return true;
                
                // validate user existence and password (only if retry delay was OK)
                
                $len = strlen($str);
                if ($len > 0 && $len < 255 && $user_ok) {
                    $hash = \DBIF::get()->get_user_password_hash($user);
                    $ok = $hash && password_verify($str, $hash);
                    if (!$ok) {
                        \DBIF::get()->update_user_last_failed_login_ts($user);
                    }
                    return $ok;
                }
                return !$user_ok; // no GUI error if another one already present
            },
        ];
        $formatters = [
            "username" => function($msg) use(&$last_failed_ts, $retry_delay_s) {
                return sprintf($msg, (strtotime($last_failed_ts) + $retry_delay_s) - time());
            },
        ];
        
        $errstr = [];
        foreach ($this->get_required_params() as $param) {
            $param_upper = strtoupper($param);
            $errstr[$param] = $text_storage->text("MANAGEMENT_LOGIN_FIELD_ERROR_{$param_upper}");
        }
        
        foreach ($validators as $field => $f) {
            if (!$f($form[$field])) {
                $errors[$field] = $errstr[$field];
                if (array_key_exists($field, $formatters)) {
                    $errors[$field] = $formatters[$field]($errors[$field]);
                }
            }
        }
        
        return $errors;
    }
}
