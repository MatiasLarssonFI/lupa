<?php

require_once(__DIR__ . "/iinfo_page_content.class.php");

class InfoFellingContent implements IInfoPageContent {
    private $_title;
    private $_html_title;
    private $_content;
    private $_id;
    private $_image_uri;
    private $_image_description;
    private $_is_html;
    private $_video;
    
    
    public function __construct($id, $title, $html_title, $content, $image_uri, $image_description, $is_html, /* IVideo */ $video = null) {
        $this->_title = $title;
        $this->_html_title = $html_title;
        $this->_content = $content;
        $this->_id = $id;
        $this->_image_uri = $image_uri;
        $this->_image_description = $image_description;
        $this->_is_html = $is_html;
        $this->_video = $video;
    }
    
    
    public function get_title() {
        return $this->_title;
    }
    
    
    public function get_html_title() {
        return $this->_html_title;
    }
    

    public function get_content() {
        return $this->_content;
    }
    
    
    public function get_id() {
        return $this->_id;
    }
    
    
    public function get_image_uri() {
        $parts = explode(":", $this->_image_uri);
        return $parts[0];
    }
    
    
    public function has_landscape_media() {
        return $this->has_video() || $this->has_landscape_img();
    }
    
    
    public function get_image_description() {
        return $this->_image_description;
    }
    
    
    public function is_html() {
        return $this->_is_html;
    }
    
    
    public function get_video() {
        return $this->_video;
    }
    
    
    public function has_image() {
        return strlen($this->_image_uri) > 0;
    }
    
    
    public function has_video() {
        return $this->_video !== null;
    }
    
    
    public function get_html_id() {
        $title = str_replace([ " ", "Ä", "Ö", "Å", "ä", "ö", "å", ], [ "-", "A", "O", "A", "a", "o", "a" ], $this->_title);
        return strtolower(preg_replace("/[^A-Za-z0-9\\-]/", "", $title));
    }
    
    
    private function has_landscape_img() {
        if ($this->has_image()) {
            $parts = explode(":", $this->_image_uri);
            return isset($parts[1]) && $parts[1] === "landscape";
        }
        return false;
    }
}