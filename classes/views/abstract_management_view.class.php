<?php

namespace Views;

require_once(__DIR__ . "/abstract_view.class.php");
require_once(__DIR__ . "/../management_session.class.php");
require_once(__DIR__ . "/../session_var.class.php");


/**
 * View that is only accessible with management permissions.
 */
abstract class AbstractManagementView extends AbstractView {
    protected function get_required_session_params() {
        return [ \SessionVar::MANAGEMENT_PERMISSION ];
    }
    
    
    protected function allow_tracking() {
        return false;
    }
    
    
    protected function cookie_prompt_enabled() {
        return false;
    }
    
    
    protected function get_session_redirect_uri() {
        return "/management_login";
    }
    
    
    protected function get_session() {
        return \ManagementSession::get();
    }
}
