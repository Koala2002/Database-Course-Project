<?php
    require_once("../DB/DB_Common.php");
    header('Content-Type: application/json; charset=UTF-8');
    
    //if($result)return 
   // else return null;

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data=array();
        $GoodsView=(((isset($_POST["LoginState"])&&$_POST["LoginState"]=1)||!isset($_POST["LoginState"]))?
            "Goods_SELECT_ViewForLoginUser":
            "GoodsViewForUnloginUser"
        );

        if($_POST["Page"]=="MainPage"){
            $result=mysqli_query($DB,"SELECT * FROM {$GoodsView} WHERE ".(isset($_GET["Search"])?$_GET["Search"]:1)." AND number>0");    
            
            if($result){
                while($row=mysqli_fetch_array($result))array_push($data,$row);
            }
        }
        else{
            $result=mysqli_query($DB,"SELECT * FROM {$GoodsView} WHERE user_id='$_POST[UserID]'");    
            
            if($result){
                while($row=mysqli_fetch_array($result))array_push($data,$row);
            }
        }

        $response = [
            "GoodsData"=>$data,
            "result"=>$DB->error
        ];

        echo json_encode($response);
    }
?>