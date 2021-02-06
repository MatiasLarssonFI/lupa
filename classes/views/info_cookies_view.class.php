<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../info_page_content_factory.class.php");


class InfoCookiesView extends AbstractView {
    protected function get_required_params() {
        return [ "uri", ];
    }
    
    
    protected function get_template_name() {
        return "info_cookies.html";
    }
    
    
    protected function allow_cache() {
        return true;
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $f = \InfoPageContentFactory::get();
        $contents = $f->get_cookie_contents($params["uri"]);
        return [
            "strings" => array(
                "page_title" => $this->first_title_or($contents, $text_storage->text("INFO_COOKIES_PAGE_TITLE")),
                "consent_open_btn" => $text_storage->text("COOKIE_CONSENT_OPEN_LABEL"),
            ),
            "contents" => $contents,
            "allow_hreflang" => false,
        ];
    }
    
    
    /**
     * Returns the title of first IInfoPageContent or $str.
     * @param IInfoPageContent[] $contents
     * @param string $str default return value
     */
    private function first_title_or(array $contents, $str) {
        if (!empty($contents)) {
            return $contents[0]->get_html_title();
        }
        return $str;
    }
}
