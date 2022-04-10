<?php
include_once "../config.php";
include_once "../php/puffles.php";

$puffles = new Puffles(new DB());

echo json_encode($puffles->getCats(true), JSON_PRETTY_PRINT);
?>