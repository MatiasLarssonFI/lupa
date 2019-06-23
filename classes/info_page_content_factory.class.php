<?php

require_once(__DIR__ . "/info_felling_content.class.php");
require_once(__DIR__ . "/video_factory.class.php");
require_once(__DIR__ . "/inavigable_link.class.php");
require_once(__DIR__ . "/nav_link.class.php");


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
     * Returns the felling page links
     * 
     * @param INavigableLink $active
     * @return INavigableLink[]
     */
    public function get_felling_page_links(INavigableLink $active) {
        $ret = array();
        $lang = UITextStorage::get()->get_language();
        $fIsActive = function(array $row) use ($active) {
            return $row["uri"] === $active->get_action();
        };
        
        DBIF::get()->get_info_page_links(function(array $row) use (&$ret, $fIsActive) {
            $ret[] = new NavLink(
                  $row["uri"]
                , $row["title"]
                , $fIsActive($row)
            );
        }, $lang);
        
        return $ret;
    }
    
    
    /**
     * Returns the felling page contents.
     * 
     * @return IInfoPageContent[]
     */
    public function get_felling_contents($uri) {
        $ret = array();
        $lang = UITextStorage::get()->get_language();
        $vf = \VideoFactory::get();
        
        DBIF::get()->get_info_page_contents(function(array $row) use (&$ret, $vf) {
            $video = ($row["video_id"] ? $vf->get_video((int)$row["video_id"]) : null);
            $ret[] = new InfoFellingContent(
                  $row["id"]
                , $row["title"]
                , $row["html_title"]
                , $row["content"]
                , $row["image_uri"]
                , $row["image_description"]
                , (bool)$row["is_html"]
                , $video
            );
        }, $lang, $uri);
        
        return $ret;
    }
}