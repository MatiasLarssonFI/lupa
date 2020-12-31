<?php

require_once (__DIR__ . "/imanagement_interface_context.class.php");
require_once (__DIR__ . "/isavable_work_item.class.php");
require_once (__DIR__ . "/dbif.class.php");


class ManagementInterface {
    private $_ctx;
    
    public function __construct(\IManagementInterfaceContext $ctx) {
        $this->_ctx = $ctx;
    }
    
    
    public function each_archived_before($unix_timestamp, callable $callback) {
        $rows = $this->yield_work_item_rows_cm_before($unix_timestamp, \ISavableWorkItem::CM_ARCHIVED);
        foreach ($rows as $row) {
            $item = $this->_ctx->make_work_item_from_db_row($row);
            if ($item->is_archived()) { // this prevents calling the callback for "unarchived" ones
                $callback($item);
            }
        }
    }
    
    
    public function each_finished_before($unix_timestamp, callable $callback) {
        $rows = $this->yield_work_item_rows_cm_before($unix_timestamp, \ISavableWorkItem::CM_FINISHED);
        foreach ($rows as $row) {
            $callback($this->_ctx->make_work_item_from_db_row($row));
        }
    }
    
    
    private function yield_work_item_rows_cm_before($unix_timestamp, $change_mask) {
        return \DBIF::get()->yield_work_item_rows_cm_before($unix_timestamp, $change_mask);
    }
}
