<?php

namespace Views;

require_once(__DIR__ . "/abstract_management_view.class.php");
require_once(__DIR__ . "/../ui_text_storage.class.php");
require_once(__DIR__ . "/../work_item_factory.class.php");


class WorkItemCSVExportView extends AbstractManagementView {
    protected function get_required_params() {
        return [];
    }
    
    
    protected function get_template_name() {
        return "work_item_export.csv";
    }
    
    
    protected function get_view_data(array $params) {
        $text_storage = \UITextStorage::get();
        $dt = date("Y-m-d_Hi");
        
        header("Content-Type: text/csv"); 
        header("Content-Disposition: attachment; filename=lupa-work-lists_{$dt}.csv"); 
        
        return [
            "rows" => $this->csv_rows(),
            "strings" => [
                "subject_reference_short" => $text_storage->text("MANAGEMENT_WORK_LIST_SUBJECT_REFERENCE_LABEL_SHORT"),
                "label_name" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_NAME"),
                "label_email" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_EMAIL"),
                "label_subject" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_SUBJECT"),
                "label_message" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_MESSAGE"),
                "label_notes" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_NOTES"),
                "label_created" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_CREATED"),
                "label_changed" => $text_storage->text("MANAGEMENT_WORK_LIST_ITEM_LABEL_CHANGED"),
                "label_archived" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE_ARCHIVED"),
                "label_state" => $text_storage->text("MANAGEMENT_WORK_LIST_STATE"),
            ],
        ];
    }
    
    
    private function csv_rows() {
        $wif = \WorkItemFactory::get();
        $text_storage = \UITextStorage::get();
        foreach ($wif->yield_all_items() as $item) {
            $h = fopen("php://temp", "w+");
            fputcsv($h, [
                $item->get_subject_reference(),
                $item->get_name(),
                $item->get_email(),
                $item->get_subject(),
                $item->get_message(),
                $item->get_notes(),
                $text_storage->text("MANAGEMENT_WORK_LIST_{$item->get_state()}"),
                $item->is_archived() ? 1 : 0,
                $item->get_datetime_created(),
                $item->get_datetime_state(),
            ]);
            rewind($h);
            $row = stream_get_contents($h);
            fclose($h);
            yield $row;
        }
    }
}
