<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    date_default_timezone_set("Asia/Taipei");
    
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        if($_POST["state"]=="accept"){
            mysqli_query($bookstore,"
                UPDATE order_form SET ord_state='1' WHERE ord_id='$_POST[OrderID]'
            ");
        }
        else if($_POST["state"]=="reject"){
            //如果不刪除那保存這些資料可以幹嘛?
            
            $detailresult=mysqli_query($bookstore,"
                SELECT * FROM order_detail WHERE ord_id='$_POST[OrderID]'
            ");

            $detailData=array();
            while($row=mysqli_fetch_array($detailresult))array_push($detailData,$row);
            
            foreach($detailData as $index => $detail){
                $GoodsID=$detail["goods_id"];
                $GoodsNumber=$detail["ord_quantity"];

                mysqli_query($bookstore,"
                    UPDATE goods SET number=number+$GoodsNumber WHERE goods_id=$GoodsID
                ");
            }

            mysqli_query($bookstore,"
                DELETE FROM order_form WHERE ord_id='$_POST[OrderID]'
            ");
        }
        else if($_POST["state"]=="complete"){
            $timenow=date("Y-m-d H:i:s");
            
            mysqli_query($bookstore,"
                UPDATE order_form SET ord_state='2',ord_endtime='$timenow' WHERE ord_id='$_POST[OrderID]'
            ");
        }
        else if($_POST["state"]=="terminate"){
            $timenow=date("Y-m-d H:i:s");

            mysqli_query($bookstore,"
                UPDATE order_form SET ord_state='3',ord_endtime='$timenow' WHERE ord_id='$_POST[OrderID]'
            ");
        }

        echo json_encode(["result"=>$bookstore->error]);
    }
?>