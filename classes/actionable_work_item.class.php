<?php

trait ActionableWorkItem {
    public function get_state_action() {
        //TBD
        return "Start";
    }
    
    
    public function is_archivable() {
        //TBD
        return true;
    }
    
    
    public function is_haltable() {
        //TBD
        return true;
    }
}
