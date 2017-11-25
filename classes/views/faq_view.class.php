<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");


class FAQView extends AbstractView {
    protected function get_required_params() {
        return [];
    }
    
    
    protected function get_template_name() {
        return "faq.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        return array(
            "strings" => array(
                "page_title" => $text_storage->text("FAQ_TITLE"),
            ),
            "lang" => $text_storage->get_language(),
        );
    }
}
