<?php

interface IRecordableWorkItem {
    /**
     * Add a change to the record.
     * @param int $mask \ISavableWorkItem::CM_*
     */
    public function add_change($isavable_cm_bits);
    
    
    /**
     * Set the previous state to the record.
     * @param string $state
     */
    public function set_previous_state($state);
}