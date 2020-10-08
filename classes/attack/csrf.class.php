<?php

namespace Attack;

require_once(__DIR__ . "/icounter_attack_handleable.class.php");
require_once(__DIR__ . "/handleable.class.php");
require_once(__DIR__ . "/../isession.class.php");


class CSRF implements ICounterAttackHandleable {
    private $_attack;
    private $_session;
    private $_input;
    
    use Handleable;

    
    /**
     * Constructor.
     * 
     * @param string $endpoint
     * @param \ISession $session
     * @param array $input
     */
    public function __construct($endpoint, \ISession $session, array $input) {
        $this->_attack = "CSRF/{$endpoint}";
        $this->_session = $session;
        $this->_input = $input;
    }
}
