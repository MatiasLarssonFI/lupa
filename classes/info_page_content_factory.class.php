<?php

require_once(__DIR__ . "/info_felling_content.class.php");


class InfoPageContentFactory {
    private static $_inst;
    
    
    /**
     * Returns the InfoPageContentFactory object.
     * 
     * @return InfoPageContentFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    
    /**
     * Returns the felling page contents.
     * 
     * @return IInfoPageContent[]
     */
    public function get_felling_contents($uri) {
        $ret = array();
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_info_page_contents(function(array $row) use (&$ret) {
            $ret[] = new InfoFellingContent(
                  $row["id"]
                , $row["title"]
                , $row["content"]
                , ""  //$row["image_uri"]
                , (bool)$row["is_html"]
            );
        }, $lang, $uri);
        
        return $ret;
    }
}