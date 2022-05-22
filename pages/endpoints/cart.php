<?php

include_once "../../php/puffles.php";

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $_SESSION['cart'] = $data;
    return send_json("ok");
} else {
    return send_json(isset($_SESSION['cart']) ? $_SESSION['cart'] : []);
}

?>