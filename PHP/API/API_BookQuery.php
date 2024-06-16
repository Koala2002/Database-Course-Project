<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

   
    //if($result)return 
   // else return null;

    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
        $ISBN = $_GET["ISBN"];

        $result=mysqli_query($DB,"SELECT * FROM BookViewForLoginUser WHERE isbn='$ISBN'");    
        
        $bookname=null;
        if($result){
            if(mysqli_num_rows($result))$bookname=mysqli_fetch_row($result)[1];
        }

        $response = [
            'isbn' => $ISBN,
            'name' => $bookname,
            'error' => $DB->error,
        ];

        echo json_encode($response);
    }
?>
