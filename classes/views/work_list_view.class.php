<?php

namespace Views;

require_once(__DIR__ . "/abstract_management_view.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../work_item_factory.class.php");
require_once(__DIR__ . "/../dbif.class.php");
require_once(__DIR__ . "/../action_factory.class.php");


class WorkListView extends AbstractManagementView {
    private $_is_table;
    
    
    public function __construct(array $params, \NavLinkFactory $nlf, $is_table) {
        parent::__construct($params, $nlf);
        $this->_is_table = $is_table;
    }
    
    protected function get_required_params() {
        return [ "state_filter", "order_col", "order_dir", "page" ];
    }
    
    
    protected function get_template_name() {
        return $this->_is_table ? "work_table.html" : "work_list.html";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $wif = \WorkItemFactory::get();
        $param_state_filter = $params["state_filter"];
        $is_archive = $param_state_filter === \WorkItemFactory::ARCHIVE;
        $is_valid_state_filter = $wif->is_valid_state($param_state_filter);
        if ($is_archive) {
            $title = $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_ARCHIVED");
        } else {
            $title = $is_valid_state_filter ?
                $text_storage->text("MANAGEMENT_WORK_LIST_TITLE_" . strtoupper($param_state_filter))
                : $text_storage->text("MANAGEMENT_WORK_LIST_TITLE");
        }
        
        $item_counts = [
            \WorkItemFactory::STATE_NEW => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_NEW),
            \WorkItemFactory::STATE_IN_PROGRESS => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_IN_PROGRESS),
            \WorkItemFactory::STATE_FINISHED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_FINISHED),
            \WorkItemFactory::STATE_HALTED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_HALTED),
            \WorkItemFactory::ARCHIVE => \DBIF::get()->count_work_items(\WorkItemFactory::ARCHIVE),
        ];
        
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
                ],
                "subject_reference_short" => $text_storage->text("MANAGEMENT_WORK_LIST_SUBJECT_REFERENCE_LABEL_SHORT"),
                
                "mass_action_label" => $text_storage->text("MANAGEMENT_WORK_LIST_MASS_ACTION_LABEL"),
                "mass_submit_button" => $text_storage->text("MANAGEMENT_WORK_LIST_MASS_ACTION_SUBMIT"),
                "state_links_label" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_LINKS_LABEL"),
                
                "label_name" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_NAME"),
                "label_email" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_EMAIL"),
                "label_subject" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_SUBJECT"),
                "label_message" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_MESSAGE"),
                "label_notes" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_NOTES"),
                "label_created" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_CREATED"),
                "label_changed" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_CHANGED"),
                
                "label_page_number" => $text_storage->text("MANAGEMENT_WORK_LIST_PAGE_NUMBER"),
                
                "table_view" => $text_storage->text("MANAGEMENT_WORK_LIST_TABLE_VIEW"),
                "list_view" => $text_storage->text("MANAGEMENT_WORK_LIST_LIST_VIEW"),
                "csv_export_link" => $text_storage->text("MANAGEMENT_WORK_LIST_CSV_EXPORT_LINK"),
            ],
            "items" => $wif->yield_items($param_state_filter, $params["order_col"], $params["order_dir"], (int)$params["page"]),
            "state_filter" => $is_valid_state_filter ? $param_state_filter : "",
            "is_archive" => $is_archive,
            "item_counts" => $item_counts,
            "page" => (int)$params["page"],
            "page_count" => array_key_exists($param_state_filter, $item_counts) ? ceil($item_counts[$param_state_filter] / \WorkItemFactory::PAGE_SIZE) : 0,
            "state_actions" => \WorkItemFactory::state_actions(),
            "order_col" => $wif->is_valid_order_col($params["order_col"]) ? $params["order_col"] : "",
            "order_dir" => $wif->is_valid_order_direction($params["order_dir"]) ? $params["order_dir"] : "",
            "logout_action" => \ActionFactory::get()->get_management_logout_submit_action(),
        ];
    }
}
