<?php

require_once(dirname(__FILE__) . "/igallery_image.class.php");
require_once(dirname(__FILE__) . "/gallery_image.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


class GalleryImageFactory {
    private static $_inst;
    
    
    /**
     * Returns the GalleryImageFactory object.
     * 
     * @return GalleryImageFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Returns the gallery images.
     * 
     * @return IGalleryImage[]
     */
    public function get_gallery_images() {
        $ret = array();
        
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_gallery_images(function(array $row) use (&$ret, $lang) {
            $name_obj = json_decode($row["name"]);
            $descr_obj = json_decode($row["description"]);
            
            $ret[] = new GalleryImage(
                $row["id"],
                $row["original_url"],
                $row["thumb_url"],
                $name_obj->$lang,
                $descr_obj->$lang
            );
        });
        
        usort($ret, function(IGalleryImage $img1, IGalleryImage $img2) {
            $name1 = $img1->get_name();
            $name2 = $img2->get_name();
            if ($name1 === $name2) {
                return 0;
            }
            return ($name1 < $name2 ? -1 : 1);
        });
        
        return $ret;
    }
    
    
    /**
     * Returns the image bar images.
     * 
     * @return IGalleryImage[]
     */
    public function get_img_bar_images() {
        $ret = array();
        
        $lang = UITextStorage::get()->get_language();
        
        DBIF::get()->get_img_bar_images(function(array $row) use (&$ret, $lang) {
            $name_obj = json_decode($row["name"]);
            
            $ret[] = new GalleryImage(
                $row["id"],
                "",
                $row["thumb_url"],
                $name_obj->$lang,
                ""
            );
        });
        
        return $ret;
    }
    
    
    protected function __construct() {}
}
