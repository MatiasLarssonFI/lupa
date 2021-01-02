<?php

// Autoload for any libs that need it.

spl_autoload_register(function ($classname) {
    $dirs = [
        __DIR__ . "/lib/Twig-3.1.1/",
    ];

    foreach ($dirs as $dir) {
        $filename = $dir . str_replace("\\", "/", $classname) . ".php";
        if (file_exists($filename)) {
            require_once ($filename);
            break;
        }
    }
});
