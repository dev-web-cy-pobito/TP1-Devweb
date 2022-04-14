<?php

include_once "../../php/job.php";

$jobs = new Jobs(new DB());

echo json_encode($jobs->getOrgJobs(), JSON_PRETTY_PRINT);
?>