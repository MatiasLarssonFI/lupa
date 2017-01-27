<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../site_config_factory.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../slide_factory.class.php");
require_once(dirname(__FILE__) . "/../service_factory.class.php");


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
                "services_title" => $text_storage->text("FRONT_PAGE_SERVICES_TITLE"),
                "slideshow_caption_title" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TITLE"),
                "slideshow_caption_paragraph" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TEXT"),
                "contact_us" => $text_storage->text("CONTACT_US"),
            ),
            "slides" => \SlideFactory::get()->get_front_page_slides(),
            "services" => \ServiceFactory::get()->get_services(),
            "facebook_page_url" => \DBIF::get()->get_facebook_page_url(),
        );
    }
    
    
    protected function is_mobile_scale_enabled() {
        return false;
    }
}
