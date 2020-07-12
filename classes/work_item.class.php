<?php

require_once(__DIR__ . "/ilistable_work_item.class.php");
require_once(__DIR__ . "/iactionable_work_item.class.php");
require_once(__DIR__ . "/readable_work_item.class.php");
require_once(__DIR__ . "/actionable_work_item.class.php");

class WorkItem implements IListableWorkItem, IActionableWorkItem, ISavableWorkItem {
    use ReadableWorkItem;
    use ActionableWorkItem;
    
    private $_id;
    private $_name;
    private $_email;
    private $_subject;
    private $_message;
    private $_notes;
    private $_state;
    private $_is_archived;
    private $_ts_created;
    private $_ts_state;
    
    public function __construct($id, $name, $email, $subject, $message, $notes, $state, $is_archived, $ts_created, $ts_state) {
        $this->_id = $id;
        $this->_name = $name;
        $this->_email = $email;
        $this->_subject = $subject;
        $this->_message = $message;
        $this->_notes = $notes;
        $this->_state = $state;
        $this->_is_archived = $is_archived;
        $this->_ts_created = $ts_created;
        $this->_ts_state = $ts_state;
    }
}
