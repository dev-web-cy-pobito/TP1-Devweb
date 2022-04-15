<?php

include_once "../../php/puffles.php";

$puffles = new Puffles(new DB());
$json = file_get_contents('php://input');

$data = json_decode($json);
send_json($puffles->getPufflesFromCatsId($data), JSON_PRETTY_PRINT);


?>