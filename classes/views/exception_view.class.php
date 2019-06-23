<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");


class ExceptionView extends AbstractView {
    protected function get_required_params() {
        return array("exception", "is_ajax");
    }
    
    
    protected function get_template_name() {
        return "exception.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        return array(
            "strings" => array(
                "page_title" => "Error",
                "description" => base64_encode($params["exception"]->getMessage()),
                "general_message" => $text_storage->text("GENRAL_ERROR_MESSAGE"),
            ),
            "is_ajax" => (bool)$params["is_ajax"]
        );
    }
}
