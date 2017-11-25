<?php

namespace Views;

require_once(dirname(__FILE__) . "/front_page_view.class.php");
require_once(dirname(__FILE__) . "/service_view.class.php");
require_once(dirname(__FILE__) . "/faq_view.class.php");
require_once(dirname(__FILE__) . "/contact_view.class.php");
require_once(dirname(__FILE__) . "/contact_submit_view.class.php");
require_once(dirname(__FILE__) . "/../nav_link_factory.class.php");

require_once(dirname(__FILE__) . "/../site_config_factory.class.php");


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
        }  else if ($action === "frequently-asked-questions") {
            return new FAQView([], $nlf);
        }
        
        // Bad request: redirect to front page
        
        header("HTTP/1.1 303 See Other");
        header("Location: " . \SiteConfigFactory::get()->get_site_config()->base_uri());
        
        throw new \InvalidArgumentException("No view for action '{$action}'");
    }
    
    
    private function optional_element($key, $default, $storage) {
        return (isset($storage[$key]) ? $storage[$key] : $default);
    }
    
    
    protected function __construct() {}
}
