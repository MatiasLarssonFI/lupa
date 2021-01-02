<?php

namespace Housekeeper;

require_once(__DIR__ . "/../imanagement_visitor.class.php");


class ArchiveVisitor implements \IManagementVisitor {
    private $_ts;
    private $_msg_items;
    
    
    public function __construct(\UITextStorage $ts) {
        $this->_ts = $ts;
        $this->_msg_items = [];
    }
    
    
    public function visit_work_item(\WorkItem $wi) {
        if (!$wi->is_archived()) {
            $wi->add_change(\ISavableWorkItem::CM_HOUSEKEEPER);
            if ($wi->try_perform_archive()) {
                $this->_msg_items[] = "{$wi->get_subject_reference()}/{$wi->get_email()}";
            }
        }
    }
    
    
    public function get_message() {
        return count($this->_msg_items) > 0 ?
               sprintf($this->_ts->text("HK_WORK_ITEMS_ARCHIVED"), count($this->_msg_items), implode(", ", $this->_msg_items))
               : "";
    }
}