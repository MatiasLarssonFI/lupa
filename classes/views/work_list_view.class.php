<?php

namespace Views;

require_once(__DIR__ . "/abstract_management_view.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../work_item_factory.class.php");
require_once(__DIR__ . "/../dbif.class.php");


class WorkListView extends AbstractManagementView {
    private $_is_table;
    
    
    public function __construct(array $params, \NavLinkFactory $nlf, $is_table) {
        parent::__construct($params, $nlf);
        $this->_is_table = $is_table;
    }
    
    protected function get_required_params() {
        return [ "state_filter", "order_col", "order_dir" ];
    }
    
    
    protected function get_template_name() {
        return $this->_is_table ? "work_table.html" : "work_list.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $wif = \WorkItemFactory::get();
        $is_archive = $params["state_filter"] === \WorkItemFactory::ARCHIVE;
        $is_valid_state_filter = $wif->is_valid_state($params["state_filter"]);
        if ($is_archive) {
            $title = $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_ARCHIVED");
        } else {
            $title = $is_valid_state_filter ?
                $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_" . strtoupper($params["state_filter"]))
                : $text_storage->text("MANAGEMENT_WORK_LIST_TITLE");
        }
        
        return [
            "strings" => [
                "page_title" => $title,
                "state" => [
                    "new" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_NEW"),
                    "in_progress" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_IN_PROGRESS"),
                    "finished" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_FINISHED"),
                    "halted" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_HALTED"),
                    "archived" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_ARCHIVED"),
                ],
                "action" => [
                    "archive" => $text_storage->text("MANAGEMENT_WORK_LIST_ACTION_ARCHIVE"),
                    "halt" => $text_storage->text("MANAGEMENT_WORK_LIST_ACTION_HALT"),
                ]
            ],
            "items" => $wif->yield_items($params["state_filter"], $params["order_col"], $params["order_dir"]),
            "state_filter" => $is_valid_state_filter ? $params["state_filter"] : "",
            "is_archive" => $is_archive,
            "item_counts" => [
                \WorkItemFactory::STATE_NEW => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_NEW),
                \WorkItemFactory::STATE_IN_PROGRESS => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_IN_PROGRESS),
                \WorkItemFactory::STATE_FINISHED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_FINISHED),
                \WorkItemFactory::STATE_HALTED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_HALTED),
                \WorkItemFactory::ARCHIVE => \DBIF::get()->count_work_items(\WorkItemFactory::ARCHIVE),
            ],
            "order_col" => $wif->is_valid_order_col($params["order_col"]) ? $params["order_col"] : "",
            "order_dir" => $wif->is_valid_order_direction($params["order_dir"]) ? $params["order_dir"] : "",
        ];
    }
}
