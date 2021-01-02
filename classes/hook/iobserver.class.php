<?php

namespace Hook;


interface IObserver {
    /**
     * @return CallbackResult
     */
    public function notify();
}