<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_management_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../action_factory.class.php");
require_once(dirname(__FILE__) . "/../counter_attack.class.php");


class ManagementLogoutSubmitView extends AbstractManagementView {
    protected function get_required_params() {
        return [ "__csrf_token" ];
    }
    
    
    protected function get_template_name() {
        return "management_logout_success.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $af = \ActionFactory::get();
        
        if ($this->validate_csrf_token($params["__csrf_token"])) {
            $this->get_session()->logout();
        } else {
            \CounterAttack::get()->handle(new \Attack\CSRF("Logout", $this->get_session(), $params));
        }
        
        header("HTTP/1.1 303 See Other");
        header("Location: " . \SiteConfigFactory::get()->get_site_config()->base_uri() .
               "/{$text_storage->get_language()}/{$af->get_management_login_action()}");
        
        return [];
    }
    
    
    private function validate_csrf_token($token) {
        return strlen($token) > 16 && $token === $this->get_session()->get_csrf_token();
    }
}
