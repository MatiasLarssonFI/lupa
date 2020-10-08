<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_management_view.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../work_item_factory.class.php");
require_once(dirname(__FILE__) . "/../counter_attack.class.php");


class WorkItemMassSubmitView extends AbstractManagementView {
    protected function get_required_params() {
        return [ "items", "action", "is_ajax", "__csrf_token" ];
    }
    
    
    protected function get_template_name() {
        return "work_item_mass_submit.json";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $error_ids = [];
        $error_messages = [];
        
        if ($this->validate_csrf_token($params["__csrf_token"])) {
            $wif = \WorkItemFactory::get();
            $action = $params["action"];
            
            foreach ($params["items"] as $item_id) {
                try {
                    $is_success = false;
                    $item = $wif->get_actionable_item($item_id);
                    if ($action === strtolower($item->get_state_action())) {
                        $is_success = $item->try_perform_state_action();
                    } else if (in_array($action, [ "halt", "archive" ])) {
                        $is_success = ($action === "halt" ? $item->try_perform_halt() : $item->try_perform_archive());
                    }
                    if (!$is_success) {
                        throw new \RuntimeException("Action failed");
                    }
                } catch (\Exception $e) {
                    $error_ids[] = $item_id;
                    $error_messages["i{$item_id}"] = $e->getMessage(); // force associative array (for JSON encode)
                }
            }
        } else {
            \CounterAttack::get()->handle(new \Attack\CSRF("Work item mass submit", $this->get_session(), $params));
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
                "error_items" => $error_ids,
                "error_messages" => $error_messages,
            ])
        ];
    }
    
    
    private function validate_csrf_token($token) {
        return strlen($token) > 16 && $token === $this->get_session()->get_csrf_token();
    }
}
