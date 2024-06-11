<?php
    session_start();
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        $_SESSION["v-code"]=$_POST["code"];
    
        echo json_encode([
            "result"=>$_SESSION["v-code"],
            "code"=>$_POST["code"]
        ]);
    }
?>