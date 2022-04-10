<?php
include_once "../config.php";
include_once "../php/puffles.php";

$puffles = new Puffles(new DB());
$json = file_get_contents('php://input');

$data = json_decode($json);
echo json_encode($puffles->getPufflesFromCatsId($data), JSON_PRETTY_PRINT);


?>