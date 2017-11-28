<?php

interface IFAQAnswer {
    /**
     * Returns the question text.
     * @return string
     */
    public function get_question();
    
    
    /**
     * Returns the answer text.
     * @return string
     */
    public function get_answer();
    
    
    /**
     * Returns the answer ID.
     * @return int
     */
    public function get_id();
}