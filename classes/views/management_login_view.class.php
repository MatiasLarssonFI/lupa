<?php

namespace Views;

require_once(__DIR__ . "/abstract_view.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");


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
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        return [
            "strings" => [
                "page_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "login_form_title" => $text_storage->text("MANAGEMENT_LOGIN_TITLE"),
                "submit" => $text_storage->text("MANAGEMENT_LOGIN_SUBMIT"),
                "field_password" => $text_storage->text("MANAGEMENT_LOGIN_FIELD_PASSWORD"),
            ],
            "lang" => $text_storage->get_language(),
        ];
    }
}
