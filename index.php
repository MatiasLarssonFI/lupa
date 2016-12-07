<?php

require_once(dirname(__FILE__) . "/classes/views/view_factory.class.php");
require_once(dirname(__FILE__) . "/classes/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/classes/site_config_factory.class.php");
require_once(dirname(__FILE__) . "/classes/views/exception_view.class.php");
require_once(dirname(__FILE__) . "/classes/nav_link_factory.class.php");

try {
    $request = array_merge(
                    array(
                        "action" => "", 
                        "params" => "",
                        "language" => SiteConfigFactory::get()->get_site_config()->default_language()
                    ),
                $_GET
            );
    $request["params"] = array_filter(explode("/", $request["params"]), "strlen"); // :<
    
    $actions = [
        "contact", "service"
    ];
    
    $nlf = new NavLinkFactory($request["action"], $request["params"], $actions, $request["language"]);
    
    UITextStorage::get()->try_change_language($request["language"]);
    Views\ViewFactory::get()->get_view($request["action"], $request["params"], $request["language"], $nlf)->render();
} catch (Exception $e) {
    $is_ajax = (isset($_REQUEST["is_ajax"]) ? $_REQUEST["is_ajax"] : false);
    $view = new Views\ExceptionView(array("exception" => $e, "is_ajax" => $is_ajax), $widgets);
    $view->render();
}
