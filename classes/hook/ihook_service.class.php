<?php

require_once(__DIR__ . "/iobserver.class.php");


interface IHookService {
    /**
     * Subscribe an observer to a hook.
     * @param string $hook
     * @param IObserver
     */
    public function subscribe(string $hook, IObserver $obs);
}
