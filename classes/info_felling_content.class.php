<?php

require_once(__DIR__ . "/iinfo_page_content.class.php");

class InfoFellingContent implements IInfoPageContent {
    private $_title;
    private $_content;
    private $_id;
    private $_image_uri;
    private $_is_html;
    
    
    public function __construct($id, $title, $content, $image_uri, $is_html) {
        $this->_title = $title;
        $this->_content = $content;
        $this->_id = $id;
        $this->_image_uri = $image_uri;
        $this->_is_html = $is_html;
    }
    
    
    public function get_title() {
        return $this->_title;
    }
    

    public function get_content() {
        return $this->_content;
    }
    
    
    public function get_id() {
        return $this->_id;
    }
    
    
    public function get_image_uri() {
        return $this->_image_uri;
    }
    
    
    public function is_html() {
        return $this->_is_html;
    }
}