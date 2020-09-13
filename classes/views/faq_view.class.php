<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../faq_factory.class.php");


class FAQView extends AbstractView {
    protected function get_required_params() {
        return [];
    }
    
    
    protected function allow_cache() {
        return true;
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
            "answers" => \FAQFactory::get()->get_answers(),
        );
    }
}
