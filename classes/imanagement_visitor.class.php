<?php

require_once(__DIR__ . "/work_item.class.php");


interface IManagementVisitor {
    public function visit_work_item(\WorkItem $item);
}
