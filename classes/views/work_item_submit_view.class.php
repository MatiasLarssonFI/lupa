<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../session.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../work_item_factory.class.php");


class WorkItemSubmitView extends AbstractView {
    protected function get_required_params() {
        return [ "item", "action", "notes", "is_ajax", "__csrf_token" ];
    }
    
    
    protected function get_required_session_params() {
        return [ "perm_work_list" ];
    }
    
    
    protected function get_template_name() {
        return "work_item_submit.json";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $is_success = false;
        
        if (\Session::get()->validate_csrf_token($params["__csrf_token"])) {
            $wif = \WorkItemFactory::get();
            $action = $params["action"];
            $notes = $params["notes"];
            
            $item = $wif->getActionableItem((int)$params["item"]);
            $notes_success = $notes === $item->get_notes();
            if (!$notes_success && mb_strlen($notes) < 2048) {
                $item->set_notes($notes);
                $notes_success = true;
            }
            if ($action === strtolower($item->get_state_action())) {
                $is_success = $item->try_perform_state_action();
            } else if (in_array($action, [ "halt", "archive" ])) {
                $is_success = $action === "halt" ? $item->try_perform_halt() : $item->try_perform_archive();
            } else if ($action === "notes") {
                $is_success = $notes_success;
                \DBIF::get()->update_work_item($item, false);
            }
        }
        
        header("Content-Type: application/json");
        
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
                "notes_success" => $notes_success,
            ])
        ];
    }
}
