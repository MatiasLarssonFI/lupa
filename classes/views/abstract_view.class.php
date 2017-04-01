<?php

namespace Views;

require_once(dirname(__FILE__) . "/iview.class.php");
require_once(dirname(__FILE__) . "/../session.class.php");
require_once(dirname(__FILE__) . "/../site_config_factory.class.php");
require_once(dirname(__FILE__) . "/../dbif.class.php");
require_once(dirname(__FILE__) . "/../ui_text_storage.class.php");
require_once(dirname(__FILE__) . "/../nav_link_factory.class.php");
require_once(dirname(__FILE__) . "/../resource_config.class.php");

require_once(dirname(__FILE__) . "/../../lib/Twig-1.24.0/Twig-1.24.0/lib/Twig/Autoloader.php");


/**
 * Template method pattern used here.
 */
abstract class AbstractView implements IView {
    private $_params;
    private $_nlf;
    
    
    /**
     * Constructor.
     * 
     * @param mixed[] $params An associative array of the view parameters, [ "param_name" => "param value", ... ]
     * @param \NavLinkFactory $nlf
     */
    public function __construct(array $params, \NavLinkFactory $nlf) {
        $this->validate_params($params);
        $this->_params = $params;
        $this->_nlf = $nlf;
    }
    
    
    public function render() {
        \Twig_Autoloader::register();
        $loader = new \Twig_Loader_Filesystem(dirname(__FILE__) . "/../../templates");
        $twig = new \Twig_Environment($loader, array());
        $text_storage = \UITextStorage::get();
        
        $data = $this->get_view_data($this->_params);
        
        $base_uri = \SiteConfigFactory::get()->get_site_config()->base_uri();
        $language = $text_storage->get_language();
        $src_conf = \ResourceConfig::get();
        $dbif = \DBIF::get();
        
        $data["__csrf_token"] = \Session::get()->get_csrf_token();
        $data["__base_uri"] = $base_uri;
        $data["__contact_info"] = $this->make_contact_info($text_storage);
        $data["__header_logo_uri"] = $base_uri . $dbif->get_header_logo_uri();
        $data["__small_logo_uri"] = $data["__header_logo_uri"];
        $data["__footer_img_uri"] = $base_uri . $dbif->get_footer_img_uri();
        $data["__str_up"] = $text_storage->text("UP");
        $data["__color_css_uri"] = "{$base_uri}{$dbif->get_color_css_uri()}?v={$src_conf->get_css_src_version()}";
        $data["__lang"] = $language;
        $data["__nav_links"] = $this->_nlf->get_nav_links();
        $data["__lang_links"] = $this->_nlf->get_lang_links();
        $data["__js_texts"] = $this->get_js_texts();
        $data["__js_src_mode"] = $src_conf->get_js_src_mode();
        $data["__js_src_version"] = $src_conf->get_js_src_version();
        $data["__css_src_version"] = $src_conf->get_css_src_version();
        $data["__scale_mobile"] = $this->is_mobile_scale_enabled();
        
        $data["__strings"] = [
            "footer_promo" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TEXT"),
            "name_short" => $text_storage->text("CONTACT_INFO_FP_NAME"),
            "footer_navigation" => $text_storage->text("FOOTER_NAVIGATION_TITLE"),
            "contact_info_title" => $text_storage->text("CONTACT_INFO_FP_TITLE"),
            "submit_email" => $text_storage->text("CONTACT_US"),
        ];
        
        echo $twig->render($this->get_template_name(), $data);
    }
    
    
    private function make_contact_info(\UITextStorage $text_storage) {
        return array(
            "name" => $text_storage->text("CONTACT_TEXT_NAME"),
            "address" => $text_storage->text("CONTACT_TEXT_STREET_ADDRESS"),
            "postal_code" => $text_storage->text("CONTACT_TEXT_POSTAL_CODE"),
            "city" => $text_storage->text("CONTACT_TEXT_CITY"),
            "business_id" => $text_storage->text("CONTACT_TEXT_BUSINESS_ID"),
        );
    }
    
    
    private function validate_params($params) {
        $diff = array_diff($this->get_required_params(), array_keys($params));
        if (count($diff) > 0) {
            throw new \InvalidArgumentException("Missing required parameters: " . implode(", ", $diff));
        }
    }
    
    
    /**
     * Returns true if scaling for mobile is enabled.
     * 
     * @return boolean
     */
    protected function is_mobile_scale_enabled() {
        return true;
    }
    
    
    /** 
     * Returns names of the required parameters.
     * 
     * @return string[]
     */
    abstract protected function get_required_params();
    
    
    /**
     * Returns the template file basename.
     * @return string
     */
    abstract protected function get_template_name();
    
    
    /** 
     * Returns the view data as an associative array.
     * 
     * The returned array is passed to the template.
     * 
     * @param mixed[] $params An associative array of the view parameters, [ "param_name" => "param value", ... ]
     * @return mixed[] e. g. [ "var_name" => "var value", ... ]
     */
    abstract protected function get_view_data(array $params);
    
    
    /** 
     * Returns the UI texts for JavaScript.
     * 
     * @return string[] [ "text_key" => "text string", ... ]
     */
    protected function get_js_texts() {
        return [];
    }
}
