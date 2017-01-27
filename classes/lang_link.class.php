<?php


class LangLink {
    private $_language;
    private $_text;
    private $_action;
    
    
    /**
     * Constructor.
     * 
     * @oaram string $language
     * @oaram string $text
     * @oaram string $action
     */
    public function __construct($language, $text, $action) {
        $this->_language = $language;
        $this->_text = $text;
        $this->_action = $action;
    }
    
    
    /**
     * Returns the language name.
     * 
     * @return string
     */
    public function get_language() {
        return $this->_language;
    }
    
    
    /**
     * Returns the nav link text.
     * 
     * @return string
     */
    public function get_text() {
        return $this->_text;
    }
    
    
    /**
     * Returns the nav link action.
     * 
     * @return string
     */
    public function get_action() {
        return $this->_action;
    }
}
