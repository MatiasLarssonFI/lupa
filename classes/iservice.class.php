<?php

interface IService {
    /**
     * Returns the title.
     * 
     * @return string
     */
    public function get_title();
    
    
     /**
     * Returns the text paragraphs.
     * 
     * @return string[]
     */
    public function get_text_paragraphs();
    
    
    /**
     * Returns the icon URI.
     * 
     * @return string
     */
    public function get_icon_uri();
    
    
    /**
     * Returns the image URIs.
     * 
     * @return string[]
     */
    public function get_img_uris();
    
    
    /**
     * Returns the subtitle words.
     * 
     * @return string[]
     */
    public function get_subtitle_words();
    
    
    /**
     * @return string
     */
    public function get_link_uri();
}
