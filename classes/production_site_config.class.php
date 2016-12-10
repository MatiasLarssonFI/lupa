<?php

require_once(dirname(__FILE__) . "/isite_config.class.php");


class ProductionSiteConfig implements ISiteConfig {
    public function base_uri() {
        return "http://{$this->host()}";
    }
    
    
    public function host() {
        if (strpos($_SERVER["HTTP_HOST"], "martinlarsson.fi") !== false) {
            // if the request header "Host" is "martinlarsson.fi",
            // then use that
            return "martinlarsson.fi";
        }
        
        return "woodparts.fi";
    }
    
    
    public function default_language() {
        return "fi";
    }
    
    
    public function db_table_prefix() {
        return "lupa_";
    }
    
    
    public function db_login_params() {
        $creds_fname = dirname(__FILE__) . "/../../db_creds.json";
        if (is_readable($creds_fname)) {
            $jso = json_decode(file_get_contents($creds_fname));
            return array(
                "host" => $jso->host,
                "dbname" => $jso->dbname,
                "user" => $jso->user,
                "pass" => $jso->pass
            );
        }
        
        throw new RuntimeException("Cannot read db credentials");
    }
}
