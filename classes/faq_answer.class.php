<?php

require_once(__DIR__ . "/ifaq_answer.class.php");


class FAQAnswer implements IFAQAnswer {
    private $_id;
    private $_question;
    private $_answer;
    
    
    public function __construct($id, $question, $answer) {
        $this->_id = $id;
        $this->_question = $question;
        $this->_answer = $answer;
    }
    
    
    public function get_question() {
        return $this->_question;
    }
    
    
    public function get_answer() {
        return $this->_answer;
    }
    
    
    public function get_id() {
        return $this->_id;
    }
}