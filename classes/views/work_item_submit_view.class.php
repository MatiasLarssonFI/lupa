<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../work_item_factory.class.php");


class WorkItemSubmitView extends AbstractView {
    protected function get_required_params() {
        return [ "item", "action", "notes", "is_ajax" ];
    }
    
    
    protected function get_required_session_params() {
        return [ "perm_work_list" ];
    }
    
    
    protected function get_template_name() {
        return "work_item_submit.json";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $wif = \WorkItemFactory::get();
        $action = $params["action"];
        $notes = $params["notes"];
        
        $is_success = false;
        $item = $wif->getActionableItem((int)$params["item"]);
        if (strlen($notes) > 0 && mb_strlen($notes) < 2048) {
            $item->set_notes($notes);
        }
        if ($action === strtolower($item->get_state_action())) {
            $is_success = $item->try_perform_state_action();
        } else if (in_array($action, [ "halt", "archive" ])) {
            $is_success = $action === "halt" ? $item->try_perform_halt() : $item->try_perform_archive();
        }
        
        return [
            "json" => json_encode([
                "is_ajax" => (bool)$params["is_ajax"],
                "item_counts" => [
                    \WorkItemFactory::STATE_NEW => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_NEW),
                    \WorkItemFactory::STATE_IN_PROGRESS => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_IN_PROGRESS),
                    \WorkItemFactory::STATE_FINISHED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_FINISHED),
                    \WorkItemFactory::STATE_HALTED => \DBIF::get()->count_work_items(\WorkItemFactory::STATE_HALTED),
                    \WorkItemFactory::ARCHIVE => \DBIF::get()->count_work_items(\WorkItemFactory::ARCHIVE),
                ],
                "is_success" => $is_success,
            ])
        ];
    }
}
