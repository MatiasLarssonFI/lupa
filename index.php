<?php

ini_set("error_log", __DIR__ . "/error_log");
ini_set("log_errors", "1");
ini_set("display_errors", "0");
ini_set("error_reporting", E_ALL | E_STRICT);


require_once(dirname(__FILE__) . "/classes/views/view_factory.class.php");
require_once(dirname(__FILE__) . "/classes/ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/classes/site_config_factory.class.php");
require_once(dirname(__FILE__) . "/classes/views/exception_view.class.php");
require_once(dirname(__FILE__) . "/classes/nav_link_factory.class.php");
require_once(dirname(__FILE__) . "/classes/management_session.class.php");
require_once(dirname(__FILE__) . "/classes/action_factory.class.php");

try {
    \ManagementSession::configure_log(__DIR__ . "/session_log", \DBIF::get()->get_session_notifications_mask());
    \ManagementSession::configure_cookie("lupaSession", \SiteConfigFactory::get()->get_site_config()->host());
    
    $request = array_merge(
            array(
                "action" => "", 
                "params" => "",
                "language" => SiteConfigFactory::get()->get_site_config()->default_language()
            ),
        $_GET
    );
    $request["params"] = array_filter(explode("/", $request["params"]), "strlen"); // :<
    
    try {
        $ts = UITextStorage::get();
        $ts->try_change_language($request["language"]);
        $lang = $ts->get_language();
        $nlf = new NavLinkFactory($request["action"], $request["params"], ActionFactory::get()->get_nav_actions(), $lang);
        Views\ViewFactory::get()->get_view($request["action"], $request["params"], $lang, $nlf)->render();
    } catch (Exception $e) {
        $is_ajax = (isset($_REQUEST["is_ajax"]) ? $_REQUEST["is_ajax"] : false);
        $view = new Views\ExceptionView(array("exception" => $e, "is_ajax" => $is_ajax), $nlf);
        $view->render();
    }
} catch (Exception $e) {
    echo "Something went wrong. Sorry. Here, have this: " . base64_encode($e->getMessage());
}
    
