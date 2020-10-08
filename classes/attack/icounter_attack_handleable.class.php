<?php

namespace Attack;


interface ICounterAttackHandleable {
    /**
     * @return string
     */
    public function get_session_id();
    
    
    /**
     * @return array
     */
    public function get_session_data();
    
    
    /**
     * @return array
     */
    public function get_input();
    
    
    /**
     * @return string
     */
    public function get_attack();
}
