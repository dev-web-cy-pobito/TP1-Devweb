<?php

include_once '../../php/forms.php';
include_once '../../php/db.php';
include_once '../../php/job.php';

$job = (new Jobs(new DB()));

$format = array(
    'first-name' => array(),
    'last-name' => array(),
    'mail' => array(
        'type' => 'email',
    ),
    'date' => array(
        'type' => 'date',
    ),
    'gender' => array(
        'type' => 'preselection',
        'options' => array(
            'm','f',
        ),
    ),
    'activity' => array(
        'type' => 'integer',
        'options' => array()
    ),
    'subject' => array(),
    'message' => array(),
);

try {
    if (json_encode(validateObject($_POST, $format)) && $job->jobExists($_POST["activity"])) {
        send_json(["redirect" => "mailto:spam@palmes.dev?subject=" . $_POST["subject"] . "&body=" . $_POST["message"]]);
    }
} catch (Exception $e) {
    send_json(["error" => $e->getMessage()]);
    
}

?>
