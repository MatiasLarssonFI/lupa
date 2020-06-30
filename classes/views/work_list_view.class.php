<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../work_item_factory.class.php");


class WorkListView extends AbstractView {
    private $_is_table;
    
    
    public function __construct(array $params, \NavLinkFactory $nlf, $is_table) {
        parent::__construct($params, $nlf);
        $this->_is_table = $is_table;
    }
    
    protected function get_required_params() {
        return [ "state_filter", "order_col", "order_dir" ];
    }
    
    
    protected function get_required_session_params() {
        return [ "perm_work_list" ];
    }
    
    
    protected function get_template_name() {
        return $this->_is_table ? "work_table.html" : "work_list.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $wif = \WorkItemFactory::get();
        
        // TBD: archive filter
        
        return [
            "strings" => [
                "page_title" => $wif->is_valid_state($params["state_filter"]) ? $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_" . strtoupper($params["state_filter"])) : $text_storage->text("MANAGEMENT_WORK_LIST_TITLE"),
            ],
            "items" => $wif->yield_items($params["state_filter"], $params["order_col"], $params["order_dir"]),
            "state_filter" => $params["state_filter"],
            "order_col" => $params["order_col"],
            "order_dir" => $params["order_dir"],
            "allow_hreflang" => false,
        ];
    }
}
