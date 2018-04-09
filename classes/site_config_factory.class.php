<?php

require_once(dirname(__FILE__) . "/production_site_config.class.php");
require_once(dirname(__FILE__) . "/development_site_config.class.php");


class SiteConfigFactory {
    private $_site_config;
    
    private static $_inst;
    
    
    /**
     * Returns the SiteConfigFactory object.
     * 
     * @return SiteConfigFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * @return ISiteConfig
     */
    public function get_site_config() {
        return $this->_site_config;
    }
    
    
    protected function make_site_config() {
        if (in_array($_SERVER["REMOTE_ADDR"], ["127.0.0.1", "::1"]) ||
            strpos($_SERVER["REMOTE_ADDR"], "192.168.1.") === 0) {
            
            return new DevelopmentSiteConfig();
        } else {
            return new ProductionSiteConfig();
        }
    }
    
    
    protected function __construct() {
        $this->_site_config = $this->make_site_config();
    }
}
