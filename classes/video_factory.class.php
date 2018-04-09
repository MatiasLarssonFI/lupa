<?php

require_once(dirname(__FILE__) . "/ivideo.class.php");
require_once(dirname(__FILE__) . "/videos_page_video.class.php");
require_once(dirname(__FILE__) . "/video_file.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/dbif.class.php");


class VideoFactory {
    private static $_inst;
    
    
    /**
     * Returns the VideoFactory object.
     * 
     * @return VideoFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Returns the front page videos for listing.
     * 
     * @return IVideo[]
     */
    public function get_front_page_videos() {
        $ret = array();
        
        $lang = UITextStorage::get()->get_language();
        $videos_data = array();
        $files_data = array();
        
        DBIF::get()->get_front_page_videos(function(array $row) use ($lang, &$videos_data, &$files_data) {
            $id = $row["id"];
            
            if (!array_key_exists($id, $videos_data)) {
                $name_obj = json_decode($row["name"]);
                $videos_data[$id] = array(
                    "id" => $id,
                    "thumb_url" => $row["thumb_url"],
                    "name" => $name_obj->$lang,
                    "description" => "", // unused
                );
            }
            
            $files_data[$id] = array(
                "video_url" => $row["video_url"],
                "mime_subtype" => null, // unused
            );
        });
        
        $ret = array_map(function(array $video_data) use ($files_data) {
            $file_data = $files_data[$video_data["id"]];
            return new VideosPageVideo(
                $video_data["id"],
                $video_data["thumb_url"],
                $video_data["name"],
                $video_data["description"],
                [ new VideoFile($file_data["video_url"], $file_data["mime_subtype"]) ]
            );
        }, $videos_data);
        
        return $ret;
    }
    
    
    /**
     * Returns one front page video.
     * 
     * @param int $id
     * @return IVideo
     */
    public function get_front_page_video($id) {
        $lang = UITextStorage::get()->get_language();
        $video_data = array();
        $files_data = array();
        
        DBIF::get()->get_front_page_video($id, function(array $row) use ($lang, &$video_data, &$files_data) {
            if (empty($video_data)) {
                $name_obj = json_decode($row["name"]);
                
                $video_data = array(
                    "id" => $row["id"],
                    "thumb_url" => $row["thumb_url"],
                    "name" => $name_obj->$lang,
                    "description" => "", // unused
                );
            }
            
            $files_data[] = array(
                "video_url" => $row["video_url"],
                "mime_subtype" => null, // unused
            );
        });
        
        return new VideosPageVideo(
            $video_data["id"],
            $video_data["thumb_url"],
            $video_data["name"],
            $video_data["description"],
            array_map(function(array $file_data) {
                return new VideoFile($file_data["video_url"], $file_data["mime_subtype"]);
            }, $files_data)
        );
    }
}
