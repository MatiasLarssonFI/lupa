<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../work_item_factory.class.php");


class WorkListView extends AbstractView {
    protected function get_required_params() {
        return [ "state_filter", "order_col", "order_dir" ];
    }
    
    
    protected function get_required_session_params() {
        return [ "perm_work_list" ];
    }
    
    
    protected function get_template_name() {
        return "work_list.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $wif = \WorkItemFactory::get();
        
        return [
            "strings" => [
                "page_title" => $wif->is_valid_state($params["state_filter"]) ? $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_" . strtoupper($params["state_filter"])) : $text_storage->text("MANAGEMENT_WORK_LIST_TITLE"),
            ],
            "items" => $wif->yield_items($params["state_filter"], $params["order_col"], $params["order_dir"]),
            "state_filter" => $params["state_filter"],
            "order_col" => $params["order_col"],
            "order_dir" => $params["order_dir"],
        ];
    }
}
