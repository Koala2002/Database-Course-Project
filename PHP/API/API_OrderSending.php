<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    date_default_timezone_set("Asia/Taipei");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $timenow=date("Y-m-d H:i:s");
        $BUYER=GetLoginUser($loginsys)['user_id'];

        foreach($_POST["GoodsMaxNumber"] as $goodsID => $num){
            $newvalue=$num-$_POST["GoodsTotal"][$goodsID];
            
            $goodsNumUpdate=mysqli_query($bookstore,"
                UPDATE goods SET number=$newvalue WHERE goods_id=$goodsID
            ");
        }

        foreach($_POST["Cart"] as $seller => $detail ) {
            $Order=mysqli_query($bookstore,"
                INSERT INTO order_form 
                (ord_buyer,ord_seller,ord_ordtime,ord_state) 
                VALUES('$BUYER','$seller','$timenow','0')
            ");

            $OrderID=$bookstore->insert_id;

            foreach($detail as $index => $detailItem){
                $GoodsID=$detailItem["GoodsID"];
                $Number=$detailItem["Number"];
                $Require=$detailItem["Require"];
     
                $Detail=mysqli_query($bookstore,"
                    INSERT INTO order_detail 
                    (ord_id,goods_id,ord_quantity,description) 
                    VALUES($OrderID,$GoodsID,$Number,'$Require')
                ");

            }
        }
        
        $response = [
            'result'=>"successful"
        ];

        echo json_encode($response);
    }
?>