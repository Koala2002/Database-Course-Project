<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    $result=mysqli_query($DB,"
        SELECT * 
        FROM MailViewForLoginUser
        WHERE user_id = '{$loginuser}'
        Order BY mail_id DESC
        LIMIT 10
    ");

    $mailData=array(); 

    while($row=mysqli_fetch_array($result))array_push($mailData,$row);

    echo json_encode([
        "data"=>$mailData
    ]);
?>