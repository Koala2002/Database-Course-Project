<?php
    require_once("../DB/DB_Common.php");
    header('Content-Type: application/json; charset=UTF-8');
    
    //if($result)return 
   // else return null;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data=array();
        if($_POST["Page"]=="MainPage"){
            $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE ".(isset($_GET["Search"])?$_GET["Search"]:1)." AND number>0");    
            
            if($result){
                while($row=mysqli_fetch_array($result))array_push($data,$row);
            }
        }
        else{
            $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE user_id='$_POST[UserID]'");    
            
            if($result){
                while($row=mysqli_fetch_array($result))array_push($data,$row);
            }
        }

        $response = [
            "GoodsData"=>$data
        ];

        echo json_encode($response);
    }
?>