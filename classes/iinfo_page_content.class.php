<?php

interface IInfoPageContent {
    /**
     * Returns the title.
     * @return string
     */
    public function get_title();
    
    
    /**
     * Returns the HTML title.
     */
    public function get_html_title();
    
    
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
     * Returns the image URI, or empty string if there's no image uri.
     * @return string
     */
    public function get_image_uri();
    
    
    /**
     * Returns a human-readable description of the image.
     * @return string
     */
    public function get_image_description();
    
    
    /**
     * Returns the video, or null if there's no video.
     * @return  IVideo|null
     */
    public function get_video();
    
    
    /**
     * Returns true if the content is HTML.
     * @return bool
     */
    public function is_html();
    
    
    /**
     * Returns true if there's an image uri.
     * @return bool
     */
    public function has_image();
    
    
    /**
     * Returns true if there's a video.
     * @return bool
     */
    public function has_video();
    
    
    /**
     * Returns the value for HTML id attribute.
     * @return string
     */
    public function get_html_id();
}