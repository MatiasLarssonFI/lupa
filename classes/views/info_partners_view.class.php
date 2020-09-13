<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../info_page_content_factory.class.php");


class InfoPartnersView extends AbstractView {
    protected function get_required_params() {
        return array("uri");
    }
    
    
    protected function get_template_name() {
        return "info_partners.html";
    }
    
    
    protected function allow_cache() {
        return true;
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $f = \InfoPageContentFactory::get();
        $contents = $f->get_partners_contents($params["uri"]);
        return array(
            "strings" => array(
                "page_title" => $this->first_title_or($contents, $text_storage->text("INFO_PARTNERS_PAGE_TITLE")),
            ),
            "contents" => $contents,
            "allow_hreflang" => false,
        );
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
