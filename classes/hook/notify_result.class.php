<?php

namespace Hook;

require_once(__DIR__ . "/callback_result.class.php");


class NotifyResult {
    private $_cb_res;
    
    
    public function __construct() {
        $this->_cb_res = [];
    }
    
    
    /**
     * @param CallbackResult $cr
     */
    public function add_callback_result(CallbackResult $cr) {
        $this->_cb_res[] = $cr;
    }
    
    
    /**
     * Returns all the messages returned by callbacks.
     *
     * @return string[]
     */
    public function get_messages() {
        return array_map(function(CallbackResult $cb) {
            return $cb->get_message();
        }, $this->_cb_res);
    }
}