<?php
    require_once("../DB/DB_Common.php");
    header('Content-Type: application/json; charset=UTF-8');
    
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $ID=$_POST["OrderID"];
        $result=mysqli_query($bookstore,"
            SELECT * FROM order_detail WHERE ord_id='$ID'
        ");

        $data=array();

        while($row=mysqli_fetch_array($result))array_push($data,$row);

        $response=[
            "detail"=>$data
        ];

        echo json_encode($response);
    }
?>