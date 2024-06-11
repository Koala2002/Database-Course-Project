<?php

    require_once("DB_Common.php");

    $data=mysqli_query($bookstore,"
        SELECT * FROM order_detail WHERE ord_id=$_POST[OrderID]
    ");

    $detailData=array();
    while($row=mysqli_fetch_array($data))array_push($detailData,$row);

    $orderData=mysqli_query($bookstore,"
        SELECT * FROM order_form WHERE ord_id=$_POST[OrderID]
    ");

    $orderData=mysqli_fetch_array($orderData);

    function OrderStateViewBuild($db,$orderData){
        $account=GetLoginUser($db)["user_id"];
        /*
            我要啥
            這筆訂單的交易對象(user_id)
            狀態{
                0:顯示兩個按鈕確認、拒絕
                1:顯示如果已經完成這筆交易，請按下確認
                2:交易已完成
            }
        */
        $order_userID=$orderData["ord_seller"]==$account?$orderData["ord_buyer"]:$orderData["ord_seller"];
        $orderID=$orderData["ord_id"];
        echo "
            <div id='Order-State-UserID-Block'>
                此訂單的交易對象：$order_userID
            </div>
        
            <div id='Order-State-Block'>            
        ";



        if($orderData["ord_seller"]==$account){//賣家view
            if($orderData["ord_state"]==0){
                echo "
                    您還尚未同意此訂單的交易，按下確認以開始進行此訂單流程，按下拒絕已取消此訂單請求。
                    <button class='Order-List-Btn ord-list-btn-accept' id='ord-accept-btn-$orderID'>確認</button>
                    <button class='Order-List-Btn ord-list-btn-reject' id='ord-reject-btn-$orderID'>拒絕</button>
                ";
            }
            else if($orderData["ord_state"]=='1'){
                echo "
                    若您與買方已完成交易請按下完成按鈕以完成訂單流程，若您希望停止這筆交易請按下終止按鈕以終止訂單流程。
                    <button class='Order-List-Btn ord-list-btn-complete' id='ord-complete-btn-$orderID'>完成</button>
                    <button class='Order-List-Btn ord-list-btn-terminate' id='ord-complete-btn-$orderID'>終止</button>
                ";
            }
        }
        else{//買家view
            if($orderData["ord_state"]=='0'){
                echo "
                    賣家還沒確認您的訂單
                ";
            }
            else if($orderData["ord_state"]=='1'){
                echo "
                    賣家確認了您的訂單
                ";
            }
        }

        if($orderData["ord_state"]=='2'){
            echo "
                此訂單的交易流程已結束
                <br>
                <br>
                完成時間：{$orderData['ord_endtime']}
            ";    
        }

        if($orderData["ord_state"]=='3'||$orderData["ord_state"]=='4'){
            $end_result=$orderData["ord_state"]==3?"正常終止交易":"系統終止交易";
                    
            echo "
                此訂單為無效訂單
                <br>
                <br>
                判定無效時間：{$orderData['ord_endtime']}
                <br>
                <br>
                無效原因：$end_result
            ";
        }
        echo "</div>";
    }
?>