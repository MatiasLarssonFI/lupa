<?php

require_once(dirname(__FILE__) . "/islide.class.php");
require_once(dirname(__FILE__) . "/front_page_slide.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


class SlideFactory {
    private static $_inst;
    
    
    /**
     * Returns the SlideFactory object.
     * 
     * @return SlideFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Returns the front page slides.
     * 
     * @return ISlide[]
     */
    public function get_front_page_slides() {
        $ret = array();
        
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_front_page_slides(function(array $row) use (&$ret) {
            $ret[] = new FrontPageSlide(
                $row["html"],
                $row["id"]
            );
        }, $lang);
        
        return $ret;
    }
}
