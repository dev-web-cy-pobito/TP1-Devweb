<?php

include_once 'db.php';

$servername = "localhost";
$username = "abc";
$password = "freforlife";
$json_jobs_path = "../data/activity.json";

// Create connection
$db = new DB($servername,'Puffles', $username,$password);


// Add jobs to the DB
$json_jobs = file_get_contents($json_jobs_path);

$jobs_full = json_decode($json_jobs);

foreach ($jobs_full as $cat) {
  $db->setSimpleValues('job_categories',['name' => $cat->text], $id = false, $ignore=true);
  $cat_id = $db->getLastInsertId();
  foreach ($cat->children as $job) {
      $db->setSimpleValues('jobs',['name' => $job->text, 'category_id' => $cat_id], $id = false, $ignore=true);
  }
}

?>