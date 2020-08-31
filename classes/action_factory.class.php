<?php

require_once(__DIR__ . "/ui_text_storage.class.php");


/**
 * Singleton.
 * 
 * Responsible for providing navigation actions.
 * 
 * Site-specific implementation.
 */
class ActionFactory {
    private static $_inst;
    
    /**
     * @return ActionFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * @return string[] The navigation actions
     */
    public function get_nav_actions() {
        $ts = UITextStorage::get();
        $lang = $ts->get_language();
        $actions = [ "" ]; // front page
    
        if (!empty($ts->text("NEWS_CONTENT"))) {
            $actions[] = "#news";
        }
        if ($lang === "fi") {
            $actions[] = "puunkaato";
            $actions[] = "partners";
        }
        $actions[] = "#contact";
        $actions[] = "faq";
        
        return $actions;
    }
    
    
    /**
     * Returns the primary action when accessing management site.
     * 
     * @return string
     */
    public function get_primary_management_action() {
        return "work_list";
    }
    
    
    protected function __construct() {}
}