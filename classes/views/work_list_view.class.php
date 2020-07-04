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
        $is_archive = $params["state_filter"] === \WorkItemFactory::ARCHIVE;
        if ($is_archive) {
            $title = $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_ARCHIVED");
        } else {
            $title = $wif->is_valid_state($params["state_filter"]) ? $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_" . strtoupper($params["state_filter"])) : $text_storage->text("MANAGEMENT_WORK_LIST_TITLE");
        }
        
        return [
            "strings" => [
                "page_title" => $title,
            ],
            "items" => $wif->yield_items($params["state_filter"], $params["order_col"], $params["order_dir"]),
            "state_filter" => $params["state_filter"],
            "is_archive" => $is_archive,
            "item_counts" => [
                \WorkItemFactory::STATE_NEW => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_NEW),
                \WorkItemFactory::STATE_IN_PROGRESS => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_IN_PROGRESS),
                \WorkItemFactory::STATE_FINISHED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_FINISHED),
                \WorkItemFactory::STATE_HALTED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_HALTED),
                \WorkItemFactory::ARCHIVE => \DBIF::get()->count_work_items(\WorkItemFactory::ARCHIVE),
            ],
            "order_col" => $params["order_col"],
            "order_dir" => $params["order_dir"],
            "allow_hreflang" => false,
        ];
    }
}
