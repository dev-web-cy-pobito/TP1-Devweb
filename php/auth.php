<?php


class Auth {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function checkLogin($email, $password) {
        return null;
    }
}

?>