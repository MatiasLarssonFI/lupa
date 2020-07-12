<?php

require_once(dirname(__FILE__) . "/site_config_factory.class.php");

require_once(dirname(__FILE__) . "/icontact_message.class.php");
require_once(dirname(__FILE__) . "/isavable_work_item.class.php");


/**
 * Singleton.
 */
class DBIF {
    private $_pdo;
    private $_table_prefix;
    
    private static $_inst = null;
    
    
    /**
     * Returns the DBIF object.
     * 
     * @return DBIF
     */
    public static function get() {
        if (self::$_inst === null) {
            self::$_inst = new self();
        }
        
        return self::$_inst;
    }
    
    
    /**
     * Get the UI texts.
     * 
     * Calls cb_store_row on each row.
     */
    public function get_ui_texts($language, $cb_store_row) {
        $stm = $this->_pdo->prepare("SELECT code, content FROM {$this->_table_prefix}ui_text where language = :lang");
        $stm->bindParam(":lang", $language, PDO::PARAM_STR);
        $stm->execute();

        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    /**
     * Returns ISO-3166 -codes of the supported languages.
     * 
     * @return string[]
     */
    public function get_language_codes() {
        $ret = array();
        
        $stm = $this->_pdo->prepare("SELECT DISTINCT language FROM {$this->_table_prefix}ui_text");
        $stm->execute();

        while ($row = $stm->fetch()) {
            $ret[] = $row["language"];
        }
        
        return $ret;
    }
    
    
    /**
     * Returns the facebook page url.
     * 
     * @return string
     */
    public function get_facebook_page_url() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'facebook_page_url'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    
    /**
     * Get the front page slides.
     * 
     * Calls cb_store_row on each row.
     */
    public function get_front_page_slides($cb_store_row) {
        $stm = $this->_pdo->prepare(
            "SELECT html, id
            FROM {$this->_table_prefix}slide
                where content_target = 'front_page'
                and is_published");
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    /**
     * Get the videos page videos.
     * 
     * Calls cb_store_row on each row.
     */
    public function get_front_page_videos($cb_store_row) {
        $stm = $this->_pdo->prepare(
                            "SELECT
                                thumb_url,
                                name,
                                vf.video_url as video_url,
                                v.id
                             FROM {$this->_table_prefix}video v
                             inner join {$this->_table_prefix}video_file vf on vf.video_id = v.id
                             order by v.id asc");
        $stm->execute();
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    /**
     * Get one videos page video.
     * 
     * Calls cb_store_row on each row.
     * 
     * @param int $id
     */
    public function get_front_page_video($id, $cb_store_row) {
        $stm = $this->_pdo->prepare(
                            "SELECT
                                thumb_url,
                                name,
                                vf.video_url as video_url,
                                v.id
                             FROM {$this->_table_prefix}video v
                             inner join {$this->_table_prefix}video_file vf on vf.video_id = v.id
                             where v.id = :id");
        $stm->bindParam(":id", $id, PDO::PARAM_INT);
        $stm->execute();
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    /**
     * Get the services.
     * 
     * Calls cb_store_row on each row.
     */
    public function get_services($cb_store_row, $language) {
        $sql = 
            "SELECT
                s.id,
                s.icon_uri,
                st.title,
                st.subtitle,
                st.text,
                si.image_uri,
                st.link_uri
            from {$this->_table_prefix}service s
            
            inner join {$this->_table_prefix}service_text st on s.id = st.service_id
            inner join {$this->_table_prefix}service_image si on s.id = si.service_id
            
            where st.language = :lang
            
            order by s.sort asc, s.id
            ";
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":lang", $language, PDO::PARAM_STR);
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    /**
     * Returns URI of the CSS file of colors.
     * 
     * @return string
     */
    public function get_color_css_uri() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'color_css_uri'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns URI of the footer image.
     * 
     * @return string
     */
    public function get_footer_img_uri() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'footer_img_uri'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns URI of the header image.
     * 
     * @return string
     */
    public function get_header_img_uri() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'header_img_uri'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns the contact form email recipient.
     * 
     * @return string
     */
    public function get_contact_email() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'contact_email'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns the mail server URI.
     * 
     * @return string
     */
    public function get_mail_server() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'mail_server'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns the mail server username.
     * 
     * @return string
     */
    public function get_mail_user() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'mail_user'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns URI of the header logo image.
     * 
     * @return string
     */
    public function get_header_logo_uri() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'header_logo_uri'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    /**
     * Returns the resource configuration values.
     * 
     * @return string[], keys are js_src_mode, js_src_version and css_src_version
     */
    public function get_resource_configuration() {
        $stm = $this->_pdo->prepare("SELECT `key`, `value` from {$this->_table_prefix}config where `key` in ('js_src_mode', 'js_src_version', 'css_src_version', 'css_src_mode')");
        $stm->execute();
        $ret = array();
        while ($row = $stm->fetch()) {
            $ret[$row["key"]] = $row["value"];
        }
        
        return $ret;
    }
    
    
    /**
     * Returns the mail server password.
     * 
     * @return string
     */
    public function get_mail_password() {
        $stm = $this->_pdo->prepare("SELECT `value` from {$this->_table_prefix}config where `key` = 'mail_password'");
        $stm->execute();
        return $stm->fetchColumn();
    }
    
    
    public function insert_contact_message(IContactMessage $message) {
        $stm = $this->_pdo->prepare("INSERT INTO `{$this->_table_prefix}contact_inbox` (name, email, subject, message, time_created) VALUES(:name, :email, :subject, :message, now())");
        
        $name = $message->get_name();
        $email = $message->get_email();
        $subject = $message->get_subject();
        $msg = $message->get_message();
        
        $stm->bindParam(":name", $name, PDO::PARAM_STR);
        $stm->bindParam(":email", $email, PDO::PARAM_STR);
        $stm->bindParam(":subject", $subject, PDO::PARAM_STR);
        $stm->bindParam(":message", $msg, PDO::PARAM_STR);
        $stm->execute();
        return $this->_pdo->lastInsertId();
    }
    
    
    /**
     * Get the FAQ answers.
     * 
     * Calls cb_store_row on each row.
     */
    public function get_faq_answers($cb_store_row, $language) {
        $sql = 
            "SELECT
                a.id,
                a.image_uri,
                at.question,
                at.answer
            from {$this->_table_prefix}faq_answer a
            inner join {$this->_table_prefix}faq_answer_text at on a.id = at.faq_answer_id
            where at.language = :lang
            order by a.id
            ";
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":lang", $language, PDO::PARAM_STR);
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    public function get_info_page_contents($cb_store_row, $language, $uri) {
        $sql = 
            "SELECT
                a.id,
                at.title,
                am.html_title,
                at.content,
                at.is_html,
                at.image_uri,
                at.image_description,
                at.video_id
            from {$this->_table_prefix}info_page a
            inner join {$this->_table_prefix}info_page_content at on a.uri = at.uri
            inner join {$this->_table_prefix}info_page_meta am on a.uri = am.uri
            where at.language = :lang
            and a.uri = :uri
            order by at.position asc
            ";
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":lang", $language, PDO::PARAM_STR);
        $stm->bindParam(":uri", $uri, PDO::PARAM_STR);
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    public function get_info_page_links($cb_store_row, $language, $root) {
        $sql = 
            "SELECT
                a.uri,
                at.title
            from {$this->_table_prefix}info_page a
            inner join {$this->_table_prefix}info_page_content at
                on a.uri = at.uri
                and length(at.title) > 0
                and length(at.content) = 0
                and at.language = :lang
            where a.uri like :root
            order by at.title asc
            ";
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":lang", $language, PDO::PARAM_STR);
        $stm->bindValue(":root", "{$root}/%", PDO::PARAM_STR);
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            $cb_store_row($row);
        }
    }
    
    
    public function yield_work_items($state_filter, $order_col, $order_direction, $cb_make_item) {
        $sql =
            "SELECT
                 wi.id                  as id
                ,c.name                 as name
                ,c.email                as email
                ,c.subject              as subject
                ,c.message              as message
                ,wi.notes               as notes
                ,wi.state               as state
                ,wi.is_archived         as is_archived
                ,c.time_created         as ts_created
                ,wi.time_state_changed  as ts_state

            from {$this->_table_prefix}contact_inbox c
            inner join {$this->_table_prefix}work_item wi
                on wi.contact_inbox_id = c.id

            where (wi.state = :state_filter and not wi.is_archived)
            or (:state_filter = 'ARCHIVE' and wi.is_archived)

            order by {$order_col} {$order_direction}
            ";
        
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":state_filter", $state_filter, PDO::PARAM_STR);
        $stm->execute();
        
        while ($row = $stm->fetch()) {
            yield $cb_make_item($row);
        }
    }
    
    
    public function get_work_item($id) {
        $sql =
            "SELECT
                 wi.id                  as id
                ,c.name                 as name
                ,c.email                as email
                ,c.subject              as subject
                ,c.message              as message
                ,wi.notes               as notes
                ,wi.state               as state
                ,wi.is_archived         as is_archived
                ,c.time_created         as ts_created
                ,wi.time_state_changed  as ts_state

            from {$this->_table_prefix}contact_inbox c
            inner join {$this->_table_prefix}work_item wi
                on wi.contact_inbox_id = c.id

            where wi.id = :id
            ";
        
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":id", $id, PDO::PARAM_INT);
        $stm->execute();
        return $stm->fetch();
    }
    
    
    public function insert_work_item(\ISavableWorkItem $work_item, $contact_inbox_id) {
        $stm = $this->_pdo->prepare("INSERT INTO `{$this->_table_prefix}work_item` (contact_inbox_id, state, time_created, time_state_changed) VALUES(:contact_inbox_id, :state, now(), now())");
        $stm->bindValue(":contact_inbox_id", $contact_inbox_id, PDO::PARAM_INT);
        $stm->bindValue(":state", $work_item->get_state(), PDO::PARAM_STR);
        $stm->execute();
        return $this->_pdo->lastInsertId();
    }
    
    
    public function update_work_item(\ISavableWorkItem $work_item, $record_history) {
        //TBD: record history
        $stm = $this->_pdo->prepare("UPDATE `{$this->_table_prefix}work_item` SET state = :state, is_archived = :is_archived, notes = :notes, time_state_changed = now() where id = :id");
        $stm->bindValue(":state", $work_item->get_state(), PDO::PARAM_STR);
        $stm->bindValue(":notes", $work_item->get_notes(), PDO::PARAM_STR);
        $stm->bindValue(":is_archived", $work_item->is_archived() ? 1 : 0, PDO::PARAM_INT);
        $stm->bindValue(":id", $work_item->get_id(), PDO::PARAM_INT);
        $stm->execute();
        return $work_item->get_id();
    }
    
    
    public function count_work_items($state_filter) {
        $sql =
            "SELECT count(*)

            from {$this->_table_prefix}contact_inbox c
            inner join {$this->_table_prefix}work_item wi
                on wi.contact_inbox_id = c.id

            where wi.state = :state_filter
            or (:state_filter = 'ARCHIVE' and wi.is_archived)
            ";
        
        $stm = $this->_pdo->prepare($sql);
        $stm->bindParam(":state_filter", $state_filter);
        $stm->execute();
        return (int)$stm->fetchColumn();
    }
    
    
    protected function __construct() {
        $site_conf = \SiteConfigFactory::get()->get_site_config();
        $db_login = $site_conf->db_login_params();
        $this->_table_prefix = $site_conf->db_table_prefix();
        try {
            $this->_pdo = new PDO("mysql:host={$db_login["host"]};dbname={$db_login["dbname"]}", "{$db_login["user"]}", "{$db_login["pass"]}");
        } catch (PDOException $e) {
            die("error " . base64_encode($e->getMessage()) . " We're fixing the problem and getting back up ASAP.");
        }

        $this->_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->_pdo->exec("SET NAMES utf8");
        ini_set("default_charset", "utf-8");
    }
}
