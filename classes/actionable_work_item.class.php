<?php

require_once(__DIR__ . "/dbif.class.php");
require_once(__DIR__ . "/ui_text_storage.class.php");


trait ActionableWorkItem {
    public function get_state_action() {
        switch ($this->_state) {
            case "STATE_NEW":
                return "Start";
            case "STATE_IN_PROGRESS":
                return "Finish";
            default:
                return null;
        }
    }
    
    
    public function get_state_action_text() {
        if ($action = $this->get_state_action()) {
            $action = strtoupper($action);
            return \UITextStorage::get()->text("MANAGEMENT_WORK_LIST_ACTION_{$action}");
        }
        return "";
    }
    
    
    public function try_perform_state_action() {
        switch ($this->_state) {
            case "STATE_NEW":
                $this->_state = "STATE_IN_PROGRESS";
                break;
            case "STATE_IN_PROGRESS":
                $this->_state = "STATE_FINISHED";
                break;
            default:
                return false;
        }
        if ($this->_is_archived) {
            $this->_is_archived = false;
        }
        \DBIF::get()->update_work_item($this, true);
        return true;
    }
    
    
    public function try_perform_archive() {
        if ($this->is_archivable()) {
            $this->_is_archived = true;
            \DBIF::get()->update_work_item($this, true);
            return true;
        }
        return false;
    }
    
    
    public function try_perform_halt() {
        if ($this->is_haltable()) {
            $this->_state = "STATE_HALTED";
            \DBIF::get()->update_work_item($this, true);
            return true;
        }
        return false;
    }
    
    
    public function is_archivable() {
        return !$this->_is_archived;
    }
    
    
    public function is_haltable() {
        return ($this->_state == "STATE_NEW" || $this->_state == "STATE_IN_PROGRESS") && !$this->_is_archived;
    }
    
    
    public function set_notes($notes) {
        $this->_notes = $notes;
    }
}
