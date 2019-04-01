<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../info_page_content_factory.class.php");


class InfoFellingView extends AbstractView {
    protected function get_required_params() {
        return array("uri");
    }
    
    
    protected function get_template_name() {
        return "info_felling.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $contents = \InfoPageContentFactory::get()->get_felling_contents($params["uri"]);
        return array(
            "strings" => array(
                "page_title" => $this->first_title_or($contents, $text_storage->text("INFO_FELLING_PAGE_TITLE")),
                "contact_us" => $text_storage->text("CONTACT_US"),
            ),
            "contents" => $contents,
        );
    }
    
    
    /**
     * Returns the title of first IInfoPageContent or $str.
     * @param IInfoPageContent[] $contents
     * @param string $str default return value
     */
    private function first_title_or(array $contents, $str) {
        if (!empty($contents)) {
            return $contents[0]->get_title();
        }
        return $str;
    }
}
