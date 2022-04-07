<?php
include_once "../config.php";
include_once "../php/job.php";

$jobs = new Jobs(new DB($_CONFIG['db_host'],'Puffles', $_CONFIG['db_username'],$_CONFIG['db_password']));

echo json_encode($jobs->getOrgJobs(), JSON_PRETTY_PRINT);
// echo json_encode($jobs->getJobsFromCatId(71), JSON_PRETTY_PRINT);

?>