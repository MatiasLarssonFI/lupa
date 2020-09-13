<?php


class ClientInfo {
    private $_ip_addresses;
    
    
    /**
     * Returns all client's associated IP addresses.
     *
     * This includes the $_SERVER["REMOTE_ADDR"] as well as some HTTP headers.
     * The values are returned as an associative array. Each element is
     * guaranteed to contain a valid IP address string. The order of elements
     * is guaranteed to be the same on every call.
     *
     * Possible keys in the return array are listed below.
     * 'HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED',
     * 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED' and
     * 'REMOTE_ADDR'
     *
     * @return string[]
     */
    public function get_ip_addresses() {
        if ($this->_ip_addresses === null) {
            $this->_ip_addresses = [];
            // Proxies may set these headers (which will have these keys in $_SERVER), according to unverified sources on the Internet.
            foreach (["HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR", "HTTP_X_FORWARDED", "HTTP_X_CLUSTER_CLIENT_IP", "HTTP_FORWARDED_FOR", "HTTP_FORWARDED", "REMOTE_ADDR"] as $key) {
                if (array_key_exists($key, $_SERVER)){
                    foreach (explode(",", $_SERVER[$key]) as $ip) {
                        $ip = trim($ip);
                        if (filter_var($ip, FILTER_VALIDATE_IP) !== false) {
                            $this->_ip_addresses[$key] = $ip;
                        }
                    }
                }
            }
            ksort($this->_ip_addresses);
        }
        return $this->_ip_addresses;
    }
}
