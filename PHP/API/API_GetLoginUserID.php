<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        $response = [
            'UserID'=>GetLoginUser($loginsys)[0]
        ];

        echo json_encode($response);
    }
?>