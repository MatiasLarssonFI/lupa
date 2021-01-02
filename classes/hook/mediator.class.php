<?php

namespace Hook;


require_once(__DIR__ . "/iobserver.class.php");
require_once(__DIR__ . "/ihook_service.class.php");
require_once(__DIR__ . "/notify_result.class.php");


// Mediator facade for hooking
class Mediator implements IHookService {
    private static $_inst;
    
    private $_observers;
    
    
    /**
     * @return \Hook\Mediator
     */
    public static function get() {
        if (!self::$_inst) {
            self::$_inst = new self();
        }
        return self::$_inst;
    }
    
    
    public function subscribe(string $hook, IObserver $obs) {
        if (!array_key_exists($hook, $this->_observers)) {
            $this->_observers[$hook] = [];
        }
        $this->_observers[$hook][] = $obs;
    }
    
    
    /**
     * Notify the subscribed hooks (i.e. observers).
     * @param  string $hook
     * @return NotifyResult
     */
    public function notify(string $hook) {
        $res = new NotifyResult();
        foreach ($this->_observers[$hook] as $obs) {
            $res->add_callback_result($obs->notify());
        }
        return $res;
    }
    
    
    protected function __construct() {
        $this->_observers = [];
    }
}