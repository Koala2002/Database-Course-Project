<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id=$_POST["GoodsID"];

        $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE goods_id=$id");    
        
        $GoodsName=null;
        $GoodsPrice=null;
        $GoodsNumber=null;
        $GoodsSeller=null;

        if($result){
            if(mysqli_num_rows($result)){
                $result=mysqli_fetch_array($result);
                $GoodsName=$result["goods_name"];
                $GoodsPrice=$result["price"];
                $GoodsNumber=$result["number"];
                $GoodsSeller=$result["user_id"];
            }
            else{
                
            }
        }

        $response = [
            'GoodsName' => $GoodsName,
            'GoodsPrice' => $GoodsPrice,
            'GoodsNumber' => $GoodsNumber,
            'GoodsSeller' => $GoodsSeller,
        ];

        echo json_encode($response);
    }
?>