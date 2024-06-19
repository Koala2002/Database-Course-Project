<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    $chatquery=mysqli_query($DB,"
        SELECT O.msg_id,M.user_id,M.sender_id,U.msg_msg 
        FROM OrderMessageViewForLoginUser O
        JOIN UserMessageViewForLoginUser U ON U.msg_id = O.msg_id
        JOIN MailViewForLoginUser M ON M.mail_id = O.msg_id
        WHERE O.ord_id='{$_POST["OrderID"]}'
    ");

    $ChatData=array();

    while($row=mysqli_fetch_array($chatquery))array_push($ChatData,$row);

    echo json_encode([
        'ChatData'=>$ChatData,
        'error'=>$DB->error
    ]);
?>