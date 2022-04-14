<?php

include_once "../../php/db.php";
include_once "../../php/auth.php";

session_start();

if (isset($_POST["email"]) && isset($_POST["password"]) && !isset($_SESSION["user"])) {

    $auth = new Auth(new DB());
    try {
        $u = $auth->login($_POST["email"] ?? "", $_POST["password"] ?? "");
        if ($u != false) {
            $_SESSION["user"] = $u;
            header('Location: /');
        }
    } catch (Exception $e) {
        send_json(["error" => $e->getMessage()]);
    }
}
?>