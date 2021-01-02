<?php

require_once(__DIR__ . "/attack/icounter_attack_handleable.class.php");
require_once(__DIR__ . "/attack/__include.php");
require_once(__DIR__ . "/client_info.class.php");


/**
 * Singleton.
 * 
 * Handle security attacks.
 */
class CounterAttack {
    private static $_inst = null;
    private static $_log_file = null;
    
    private $_client_info;
    
    
    /**
     * Returns CounterAttack object.
     * 
     * @return \CounterAttack
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    public static function configure_log($filename) {
        self::$_log_file = $filename;
    }
    
    
    public function handle(\Attack\ICounterAttackHandleable $item) {
        if (self::$_log_file) {
            $input_str = substr(json_encode($item->get_input()), 0, 512);
            $session_str = json_encode($item->get_session_data());
            $dt = date("Y-m-d H:i:s");
            file_put_contents(self::$_log_file, "[{$dt}] [{$item->get_attack()}] [{$item->get_session_id()}] [{$this->make_client_address_string()}] {$input_str} {$session_str}" . PHP_EOL, FILE_APPEND);
        }
    }
    
    
    private function make_client_address_string() {
        $addrs = $this->_client_info->get_ip_addresses();
        return implode("_", array_map(function($ipaddr, $key) {
            return "{$key}:{$ipaddr}";
        }, $addrs, array_keys($addrs)));
    }
    
    
    protected function __construct() {
        $this->_client_info = new \ClientInfo();
    }
}
