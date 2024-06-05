<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");
   
    //if($result)return 
   // else return null;

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        
        $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE ".(isset($_GET["Search"])?$_GET["Search"]:1));    
        
        if($result){
            $data=array();
            while($row=mysqli_fetch_array($result))array_push($data,$row);
        }

        $response = [
            "GoodsData"=>$data
        ];

        echo json_encode($response);
    }
?>