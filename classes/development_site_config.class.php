<?php

require_once(dirname(__FILE__) . "/isite_config.class.php");


class DevelopmentSiteConfig implements ISiteConfig {
    public function base_uri() {
        return "https://{$this->host()}";
    }
    
    
    public function host() {
        if (strpos($_SERVER["REMOTE_ADDR"], "192.168.1.") === 0 &&
            strpos($_SERVER["SERVER_ADDR"], "192.168.1.") === 0) {
            return $_SERVER["SERVER_ADDR"];
        }
        return "localhost";
    }
    
    
    public function email_address_host() {
        return "lu-pa.fi";
    }
    
    
    public function default_language() {
        return "fi";
    }
    
    
    public function db_table_prefix() {
        return "lupa_";
    }
    
    
    public function db_login_params() {
        return array(
            "host" => "localhost",
            "dbname" => "woodparts_16",
            "user" => "woodparts_16",
            "pass" => "mtxv9uyqamehLeZm"
        );
    }
    
    
    public function twig_compilation_cache_path() {
        return __DIR__ . "/../../twig_compilation_cache";
    }
    
    
    public function tracking_enabled() {
        return false;
    }
}
