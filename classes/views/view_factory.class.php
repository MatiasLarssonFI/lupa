<?php

namespace Views;

require_once(__DIR__ . "/front_page_view.class.php");
require_once(__DIR__ . "/service_view.class.php");
require_once(__DIR__ . "/faq_view.class.php");
require_once(__DIR__ . "/contact_view.class.php");
require_once(__DIR__ . "/contact_submit_view.class.php");
require_once(__DIR__ . "/info_felling_view.class.php");
require_once(__DIR__ . "/info_partners_view.class.php");
require_once(__DIR__ . "/info_cookies_view.class.php");

require_once(__DIR__ . "/management_login_view.class.php");
require_once(__DIR__ . "/management_login_submit_view.class.php");
require_once(__DIR__ . "/management_logout_submit_view.class.php");

require_once(__DIR__ . "/work_list_view.class.php");
require_once(__DIR__ . "/work_item_submit_view.class.php");
require_once(__DIR__ . "/work_item_mass_submit_view.class.php");
require_once(__DIR__ . "/anti_csrf_token_view.class.php");
require_once(__DIR__ . "/work_item_csv_export_view.class.php");

require_once(__DIR__ . "/../nav_link_factory.class.php");
require_once(__DIR__ . "/../site_config_factory.class.php");


/**
 * Singleton.
 */
class ViewFactory {
    private static $_inst;
    
    /**
     * Returns the ViewFactory object.
     * 
     * @return ViewFactory
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Returns the view to serve given action.
     * 
     * @param string $action The action name
     * @param string[] $params The action parameters
     * @param string $language Current language
     * @param NavLinkFactory $nlf
     * @return IView
     */
    public function get_view($action, array $params, $language, \NavLinkFactory $nlf) {
        if ($action === "") {
            return new FrontPageView(array(), $nlf);
        } else if ($action === "contact") {
            return new ContactView(array(), $nlf);
        } else if ($action === "contact_submit") {
            return new ContactSubmitView($_POST, $nlf);
        }  else if ($action === "faq") {
            return new FAQView([], $nlf);
        } else if ($action === "puunkaato") {
            return new InfoFellingView([
                "uri" => "puunkaato/{$this->optional_element(0, "", $params)}"
            ], $nlf);
        } else if ($action === "partners") {
            return new InfoPartnersView([
                "uri" => "partners/{$this->optional_element(0, "", $params)}"
            ], $nlf);
        } /*else if ($action === "about_cookies") {
            return new InfoCookiesView([
                "uri" => "about_cookies/{$this->optional_element(0, "", $params)}"
            ], $nlf);
        }*/ else if ($action === "work_list" || $action === "work_table") {
            return new WorkListView([
                "state_filter" => $this->optional_element(0, "STATE_NEW", $params),
                "order_col" => $this->optional_element(1, "ts_created", $params),
                "order_dir" => $this->optional_element(2, "desc", $params),
                "page" => $this->optional_element(3, "1", $params),
            ], $nlf, $action === "work_table");
        } else if ($action === "work_item_submit") {
            return new WorkItemSubmitView($_POST, $nlf);
        } else if ($action === "work_item_mass_submit") {
            return new WorkItemMassSubmitView($_POST, $nlf);
        } else if ($action === "management_login") {
            return new ManagementLoginView([], $nlf);
        } else if ($action === "management_login_submit") {
            return new ManagementLoginSubmitView($_POST, $nlf);
        } else if ($action === "management_logout_submit") {
            return new ManagementLogoutSubmitView($_POST, $nlf);
        } else if ($action === "anti_csrf_token") {
            return new AntiCSRFTokenView([], $nlf);
        } else if ($action === "work_item_csv_export") {
            return new WorkItemCSVExportView([], $nlf);
        }
        
        // Bad request: redirect to front page
        // TBD: 404 page
        
        header("HTTP/1.1 303 See Other");
        header("Location: " . \SiteConfigFactory::get()->get_site_config()->base_uri());
        
        throw new \InvalidArgumentException("No view for action '{$action}'");
    }
    
    
    private function optional_element($key, $default, $storage) {
        return (isset($storage[$key]) ? $storage[$key] : $default);
    }
    
    
    protected function __construct() {}
}
