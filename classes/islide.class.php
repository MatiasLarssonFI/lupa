<?php

interface ISlide {
    /**
     * Returns the slide HTML.
     * 
     * @return string
     */
    public function get_html();
    
    
    /**
     * Returns the slide ID.
     * 
     * @return int
     */
    public function get_id();
}
