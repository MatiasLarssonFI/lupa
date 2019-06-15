<?php

require_once(dirname(__FILE__) . "/service.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


class ServiceFactory {
    private static $_inst;
    
    
    /**
     * Returns the ServiceFactory object.
     * 
     * @return ServiceFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Returns the services.
     * 
     * @return IService[]
     */
    public function get_services() {
        $ret = array();
        $image_uris = array();
        
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_services(function(array $row) use (&$ret) {
            $row_id = $row["id"];
            if (!array_key_exists($row_id, $ret)) {
                $ret[$row_id] = new Service(
                    $row["title"],
                    $row["subtitle"],
                    $row["text"],
                    $row["icon_uri"],
                    $row["link_uri"]
                );
            }
            
            $ret[$row_id]->add_image_uri($row["image_uri"]);
        },$lang);
        
        return array_values($ret);
    }
}
