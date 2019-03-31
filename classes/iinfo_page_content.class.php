<?php

interface IInfoPageContent {
    /**
     * Returns the title.
     * @return string
     */
    public function get_title();
    
    
    /**
     * Returns the content.
     * @return string
     */
    public function get_content();
    
    
    /**
     * Returns the content ID.
     * @return int
     */
    public function get_id();
    
    
    /**
     * Returns the image URI.
     * @return string
     */
    public function get_image_uri();
    
    
    /**
     * Returns true if the content is HTML.
     * @return bool
     */
    public function is_html();
}