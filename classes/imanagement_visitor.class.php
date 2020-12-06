<?php

require_once(__DIR__ . "/housekeeper/ihousekeepable.class.php");


interface IManagementVisitor {
    public function visit_housekeepable(\Housekeeper\IHousekeepable $item);
}
