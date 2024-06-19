<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    mysqli_query($DB,"UPDATE MailViewForLoginUser SET mail_state='1' WHERE mail_id='$_POST[MailID]'");

    echo json_encode(["result"=>$DB->error]);
?>