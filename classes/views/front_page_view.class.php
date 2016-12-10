<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../site_config_factory.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");


class FrontPageView extends AbstractView {
    protected function get_required_params() {
        return array();
    }
    
    
    protected function get_template_name() {
        return "front_page.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        return array(
            "strings" => array(
                "page_title" => $text_storage->text("FRONT_PAGE_TITLE"),
                "promo_text" => $text_storage->text("FRONT_PAGE_PROMO")
            ),
            "logo_url" => \SiteConfigFactory::get()->get_site_config()->base_uri() . 
                            "/data/img/front-logo.png",
            "lang" => $text_storage->get_language()
        );
    }
}
