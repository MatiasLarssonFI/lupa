<?php

require_once (__DIR__ . "/imanagement_visitor.class.php");


interface IManagementItem {
    public function accept_management(\IManagementVisitor $v);
}
