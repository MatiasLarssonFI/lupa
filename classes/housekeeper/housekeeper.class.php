<?php

namespace Housekeeper;

require_once(__DIR__ . "/../hook/iobserver.class.php");
require_once(__DIR__ . "/../hook/ihook_service.class.php");

require_once(__DIR__ . "/../work_item_factory.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../imanagement_item.class.php");
require_once(__DIR__ . "/../imanagement_visitor.class.php");

require_once(__DIR__ . "/delete_visitor.class.php");
require_once(__DIR__ . "/archive_visitor.class.php");


class Housekeeper implements \Hook\IObserver {
    private static $_inst;
    
    private $_wif;
    
    
    /**
     * @return Housekeeper
     */
    public static function get() {
        if (!self::$_inst) {
            self::$_inst = new self();
        }
        return self::$_inst;
    }
    
    
    public static function enable(\Hook\IHookService $hs) {
        $hs->subscribe("login.management.success", self::get());
    }
    
    
    public function notify() {
        $del_visitor = new DeleteVisitor(\UITextStorage::get());
        $arch_visitor = new ArchiveVisitor(\UITextStorage::get());
        
        $this->_wif->mi()->each_archived_before(strtotime("18 months ago"), function(\IManagementItem $mi) use ($del_visitor) {
            $mi->accept_management($del_visitor);
        });
        
        
        $this->_wif->mi()->each_finished_before(strtotime("3 months ago"), function(\IManagementItem $mi) use ($arch_visitor) {
            $mi->accept_management($arch_visitor);
        });
        
        $msg_del = $del_visitor->get_message();
        $msg_arch = $arch_visitor->get_message();
        $sep = strlen($msg_del) > 0 && strlen($msg_arch) > 0 ? PHP_EOL : "";
        
        return new \Hook\CallbackResult("{$msg_del}{$sep}{$msg_arch}");
    }
    
    
    protected function __construct() {
        $this->_wif = \WorkItemFactory::get();
    }
}