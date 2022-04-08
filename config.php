<?php

$_SERVER["config"] = array(
    'db_host' => 'localhost',
    'db_username' => 'abc',
    'db_password' => 'freforlife',
    'db_database' => 'Puffles'
);

function send_json($o) {
    header('Content-type: json/application');
    echo json_encode($o);
}

?>