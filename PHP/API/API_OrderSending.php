<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    date_default_timezone_set("Asia/Taipei");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $timenow=date("Y-m-d H:i:s");
        $BUYER=$loginuser;

        foreach($_POST["GoodsMaxNumber"] as $goodsID => $num){
            $newvalue=$num-$_POST["GoodsTotal"][$goodsID];
            
            mysqli_query($DB,"UPDATE Goods_NAME_UPDATE_ViewForLoginUser SET number=$newvalue WHERE goods_id=$goodsID");
            mysqli_query($DB,"UPDATE Goods_UPDATE_ViewForLoginUser SET number=$newvalue WHERE goods_id=$goodsID");
        }

        $NewOrdID=array();

        foreach($_POST["Cart"] as $seller => $detail ) {
            mysqli_query($DB,"
                INSERT INTO OrderForm_INSERT_ViewForLoginUser 
                (ord_buyer,ord_seller,ord_ordtime) 
                VALUES('$BUYER','$seller','$timenow')
            ");

            $OrderID=$DB->insert_id;
            array_push($NewOrdID,$OrderID);

            foreach($detail as $index => $detailItem){
                $GoodsID=$detailItem["GoodsID"];
                $Number=$detailItem["Number"];
                $Require=$detailItem["Require"];
     
                mysqli_query($DB,"
                    INSERT INTO OrderDetailViewForLoginUser
                    (ord_id,goods_id,ord_quantity,description) 
                    VALUES($OrderID,$GoodsID,$Number,'$Require')
                ");

            }
        }
        
        $response = [
            'IdData'=>$NewOrdID
        ];

        echo json_encode($response);
    }
?>