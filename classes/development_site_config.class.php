<?php

require_once(dirname(__FILE__) . "/isite_config.class.php");


class DevelopmentSiteConfig implements ISiteConfig {
    public function base_uri() {
        return "http://localhost";
    }
    
    
    public function host() {
        return "localhost";
    }
    
    
    public function default_language() {
        return "fi";
    }
    
    
    public function db_login_params() {
        return array(
            "host" => "localhost",
            "dbname" => "lupa",
            "user" => "lupa",
            "pass" => "nXXYDIoPTgnjrtWF"
        );
    }
}
