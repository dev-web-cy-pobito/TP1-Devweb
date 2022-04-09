<?php

include_once "../config.php";
include_once 'db.php';

$json_jobs_path = "../data/activity.json";
$json_puffles_path = "../data/puffles.json";

// Create connection
$db = new DB($_SERVER["config"]['db_host'],'Puffles', $_SERVER["config"]['db_username'],$_SERVER["config"]['db_password']);

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

// Add puffles to DB
$json_puffles = file_get_contents($json_puffles_path);
$puffles_full = json_decode($json_puffles);

$registered_cats = array();

foreach ($puffles_full as $puffle) {
  $db->setSimpleValues('puffles',[
    'name' => $puffle->name,
    'pic_url' => $puffle->pic_url,
    'description' => $puffle->description,
    'stock' => $puffle->stock,
    'price' => ($puffle->price != null) ?  $puffle->price : 0,
    'apparition_date' => $puffle->date
  ]);
  $puff_id = $db->getLastInsertId();
  foreach ($puffle->categories as $cat) {
    if (! array_key_exists($cat,$registered_cats)) {
      $db->setSimpleValues('categories', ['name' => $cat]);
      $registered_cats += [$cat => $db->getLastInsertId(),];
    }
    $db->setSimpleValues('categorized_puffles', ['puffle_id' => $puff_id, 'category_id' => $registered_cats[$cat]]);
  }
  
}


?>