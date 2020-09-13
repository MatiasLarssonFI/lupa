<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../service_factory.class.php");

class ServiceView extends AbstractView {
    protected function get_required_params() {
        return array();
    }
    
    
    protected function get_template_name() {
        return "services.html";
    }
    
    
    protected function allow_cache() {
        return true;
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        return array(
            "strings" => array(
                "page_title" => $text_storage->text("SERVICES_TITLE")
            ),
            "services" => \ServiceFactory::get()->get_services(),
            "lang" => $text_storage->get_language()
        );
    }
}
