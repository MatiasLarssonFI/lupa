<?php

class ResourceConfig {
    private $_js_src_mode;
    private $_js_src_version;
    private $_css_src_version;
    private $_css_src_mode;
    
    private static $_inst = null;
    
    
    /**
     * Returns the ResourceConfig object.
     * 
     * @return ResourceConfig
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * @return string JS source mode, "min"|"debug"
     */
    function get_js_src_mode() {
        return $this->_js_src_mode;
    }
    
    
    /**
     * @return string numeric string
     */
    function get_js_src_version() {
        return $this->_js_src_version;
    }
    
    
    /**
     * @return string numeric string
     */
    function get_css_src_version() {
        return $this->_css_src_version;
    }
    
    
    /**
     * @return string CSS source mode, "min"|"debug"
     */
    function get_css_src_mode() {
        return $this->_css_src_mode;
    }
    
    
    protected function __construct() {
        $res = DBIF::get()->get_resource_configuration();
        $this->_js_src_mode = $res["js_src_mode"];
        $this->_js_src_version = $res["js_src_version"];
        $this->_css_src_version = $res["css_src_version"];
        $this->_css_src_mode = $res["css_src_mode"];
    }
}
