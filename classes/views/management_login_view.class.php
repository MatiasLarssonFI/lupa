<?php

namespace Views;

require_once(__DIR__ . "/abstract_view.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../session_var.class.php");
require_once(__DIR__ . "/../action_factory.class.php");


class ManagementLoginView extends AbstractView {
    protected function get_required_params() {
        return [];
    }
    
    
    protected function get_template_name() {
        return "management_login.html";
    }
    
    
    protected function allow_tracking() {
        return false;
    }
    
    
    protected function allow_cache() {
        return true;
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $af = \ActionFactory::get();
        
        if (\ManagementSession::get()->has_data(\SessionVar::MANAGEMENT_PERMISSION)) {
            // already logged in
            header("HTTP/1.1 303 See Other");
            header("Location: " . \SiteConfigFactory::get()->get_site_config()->base_uri() .
                   "/{$text_storage->get_language()}/{$af->get_primary_management_action()}");
        }
        
        return [
            "strings" => [
                "page_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "login_form_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "submit" => $text_storage->text("MANAGEMENT_LOGIN_SUBMIT"),
                "field_password" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_PASSWORD"),
                "field_user" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_USERNAME"),
            ],
            "lang" => $text_storage->get_language(),
        ];
    }
}
