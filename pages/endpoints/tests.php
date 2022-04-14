<?php

include_once "../../php/puffles.php";

$jobs = new Puffles(new DB($_CONFIG['db_host'],'Puffles', $_CONFIG['db_username'],$_CONFIG['db_password']));

echo json_encode($jobs->getPufflesFromCatsId([5,6,7]), JSON_PRETTY_PRINT);
// echo json_encode($jobs->getJobsFromCatId(71), JSON_PRETTY_PRINT);

?>