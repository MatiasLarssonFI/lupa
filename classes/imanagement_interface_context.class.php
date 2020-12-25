<?php

interface IManagementInterfaceContext {
    /**
     * Returns a WorkItem based on the DB row.
     * 
     * @param array $row The DB row
     * @return \WorkItem
     */
    public function make_work_item_from_db_row(array $row);
}
