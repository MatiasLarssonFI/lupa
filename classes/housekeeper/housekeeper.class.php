<?php

namespace Housekeeper;

require_once(__DIR__ . "/../hook/iobserver.class.php");
require_once(__DIR__ . "/../hook/ihook_service.class.php");

require_once(__DIR__ . "/../work_item_factory.class.php");
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
        $del_visitor = new DeleteVisitor();
        $arch_visitor = new ArchiveVisitor();
        
        $this->_wif->mi()->each_archived_before(strtotime("18 months"), function(\IManagementItem $mi) use ($del_visitor) {
            $mi->accept_management($del_visitor);
        });
        
        
        $this->_wif->mi()->each_finished_before(strtotime("3 months"), function(\IManagementItem $mi) use ($arch_visitor) {
            $mi->accept_management($arch_visitor);
        });
        
        $msg_del = $del_visitor->get_message();
        $msg_arch = $arch_visitor->get_message();
        
        return new \Hook\CallbackResult( (strlen($msg_del) > 0 ? ($msg_del . PHP_EOL) : "") . $msg_arch );
    }
    
    
    protected function __construct() {
        $this->_wif = \WorkItemFactory::get();
    }
}