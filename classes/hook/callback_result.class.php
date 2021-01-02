<?php

namespace Hook;


class CallbackResult {
    private $_message;
    
    
    public function __construct(string $message) {
        $this->_message = $message;
    }
    
    
    /**
     * @return string
     */
    public function get_message() {
        return $this->_message;
    }
}