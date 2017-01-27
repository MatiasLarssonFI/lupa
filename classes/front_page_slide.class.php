<?php

require_once(dirname(__FILE__) . "/islide.class.php");


class FrontPageSlide implements ISlide {
    public function __construct($html, $id) {
        $this->_html = $html;
        $this->_id = $id;
    }
    
    
    public function get_html() {
        return $this->_html;
    }
    
    
    public function get_id() {
        return $this->_id;
    }
}
