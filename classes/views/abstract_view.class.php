<?php

namespace Views;

require_once(__DIR__ . "/iview.class.php");
require_once(__DIR__ . "/../session.class.php");
require_once(__DIR__ . "/../site_config_factory.class.php");
require_once(__DIR__ . "/../dbif.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../nav_link_factory.class.php");
require_once(__DIR__ . "/../resource_config.class.php");

require_once(__DIR__ . "/../../lib_autoload.php");


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
        $site_cfg = \SiteConfigFactory::get()->get_site_config();
        
        $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . "/../../templates");
        $twig_opt = $site_cfg->twig_compilation_cache_path()
                        ? [ "cache" => $site_cfg->twig_compilation_cache_path(), ]
                        : [];
        $twig = new \Twig\Environment($loader, $twig_opt);
        $text_storage = \UITextStorage::get();
        
        $data = $this->get_view_data($this->_params);
        
        $base_uri = $site_cfg->base_uri();
        $language = $text_storage->get_language();
        $src_conf = \ResourceConfig::get();
        $dbif = \DBIF::get();
        
        $data["__base_uri"] = $base_uri;
        $data["__management_url"] = $base_uri;
        $data["__contact_info"] = $this->make_contact_info($text_storage);
        $data["__header_logo_uri"] = str_replace("{lang}", $language, $base_uri . $dbif->get_header_logo_uri());
        $data["__small_logo_uri"] = $data["__header_logo_uri"];
        $data["__footer_img_uri"] = $base_uri . $dbif->get_footer_img_uri();
        $data["__color_css_uri"] = "{$base_uri}{$dbif->get_color_css_uri()}?v={$src_conf->get_css_src_version()}";
        $data["__lang"] = $language;
        $data["__nav_links"] = $this->_nlf->get_nav_links();
        $data["__footer_only_nav_links"] = $this->_nlf->get_footer_only_nav_links($this->cookie_prompt_enabled());
        $data["__lang_links"] = $this->_nlf->get_lang_links();
        $data["__all_lang_links"] = $this->_nlf->get_all_lang_links();
        $data["__js_texts"] = $this->get_js_texts();
        $data["__js_src_mode"] = $src_conf->get_js_src_mode();
        $data["__js_src_version"] = $src_conf->get_js_src_version();
        $data["__css_src_version"] = $src_conf->get_css_src_version();
        $data["__css_src_mode"] = $src_conf->get_css_src_mode();
        $data["__scale_mobile"] = $this->is_mobile_scale_enabled();
        $data["__facebook_page_url"] = \DBIF::get()->get_facebook_page_url();
        $data["__ga"] = $site_cfg->tracking_enabled() && $this->allow_tracking();
        $data["__cookie_prompt_enabled"] = $this->cookie_prompt_enabled();
        
        $data["__strings"] = [
            "footer_promo" => $text_storage->text("FRONT_PAGE_SH_CAPTION_TEXT"),
            "name_short" => $text_storage->text("CONTACT_INFO_FP_NAME"),
            "footer_navigation" => $text_storage->text("FOOTER_NAVIGATION_TITLE"),
            "contact_info_title" => $text_storage->text("CONTACT_INFO_FP_TITLE"),
            "contact_prompt" => $text_storage->text("CONTACT_PROMPT_TEXT"),
            "contact_policy" => $text_storage->text("CONTACT_POLICY"),
            
            "field_name" => $text_storage->text("CONTACT_FIELD_NAME"),
            "field_email" => $text_storage->text("CONTACT_FIELD_EMAIL"),
            "field_subject" => $text_storage->text("CONTACT_FIELD_SUBJECT"),
            "field_message" => $text_storage->text("CONTACT_FIELD_MESSAGE"),
            "submit" => $text_storage->text("CONTACT_SUBMIT"),
            
            "placeholder" => [
                "message" => $text_storage->text("PH_CONTACT_MESSAGE"),
            ],
            
            "news_title" => $text_storage->text("NEWS_TITLE"),
            "news_content" => $text_storage->text("NEWS_CONTENT"),
            "cookie_consent_body" => [
                "first" => $text_storage->text("COOKIE_CONSENT_PROMPT_BODY_1"),
                "second" => $text_storage->text("COOKIE_CONSENT_PROMPT_BODY_2"),
                "allow_btn" => $text_storage->text("COOKIE_CONSENT_PROMPT_BODY_BTN_ALLOW"),
                "deny_btn" => $text_storage->text("COOKIE_CONSENT_PROMPT_BODY_BTN_DENY"),
            ],
        ];
        if (!array_key_exists("prefill", $data)) {
            $data["prefill"] = [
                "name" => "",
                "email" => "",
                "subject" => "",
                "message" => "",
                "url" => "", // hidden captcha
                "company" => "company name oy", // hidden captcha
            ];
        }
        if (!array_key_exists("allow_hreflang", $data)) {
            $data["allow_hreflang"] = true;
        }
        
        if ($this->allow_cache()) {
            header("Cache-Control: max-age=7200, must-revalidate");
        } else {
            header("Cache-Control: max-age=0, no-store, no-cache, must-revalidate");
            header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
            header("Pragma: no-cache");
        }
        
        $tmpl = $twig->load($this->get_template_name());
        echo $tmpl->render($data);
    }
    
    
    private function make_contact_info(\UITextStorage $text_storage) {
        return array(
            "name" => $text_storage->text("CONTACT_TEXT_NAME"),
            "address" => $text_storage->text("CONTACT_TEXT_STREET_ADDRESS"),
            "postal_code" => $text_storage->text("CONTACT_TEXT_POSTAL_CODE"),
            "city" => $text_storage->text("CONTACT_TEXT_CITY"),
            "business_id" => $text_storage->text("CONTACT_TEXT_BUSINESS_ID"),
            "phone_number" => $text_storage->text("CONTACT_TEXT_PHONE_NUMBER"),
        );
    }
    
    
    private function validate_params($params) {
        $diff = array_diff($this->get_required_params(), array_keys($params));
        if (count($diff) > 0) {
            throw new \InvalidArgumentException("Missing required parameters: " . implode(", ", $diff));
        }
        
        $req_sess_params = $this->get_required_session_params();
        if (!empty($req_sess_params)) {
            $diff = [];
            $session = $this->get_session();
            foreach ($req_sess_params as $key) {
                if (!$session->has_data($key)) {
                    $diff[] = $key;
                }
            }
            if (count($diff) > 0) {
                if ($rd = $this->get_session_redirect_uri()) {
                    $language = \UITextStorage::get()->get_language();
                    header("HTTP/1.1 303 See Other");
                    header("Location: " . \SiteConfigFactory::get()->get_site_config()->base_uri() . "/{$language}{$rd}");
                }
                
                throw new \InvalidArgumentException("Missing required session parameters: " . implode(", ", $diff));
            }
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
     * Returns names of the required session parameters.
     * 
     * @return string[]
     */
    protected function get_required_session_params() {
        return [];
    }
    
    
    /**
     * Returns true if tracking scripts are allowed.
     *
     * @return boolean
     */
    protected function allow_tracking() {
        return true;
    }
    
    
    /**
     * Returns a URI to redirect to on missing session parameter.
     * 
     * @return string e.g. "/login"
     */
    protected function get_session_redirect_uri() {
        return null;
    }
    
    
    /**
     * @return \ISession
     */
    protected function get_session() {
        return \Session::get();
    }
    
    
    /**
     * @return boolean If the view output may be cached
     */
    protected function allow_cache() {
        return false;
    }
    
    
    /**
     * @return boolean If cookie consent should be prompted for.
     */
    protected function cookie_prompt_enabled() {
        return false; // globally disabled for now
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
