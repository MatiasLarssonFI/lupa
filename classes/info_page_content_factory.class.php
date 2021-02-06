<?php

require_once(__DIR__ . "/info_felling_content.class.php");
require_once(__DIR__ . "/info_partners_content.class.php");
require_once(__DIR__ . "/info_cookie_content.class.php");
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
     * Returns the info page links
     * 
     * @param INavigableLink $active
     * @return INavigableLink[]
     */
    public function get_info_page_links(INavigableLink $active) {
        $ret = array();
        $lang = UITextStorage::get()->get_language();
        $fIsActive = function(array $row) use ($active) {
            return $row["uri"] === $active->get_action();
        };
        list($root) = explode ("/", $active->get_action());
        
        DBIF::get()->get_info_page_links(function(array $row) use (&$ret, $fIsActive) {
            $ret[] = new NavLink(
                  $row["uri"]
                , $row["title"]
                , $fIsActive($row)
            );
        }, $lang, $root);
        
        return $ret;
    }
    
    
    /**
     * Returns the felling page contents.
     * 
     * @return IInfoPageContent[]
     */
    public function get_felling_contents($uri) {
        return $this->get_info_page_contents($uri, function(  $id
                                                            , $title
                                                            , $html_title
                                                            , $content
                                                            , $image_uri
                                                            , $image_description
                                                            , $is_html
                                                            , $video)
        {
            return new \InfoFellingContent(
                  $id
                , $title
                , $html_title
                , $content
                , $image_uri
                , $image_description
                , $is_html
                , $video
            );
        });
    }
    
    
    /**
     * Returns the partners page contents.
     * 
     * @return IInfoPageContent[]
     */
    public function get_partners_contents($uri) {
        return $this->get_info_page_contents($uri, function(  $id
                                                            , $title
                                                            , $html_title
                                                            , $content
                                                            , $image_uri
                                                            , $image_description
                                                            , $is_html
                                                            , $video)
        {
            return new \InfoPartnersContent(
                  $id
                , $title
                , $html_title
                , $content
                , $image_uri
                , $image_description
                , $is_html
                , $video
            );
        });
    }
    
    
    /**
     * Returns the cookie page contents.
     * 
     * @return IInfoPageContent[]
     */
    public function get_cookie_contents($uri) {
        return $this->get_info_page_contents($uri, function(  $id
                                                            , $title
                                                            , $html_title
                                                            , $content
                                                            , $image_uri
                                                            , $image_description
                                                            , $is_html
                                                            , $video)
        {
            return new \InfoCookieContent(
                  $id
                , $title
                , $html_title
                , $content
                , $image_uri
                , $image_description
                , $is_html
                , $video
            );
        });
    }
    
    
    /**
     * Returns the info page contents.
     * 
     * @return IInfoPageContent[]
     */
    private function get_info_page_contents(string $uri, callable $fnConstruct) {
        $ret = [];
        $lang = UITextStorage::get()->get_language();
        $vf = \VideoFactory::get();
        
        DBIF::get()->get_info_page_contents(function(array $row) use (&$ret, $vf, $fnConstruct) {
            $video = ($row["video_id"] ? $vf->get_video((int)$row["video_id"]) : null);
            $ret[] = $fnConstruct(
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
    
    
    protected function __construct() {}
}