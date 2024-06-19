<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    $result=null;

    if($_POST["MailType"]>=1&&$_POST["MailType"]<=7){
        $result="
            SELECT * 
            FROM OrderMessageViewForLoginUser
            WHERE msg_id='{$_POST["MailID"]}'    
        ";
     
        $result=mysqli_fetch_array(mysqli_query($DB,$result))["ord_id"];
    }
    else if($_POST["MailType"]==8){
        $result="
            SELECT * 
            FROM GoodsUploadMessageViewForLoginUser
            WHERE msg_id='{$_POST["MailID"]}'    
        ";
        
        $result=mysqli_fetch_array(mysqli_query($DB,$result))["goods_id"];
    }

    echo json_encode([
        "detail"=>$result,
        "error"=>$DB->error
    ]);
?>