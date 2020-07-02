<?php

require_once(__DIR__ . "/work_item.class.php");
require_once(__DIR__ . "/icontact_message.class.php");


class WorkItemFactory {
    private static $_inst;
    
    const STATE_NEW = "STATE_NEW";
    const STATE_IN_PROGRESS = "STATE_IN_PROGRESS";
    const STATE_FINISHED = "STATE_FINISHED";
    const STATE_HALTED = "STATE_HALTED";
    
    
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
            , $message->get_name()
            , $message->get_email()
            , $message->get_subject()
            , $message->get_message()
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
     * @return \IListableWorkItem[] or rather a Generator for those
     */
    public function yield_items($state_filter, $order_col, $order_direction) {
        if ($this->is_valid_state($state_filter) && $this->is_valid_order_col($order_col) && $this->is_valid_order_direction($order_direction)) {
            return DBIF::get()->yield_work_items($state_filter, $order_col, $order_direction, function(array $row) {
                return new WorkItem(
                      (int)$row["id"]
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
    
    
    public function is_valid_state($state_str) {
        return strlen($state_str) < 64 && in_array($state_str, [ self::STATE_NEW, self::STATE_IN_PROGRESS, self::STATE_HALTED, self::STATE_FINISHED, "ARCHIVE" ]);
    }
    
    
    private function is_valid_order_col($order_col) {
        return strlen($order_col) < 64 && in_array($order_col, [ "name", "ts_created", "ts_state" ]);
    }
    
    
    private function is_valid_order_direction($order_direction) {
        return strlen($order_direction) < 64 && in_array($order_direction, [ "desc", "asc" ]);
    }
    
    
    private function __construct() {}
}
