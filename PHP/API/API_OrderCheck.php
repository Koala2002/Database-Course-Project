<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    date_default_timezone_set("Asia/Taipei");
    
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        if($_POST["state"]=="accept"){
            mysqli_query($DB,"
                UPDATE OrderForm_UPDATE_ARScBc_ViewForLoginUser SET ord_state='1' WHERE ord_id='$_POST[OrderID]'
            ");
        }
        else if($_POST["state"]=="reject"){
            //如果不刪除那保存這些資料可以幹嘛?->
            
            $detailresult=mysqli_query($bookstore,"
                SELECT * FROM OrderDetailViewForLoginUser WHERE ord_id='$_POST[OrderID]'
            ");

            $detailData=array();
            while($row=mysqli_fetch_array($detailresult))array_push($detailData,$row);
            
            foreach($detailData as $index => $detail){
                $GoodsID=$detail["goods_id"];
                $GoodsNumber=$detail["ord_quantity"];

                mysqli_query($DB,"
                    UPDATE Goods_NAME_UPDATE_ViewForLoginUser SET number=number+$GoodsNumber WHERE goods_id=$GoodsID
                ");
                mysqli_query($DB,"
                    UPDATE Goods_UPDATE_ViewForLoginUser SET number=number+$GoodsNumber WHERE goods_id=$GoodsID
                ");
            }

            mysqli_query($DB,"
                DELETE FROM OrderForm_Delete_ViewForLoginUser WHERE ord_id='$_POST[OrderID]'
            ");
        }
        else if($_POST["state"]=="complete"){
            $timenow=date("Y-m-d H:i:s");
            
            $result=mysqli_fetch_array(mysqli_query($DB,"
                SELECT ord_seller,ord_state FROM OrderForm_SELECT_ARScBc_ViewForLoginUser
                WHERE ord_id='$_POST[OrderID]'
            "));

            if($result["ord_state"]!='1'){     
                mysqli_query($DB,"
                    UPDATE OrderForm_UPDATE_ARScBc_ViewForLoginUser
                    SET ord_state='4',ord_endtime='$timenow'
                    WHERE ord_id='$_POST[OrderID]' AND (ord_state='2' OR ord_state='3')
                ");
            }
            else if($result["ord_seller"]==$loginsys){//如果是賣家第一次按下
                mysqli_query($DB,"
                    UPDATE OrderForm_UPDATE_ARScBc_ViewForLoginUser
                    SET ord_state='2'
                    WHERE ord_id='$_POST[OrderID]' AND ord_state='1'
                ");
            }
            else{
                mysqli_query($DB,"
                    UPDATE OrderForm_UPDATE_ARScBc_ViewForLoginUser
                    SET ord_state='3'
                    WHERE ord_id='$_POST[OrderID]' AND ord_state='1'
                ");
            }


        }
        else if($_POST["state"]=="terminate"){
            $timenow=date("Y-m-d H:i:s");

            mysqli_query($DB,"
                UPDATE OrderForm_UPDATE_ARScBc_ViewForLoginUser SET ord_state='5',ord_endtime='$timenow' WHERE ord_id='$_POST[OrderID]'
            ");
        }

        echo json_encode(["result"=>$DB->error]);
    }
?>