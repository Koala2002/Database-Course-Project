<?php
    session_start();
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

  

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        echo json_encode(['code'=>$_SESSION["v-code"]]);
    }
?>