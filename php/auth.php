<?php

include_once "db.php";

class Auth {
    private $db;

    public function __construct(DB $db) {
        $this->db = $db;
    }

    public function getUser($email) {
        $r = $this->db->getOneBy("users", "email", $email);
        return $r;
    }

    public function login($email, $password) {
        $u = $this->getUser($email);
        if ($u != false) {
            if (password_verify($password, $u["password_hash"])) {
                return true;
            }
        }
        return false;
    }

    public function register($email, $password, $permission = 1) {
        if ($this->getUser($email) != false) {
            throw new Error("User with this email already exists");
        }
        $this->db->setSimpleValues("users", ["email"=>$email, "password_hash" => password_hash($password, PASSWORD_DEFAULT), "permission" => $permission]);
    }
}

?>