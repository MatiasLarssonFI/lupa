<?php

require_once(__DIR__ . "/work_item.class.php");
require_once(__DIR__ . "/icontact_message.class.php");


class WorkItemFactory {
    private static $_inst;
    
    const STATE_NEW = "STATE_NEW";
    const STATE_IN_PROGRESS = "STATE_IN_PROGRESS";
    const STATE_FINISHED = "STATE_FINISHED";
    const STATE_HALTED = "STATE_HALTED";
    const ARCHIVE = "ARCHIVE";
    
    const PAGE_SIZE = 60;
    
    
    /**
     * Returns the WorkItemFactory object.
     * 
     * @return \WorkItemFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Create a work item out of a contact message.
     *
     * @param \IContactMessage $message
     * @return \WorkItem
     */
    public function make_from_contact_message(IContactMessage $message) {
        $now = date("Y-m-d H:i:s");
        return new WorkItem(
              null
            , ""
            , $message->get_name()
            , $message->get_email()
            , $message->get_subject()
            , $message->get_message()
            , ""
            , self::STATE_NEW
            , false
            , $now
            , $now
        );
    }
    
    
    /**
     * Yields the work items.
     * 
     * @param string $state_filter state to filter by
     * @param string $order_col column to order by
     * @param string $order_direction direction to order by
     * @param int $page Page number
     * @return \IListableWorkItem[] or rather a Generator for those
     */
    public function yield_items($state_filter, $order_col, $order_direction, $page) {
        $offset = ($page - 1) * self::PAGE_SIZE;
        $count = self::PAGE_SIZE;
        if ($this->is_valid_state($state_filter) && $this->is_valid_order_col($order_col) && $this->is_valid_order_direction($order_direction)) {
            return \DBIF::get()->yield_work_items($state_filter, $order_col, $order_direction, $offset, $count, function(array $row) {
                return new WorkItem(
                      (int)$row["id"]
                    , $row["s_reference"]
                    , $row["name"]
                    , $row["email"]
                    , $row["subject"]
                    , $row["message"]
                    , $row["notes"]
                    , $row["state"]
                    , (bool)$row["is_archived"]
                    , $row["ts_created"]
                    , $row["ts_state"]
                );
            });
        }
    }
    
    
    /**
     * Returns an actionable work item by ID.
     * 
     * @param int $id
     * @return \IActionableWorkItem
     */
    public function get_actionable_item($id) {
        return $this->get_work_item($id);
    }
    
    
    /**
     * Returns a confirmable work item by ID.
     * 
     * @param  int $id
     * @return \IEmailConfirmable
     */
    public function get_email_confirmable_item($id) {
        return $this->get_work_item($id);
    }
    
    
    /**
     * Returns the WorkItem.
     * @param  int $id Database ID.
     * @return \WorkItem
     */
    private function get_work_item($id) {
        $row = \DBIF::get()->get_work_item($id);
        if (is_array($row)) {
            return new WorkItem(
                  (int)$row["id"]
                , $row["s_reference"]
                , $row["name"]
                , $row["email"]
                , $row["subject"]
                , $row["message"]
                , $row["notes"]
                , $row["state"]
                , (bool)$row["is_archived"]
                , $row["ts_created"]
                , $row["ts_state"]
            );
        } else {
            throw new \LogicException("Requested item not found");
        }
    }
    
    
    public function is_valid_state($state_str) {
        // note: archive is not really a state but included for convenience here
        return in_array($state_str, [ self::STATE_NEW, self::STATE_IN_PROGRESS, self::STATE_HALTED, self::STATE_FINISHED, \WorkItemFactory::ARCHIVE ]);
    }
    
    
    public function is_valid_order_col($order_col) {
        return in_array($order_col, [ "name", "ts_created", "ts_state", "s_reference" ]);
    }
    
    
    public function is_valid_order_direction($order_direction) {
        return in_array($order_direction, [ "desc", "asc" ]);
    }
    
    
    public static function state_actions() {
        return [
            [
                "action" => "Start",
                "text" => "→" . \UITextStorage::get()->text("MANAGEMENT_WORK_LIST_ACTION_START")
            ],
            [
                "action" => "Finish",
                "text" => "→" . \UITextStorage::get()->text("MANAGEMENT_WORK_LIST_ACTION_FINISH")
            ],
            [
                "action" => "Halt",
                "text" => \UITextStorage::get()->text("MANAGEMENT_WORK_LIST_ACTION_HALT")
            ],
            [
                "action" => "Archive",
                "text" => \UITextStorage::get()->text("MANAGEMENT_WORK_LIST_ACTION_ARCHIVE")
            ],
        ];
    }
    
    
    private function __construct() {}
}
