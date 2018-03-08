<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../site_config_factory.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../slide_factory.class.php");
require_once(dirname(__FILE__) . "/../service_factory.class.php");
require_once(dirname(__FILE__) . "/../video_factory.class.php");


class FrontPageView extends AbstractView {
    protected function get_required_params() {
        return array();
    }
    
    
    protected function get_template_name() {
        return "front_page.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $videos = \VideoFactory::get()->get_front_page_videos();
        return array(
            "strings" => array(
                "page_title" => $text_storage->text("FRONT_PAGE_TITLE"),
                "services_title" => $text_storage->text("FRONT_PAGE_SERVICES_TITLE"),
                "services_subtitle" => $text_storage->text("FRONT_PAGE_SERVICES_SUBTITLE"),
                "videos_title" => $text_storage->text("FRONT_PAGE_VIDEOS_TITLE"),
                "videos_subtitle" => $text_storage->text("FRONT_PAGE_VIDEOS_SUBTITLE"),
                "contact_title" => $text_storage->text("FRONT_PAGE_CONTACT_TITLE"),
                "slideshow_caption_title" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TITLE"),
                "slideshow_caption_paragraph" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TEXT"),
                "contact_us" => $text_storage->text("CONTACT_US"),
                "field_name" => $text_storage->text("CONTACT_FIELD_NAME"),
                "field_email" => $text_storage->text("CONTACT_FIELD_EMAIL"),
                "field_subject" => $text_storage->text("CONTACT_FIELD_SUBJECT"),
                "field_message" => $text_storage->text("CONTACT_FIELD_MESSAGE"),
                "submit" => $text_storage->text("CONTACT_SUBMIT"),
            ),
            "prefill" => array(
                "name" => "",
                "email" => "",
                "subject" => "",
                "message" => "",
                "url" => "", // hidden captcha
                "company" => "company name oy", // hidden captcha
            ),
            "services" => \ServiceFactory::get()->get_services(),
            "selected_video" => !empty($videos) ? reset($videos) : null,
            "videos" => $videos,
        );
    }
}
