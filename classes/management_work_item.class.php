<?php

require_once (__DIR__ . "/imanagement_visitor.class.php");


trait ManagementWorkItem {
    public function accept_management(\IManagementVisitor $v) {
        $v->visit_work_item($this);
    }
}
