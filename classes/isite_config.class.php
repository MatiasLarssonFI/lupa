<?php

interface ISiteConfig {
    public function base_uri();
    public function host();
    public function email_address_host();
    public function default_language();
    public function db_login_params();
    public function db_table_prefix();
    public function tracking_enabled();
}
