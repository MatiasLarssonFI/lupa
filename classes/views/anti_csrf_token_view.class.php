<?php

namespace Views;

require_once(dirname(__FILE__) . "/abstract_view.class.php");
require_once(dirname(__FILE__) . "/../session.class.php");
require_once(dirname(__FILE__) . "/../management_session.class.php");
require_once(dirname(__FILE__) . "/../session_var.class.php");


class AntiCSRFTokenView extends AbstractView {
    protected function get_required_params() {
        return [];
    }
    
    
    protected function get_template_name() {
        return "anti_csrf_token.json";
    }
    
    
    protected function get_view_data(array $params) {
        header("Content-Type: application/json");
        
        $ms = \ManagementSession::get();
        $session = $ms->has_data(\SessionVar::MANAGEMENT_PERMISSION) ? $ms : \Session::get();
        
        return [
            "json" => json_encode([
                "token" => $session->get_csrf_token(),
            ])
        ];
    }
}
