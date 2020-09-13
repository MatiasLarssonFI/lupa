<?php

require_once(__DIR__ . "/faq_answer.class.php");


class FAQFactory {
    private static $_inst;
    
    
    /**
     * Returns the FAQFactory object.
     * 
     * @return FAQFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    
    /**
     * Returns the FAQ answers.
     * 
     * @return IFAQAnswer[]
     */
    public function get_answers() {
        $ret = array();
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_faq_answers(function(array $row) use (&$ret) {
            $ret[] = new FAQAnswer(
                $row["id"],
                $row["image_uri"],
                $row["question"],
                $row["answer"]
            );
        },$lang);
        
        return $ret;
    }
    
    
    protected function __construct() {}
}