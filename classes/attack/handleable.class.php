<?php

namespace Attack;


trait Handleable {
    public function get_session_id() {
        return $this->_session->get_session_id();
    }
    
    
    public function get_session_data() {
        return $this->_session->get_all_data();
    }
    

    public function get_input() {
        return $this->_input;
    }
    
    
    public function get_attack() {
        return $this->_attack;
    }
}
