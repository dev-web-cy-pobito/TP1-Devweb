<?php

include_once '../php/forms.php';

$jobs = array(
    'cuisto',
    'dev',
);

$format = array(
    'first_name' => array(),
    'last_name' => array(),
    'email' => array(
        'type' => 'email',
    ),
    'birth' => array(
        'type' => 'date',
    ),
    'gender' => array(
        'type' => 'preselection',
        'options' => array(
            'male','female',
        ),
    ),
    'activity' => array(
        'type' => 'preselection',
        'options' => $jobs,
    ),
    'subject' => array(),
    'message' => array(),
);

try {
    echo json_encode(validateObject($_POST, $format));
} catch (Exception $e) {
    if ($e->getCode() == 1) {
        echo $e->getMessage();
    };
    
}

?>
