<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");
    require_once("../DB/DB_UnLogin.php");
    
   
    $newuser_account=$_POST["account"];
    $newuser_password=$_POST["password"];
    $newuser_nickname=$_POST["nickname"];
    $newuser_email=$_POST["email"];

    $sql="CREATE USER '{$newuser_account}'@'localhost' IDENTIFIED BY '{$newuser_password}'";
        
    if (mysqli_query($bookstore,$sql)){
        $result=true;
        $result&=mysqli_query($bookstore,"GRANT ALL PRIVILEGES ON bookstore.* TO '$newuser_account'@'localhost'");
        $result&=mysqli_query($bookstore,"INSERT INTO user VALUES('$newuser_account','$newuser_nickname','1','$newuser_email')");

        $ipaddress=$_SERVER['REMOTE_ADDR'];
        
        
        $inf_add="INSERT INTO login_inf VALUES('$newuser_account','$newuser_password','$ipaddress',0)";
        

        clearIPLogin($loginsys,$ipaddress);
        
        $result&=mysqli_query($loginsys,$inf_add);
        
        if($result)echo json_encode(["result","success"]);
        else echo json_encode(["result","failure"]);
    }
    else echo json_encode(["result","failure"]);
?>