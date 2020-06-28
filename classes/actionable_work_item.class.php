<?php

trait ActionableWorkItem {
    public function get_state_action() {
        //TBD
        return "Start work";
    }
    
    
    public function is_archivable() {
        //TBD
        return true;
    }
}
