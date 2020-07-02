<?php

trait ReadableWorkItem {
    public function get_id() {
        return $this->_id;
    }
    
    
    public function get_name() {
        return $this->_name;
    }
    
    
    public function get_email() {
        return $this->_email;
    }
    
    
    public function get_subject() {
        return $this->_subject;
    }
    
    
    public function get_message() {
        return $this->_message;
    }
    
    
    public function get_notes() {
        return $this->_notes;
    }
    
    
    public function get_datetime_created() {
        return date("d.m.Y H:i:s", strtotime($this->_ts_created));
    }
    
    
    public function get_datetime_state() {
        return date("d.m.Y H:i:s", strtotime($this->_ts_state));
    }
}
