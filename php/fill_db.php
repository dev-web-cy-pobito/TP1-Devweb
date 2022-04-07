<?php

include_once "../config.php";
include_once 'db.php';

$json_jobs_path = "../data/activity.json";
$json_jobs_path = "../data/puffles.json";

// Create connection
$db = new DB($_CONFIG['db_host'],'Puffles', $_CONFIG['db_username'],$_CONFIG['db_password']);

// Add jobs to the DB
$json_jobs = file_get_contents($json_jobs_path);

$jobs_full = json_decode($json_jobs);

foreach ($jobs_full as $cat) {
  $db->setSimpleValues('job_cats',['name' => $cat->text], $id=false, $ignore=true);
  $cat_id = $db->getLastInsertId();
  foreach ($cat->children as $job) {
      $db->setSimpleValues('jobs',['name' => $job->text], $id=false, $ignore=true);
      $db->setSimpleValues('job_to_cat', ['job_id'=> $db->getLastInsertId(), 'category_id'=> $cat_id], $id=false, $ignore=true);
  }
}

// Add puffles to DB
$json_puffles = file_get_contents($json_puffles_path);
$puffles_full = json_decode($json_puffles);

foreach ($puffles as $puffle) {
  $db->setSimpleValues('puffles',[
    'name' => $puffle->name,
    'pic_url' => $puffle->pic_url,
    'description' => $puffle->description,
    'stock' => $puffle->stock,
    'price' => ($puffle->price != null) ?  $puffle->price : 0,
]);
}


?>