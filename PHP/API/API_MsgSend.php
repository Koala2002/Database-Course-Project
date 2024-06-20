<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    $user_id=null;
    if(
        $_POST["MailType"]==1||
        $_POST["MailType"]==2||
        $_POST["MailType"]==3||
        $_POST["MailType"]==5||
        $_POST["MailType"]==6||
        $_POST["MailType"]==7
    ){
        $user_id=mysqli_query($DB,"
            SELECT ord_buyer,ord_seller,ord_state 
            FROM OrderForm_SELECT_ARScBc_ViewForLoginUser
            WHERE ord_id='{$_POST["ItemID"]}'
        ");

        $orddata=mysqli_fetch_array($user_id);

        if($orddata["ord_state"]>'3'){
            echo json_encode([
                'result'=>"falied",
                'dberror'=>$DB->error,
            ]);

            return;
        }

        $user_id=null;
        if($orddata["ord_buyer"]==$loginuser)$user_id=$orddata["ord_seller"];
        else $user_id=$orddata["ord_buyer"];
    }

    if(//各種訂單事件，只是顯示格式不同，傳送的訊息類型一樣
        $_POST["MailType"]==1||
        $_POST["MailType"]==2||
        $_POST["MailType"]==3||
        $_POST["MailType"]==5||
        $_POST["MailType"]==6||
        $_POST["MailType"]==7
    ){
        mysqli_query($DB,"
            INSERT INTO MailViewForLoginUser
            (user_id,sender_id,mail_type,mail_state)
            VALUES('{$user_id}','{$loginuser}','{$_POST["MailType"]}','0')"
        );
        $mail_id=$DB->insert_id;

        mysqli_query($DB,"
            INSERT INTO OrderMessageViewForLoginUser
            (msg_id,ord_id)
            VALUES({$mail_id},{$_POST["ItemID"]})"
        );

        if($_POST["MailType"]==7){//用戶訊息
            mysqli_query($DB,"
                INSERT INTO UserMessageViewForLoginUser
                (msg_id,msg_msg)
                VALUES({$mail_id},'{$_POST["UserMsg"]}')"
            );
        }
    }
    else if($_POST["MailType"]==3){//訂單流程完成
        mysqli_query($DB,"
            INSERT INTO MailViewForLoginUser
            (user_id,sender_id,mail_type,mail_state)
            VALUES('{$user_id}','{$loginuser}','{$_POST["MailType"]}','0')"
        );
        $mail_id=$DB->insert_id;
        mysqli_query($DB,"
            INSERT INTO OrderMessageViewForLoginUser
            (msg_id,ord_id)
            VALUES('{$mail_id}','{$_POST["ItemID"]}')"
        );
        
        mysqli_query($DB,"
            INSERT INTO MailViewForLoginUser
            (user_id,sender_id,mail_type,mail_state)
            VALUES('{$loginuser}','{$user_id}','{$_POST["MailType"]}','0')"
        );
        $mail_id=$DB->insert_id;
        mysqli_query($DB,"
            INSERT INTO OrderMessageViewForLoginUser
            (msg_id,ord_id)
            VALUES('{$mail_id}','{$_POST["ItemID"]}')"
        );
    }
    else if($_POST["MailType"] ==4){//系統終止
        mysqli_query($DB,"
            INSERT INTO MailViewForLoginUser
            (user_id,sender_id,mail_type,mail_state)
            VALUES('{$_POST["SystemTerminateUserID"]}',NULL,'{$_POST["MailType"]}','0')"
        );
        $mail_id=$DB->insert_id;
        mysqli_query($DB,"
            INSERT INTO OrderMessageViewForLoginUser
            (msg_id,ord_id)
            VALUES('{$mail_id}','{$_POST["ItemID"]}')"
        );
    }
    else if($_POST["MailType"]==8){//商品上傳
        mysqli_query($DB,"
            INSERT INTO MailViewForLoginUser
            (user_id,sender_id,mail_type,mail_state)
            VALUES('{$_POST["GoodsUploadUserID"]}','{$_POST["GoodsUploadSenderID"]}','{$_POST["MailType"]}','0')"
        );
        $mail_id=$DB->insert_id;
        mysqli_query($DB,"
            INSERT INTO GoodsUploadMessageViewForLoginUser
            (msg_id,ord_id)
            VALUES('{$mail_id}','{$_POST["ItemID"]}')"
        );
    }

    echo json_encode([
        'result'=>"success",
        'dberror'=>$DB->error,
    ]);
?>