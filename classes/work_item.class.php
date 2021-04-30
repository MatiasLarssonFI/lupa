<?php

require_once(__DIR__ . "/ilistable_work_item.class.php");
require_once(__DIR__ . "/iactionable_work_item.class.php");
require_once(__DIR__ . "/isavable_work_item.class.php");
require_once(__DIR__ . "/irecordable_work_item.class.php");
require_once(__DIR__ . "/iemail_confirmable.class.php");
require_once(__DIR__ . "/imanagement_item.class.php");

require_once(__DIR__ . "/readable_work_item.class.php");
require_once(__DIR__ . "/actionable_work_item.class.php");
require_once(__DIR__ . "/recordable_work_item.class.php");
require_once(__DIR__ . "/management_work_item.class.php");

class WorkItem implements IListableWorkItem, IActionableWorkItem, ISavableWorkItem, IRecordableWorkItem, IEmailConfirmable, IManagementItem {
    use ReadableWorkItem;
    use ActionableWorkItem;
    use RecordableWorkItem;
    use ManagementWorkItem;
    
    private $_id;
    private $_subject_reference;
    private $_name;
    private $_email;
    private $_subject;
    private $_message;
    private $_notes;
    private $_state;
    private $_is_archived;
    private $_ts_created;
    private $_ts_state;
    
    public function __construct($id, $subject_reference, $name, $email, $subject, $message, $notes, $state, $is_archived, $ts_created, $ts_state) {
        $this->_id = $id;
        $this->_subject_reference = $subject_reference;
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
    
    
    public function make_subject_reference($id) {
        // pad to at least four characters (digits)
        $min_four_chars = "" . (1000 + $id);
        $ret = "";
        $len = strlen($min_four_chars);
        
        // add dashes every two digits ("12-34" and so on)
        for ($i = 0; $i < $len; ++$i) {
            if ($i > 0 && $i % 2 === 0) {
                $ret .= "-";
            }
            
            $ret .= $min_four_chars[$i];
        }
        
        return $ret;
    }
    
    
    /**
     * Returns the IRecordableWorkItem
     * 
     * This is intended to be used by the traits depending on the interface.
     * 
     * @return IRecordableWorkItem
     */
    public function recordable() {
        return $this;
    }
    
    
    /**
     * Returns the ISavableWorkItem
     * 
     * This is intended to be used by the traits depending on the interface.
     * 
     * @return ISavableWorkItem
     */
    public function savable() {
        return $this;
    }
}
