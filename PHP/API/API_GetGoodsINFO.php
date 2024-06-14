<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $id=$_POST["GoodsID"];

        $GoodsView=$loginstate?"Goods_SELECT_ViewForLoginUser":"GoodsViewForUnloginUser";

        $result=mysqli_query($DB,"SELECT * FROM {$GoodsView} WHERE goods_id=$id");    
        
        $GoodsName=null;
        $GoodsPrice=null;
        $GoodsNumber=null;
        $GoodsSeller=null;
        $GoodsDescription=null;
        $GoodsISBN=null;

        if($result){
            if(mysqli_num_rows($result)){
                $result=mysqli_fetch_array($result);
                $GoodsName=$result["goods_name"];
                $GoodsPrice=$result["price"];
                $GoodsNumber=$result["number"];
                $GoodsSeller=$result["user_id"];
                $GoodsDescription=$result["description"];
                $GoodsISBN=$result["isbn"];
            }
        }

        $response = [
            'GoodsName' => $GoodsName,
            'GoodsPrice' => $GoodsPrice,
            'GoodsNumber' => $GoodsNumber,
            'GoodsSeller' => $GoodsSeller,
            'GoodsDescription'=>$GoodsDescription,
            'GoodsISBN'=>$GoodsISBN,
            'LoginUserID'=>$loginuser,
            'LoginState' => $loginstate
        ];

        echo json_encode($response);
    }
?>