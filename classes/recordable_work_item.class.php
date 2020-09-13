<?php

trait RecordableWorkItem {
    public function set_previous_state($state) {
        $this->_rwi_previous_state = $state;
    }
    
    
    public function get_previous_state() {
        return $this->_rwi_previous_state ?? "(none)";
    }
    
    
    public function add_change($isavable_cm_bits) {
        if (!isset($this->_rwi_mask)) {
            $this->_rwi_mask = 0;
        }
        $this->_rwi_mask |= $isavable_cm_bits;
    }
    
    
    public function get_change_mask() {
        return $this->_rwi_mask ?? 0;
    }
}
