<?php

require_once (__DIR__ . "/imanagement_visitor.class.php");


interface IManagementItem {
    public function visit_work_item(IManagementVisitor $v);
}
