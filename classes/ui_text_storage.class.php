<?php

require_once(dirname(__FILE__) . "/dbif.class.php");
require_once(dirname(__FILE__) . "/site_config_factory.class.php");


/**
 * Singleton.
 */
class UITextStorage {
    private $_texts;
    private $_is_loaded;
    private $_lang_codes;
    private $_current_language;
    
    private static $_inst;
    
    
    /**
     * Returns the UITextStorage object.
     * 
     * @return UITextStorage
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self(\SiteConfigFactory::get()->get_site_config()->default_language());
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Try to change the language and fail quietly.
     * 
     * Failing results in falling back to the default language.
     * 
     * @param string $language ISO-3166, 2 chars
     */
    public function try_change_language($language) {
        if (in_array($language, $this->_lang_codes) &&
            $this->_current_language !== $language) {
            
            $this->_is_loaded = false;
            $this->_current_language = $language;
        }
    }
    
    
    /**
     * Returns the UI text in current language.
     * 
     * @param string $code The UI text code
     */
    public function text($code) {
        if (!$this->_is_loaded) {
            $this->load_texts($this->_current_language);
            $this->_is_loaded = true;
        }
        if (array_key_exists($code, $this->_texts)) {
            return $this->_texts[$code];
        }
        
        return "[{$code}]";
    }
    
    
    /**
     * Returns the current language ISO 3166-1 alpha-2 code.
     * 
     * @return string
     */
    public function get_language() {
        return $this->_current_language;
    }
    
    
    private function load_texts($language) {
        $texts = &$this->_texts;
        $texts = [];
        DBIF::get()->get_ui_texts($language, function(array $row) use(&$texts) {
            $texts[$row["code"]] = $row["content"];
        });
    }
    
    
    protected function __construct($language) {
        $this->_is_loaded = false;
        $this->_lang_codes = DBIF::get()->get_language_codes();
        $this->try_change_language($language);
    }
}
