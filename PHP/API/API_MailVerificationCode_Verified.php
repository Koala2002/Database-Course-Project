<?php
    session_start();
    header('Content-Type: application/json; charset=UTF-8');
    
    if(strlen($_POST["vcode"])==10&&$_SESSION["mail_vcode"]==$_POST["vcode"]){
        echo json_encode([
            "result"=>"success",
            "system_vcode"=>$_SESSION["mail_vcode"],
            "user_vcode"=>$_POST["vcode"],
        ]);
    }
    else{
        echo json_encode([
            "result"=>"failure",
            "system_vcode"=>$_SESSION["mail_vcode"],
            "user_vcode"=>$_POST["vcode"],
        ]);
    }
?>