<?php

require_once(dirname(__FILE__) . "/iservice.class.php");


class Service implements IService {
    private $_title;
    private $_text;
    private $_icon_uri;
    private $_img_uris;
    
    
    /**
     * Constructor.
     * 
     * @param string $title
     * @param string $text
     * @param string[] $img_uris
     */
    public function __construct($title, $text, $icon_uri) {
        $this->_title = $title;
        $this->_text = $text;
        $this->_icon_uri = $icon_uri;
        $this->_img_uris = [];
    }
    
    
    public function add_image_uri($uri) {
        $this->_img_uris[] = $uri;
    }
    
    
    public function get_text_paragraphs() {
        return explode(PHP_EOL, $this->_text);
    }
    
    
    public function get_title() {
        return $this->_title;
    }
    
    
    public function get_icon_uri() {
        return $this->_icon_uri;
    }
    
    
    public function get_img_uris() {
        return $this->_img_uris;
    }
}
