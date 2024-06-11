<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    $useraccount=mysqli_query($bookstore,"SELECT user_id FROM user WHERE user_id='$_POST[newaccount]'");

    if(mysqli_num_rows($useraccount))echo json_encode(["result"=>"failure"]);
    else echo json_encode(["result"=>"success"]);
?>