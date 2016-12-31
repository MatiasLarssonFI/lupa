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
     * Returns the image URIs.
     * 
     * @return string[]
     */
    public function get_img_uris();
}
