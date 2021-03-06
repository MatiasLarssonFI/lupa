<?php

require_once(dirname(__FILE__) . "/nav_link.class.php");
require_once(dirname(__FILE__) . "/lang_link.class.php");
require_once(dirname(__FILE__) . "/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/action_factory.class.php");


class NavLinkFactory {
    private $_action;
    private $_params;
    private $_nav_actions;
    private $_footer_only_actions;
    private $_lang;
    private $_sub_nav_fs;
    
    
    /**
     * Constructor.
     * 
     * @param string $action Current action
     * @param string[] $params Params from HTTP GET
     * @param string[] $nav_actions Array of all navigation action names
     * @param string[] $footer_actions Array of footer-only navigation action names
     * @param string $lang
     * @param string $base_uri
     * @param ISubNavLinkFactory[] $sub_nav_factories
     */
    public function __construct($action, array $params, array $nav_actions, array $footer_actions, $lang, array $sub_nav_factories = []) {
        $this->_action = $action;
        $this->_params = $params;
        $this->_nav_actions = $nav_actions;
        $this->_footer_only_actions = $footer_actions;
        $this->_lang = $lang;
        $this->_sub_nav_fs = $sub_nav_factories;
    }
    
    
    /**
     * Returns the main nav links.
     * 
     * @return NavLink[]
     */
    public function get_nav_links() {
        $texts = \UITextStorage::get();
        $current_action = $this->_action;
        
        return array_map(function ($action) use ($texts, $current_action) {
            if ($action !== "") {
                $title = $texts->text("NAV_" . str_replace(["-", "#"], ["_", ""], strtoupper($action)));
            } else {
                $title = $texts->text("NAV_FRONT_PAGE");
            }
            return new NavLink($action, $title, $action === $current_action);
        }, $this->_nav_actions);
    }
    
    
    /**
     * Returns the sub nav links.
     * 
     * @return NavLink[]
     */
    public function get_sub_nav_links() {
        $ret = [];
        
        foreach ($this->_sub_nav_fs as $sub_nav_f) {
            foreach ($sub_nav_f->get_sub_nav_links($this->_action, $this->_params) as $sub_nav_link) {
                $ret[] = $sub_nav_link;
            }
        }
        
        return $ret;
    }
    
    
    /**
     * Returns the main nav links.
     * 
     * @param boolean $cookie_prompt_enabled
     * @return NavLink[]
     */
    public function get_footer_only_nav_links($cookie_prompt_enabled) {
        $texts = \UITextStorage::get();
        $current_action = $this->_action;
        
        return array_filter(array_map(function ($action) use ($texts, $current_action) {
            $title = $texts->text("NAV_" . str_replace(["-", "#"], ["_", ""], strtoupper($action)));
            return new NavLink($action, $title, $action === $current_action);
        }, $this->_footer_only_actions), function(NavLink $nl) use ($cookie_prompt_enabled) {
            return \ActionFactory::get()->action_enabled($nl->get_action(), $cookie_prompt_enabled);
        });
    }
    
    
    /**
     * Returns language links excluding current langauge.
     * 
     * @return LangLink[]
     **/
    public function get_lang_links() {
   		$lang = $this->_lang;
        return array_filter($this->get_all_lang_links(), function ($link) use($lang) {
            return $link->get_language() !== $lang;
        });
    }
    
    
    /**
     * Returns all language links.
     * 
     * @return LangLink[]
     **/
    public function get_all_lang_links() {
        $action = $this->_action;
        $action_params_str = "";
        if (strlen($action) > 0) {
            $params_str = implode("/", $this->_params);
            $action_params_str = "{$action}/{$params_str}";
        }
        $lang = $this->_lang;
        return array_map(function($lang) use ($action_params_str) {
            return new LangLink($lang, strtoupper($lang), $action_params_str);
        }, DBIF::get()->get_language_codes());
    }
}
