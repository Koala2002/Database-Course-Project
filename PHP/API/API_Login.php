<?php
    error_reporting(0);
    session_start();
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");
    require_once("../DB/DB_UnLogin.php");

    $loginuser_vcode=$_POST["vcode"];
    $loginuser_account=$_POST["account"];
    $loginuser_password=$_POST["password"];

    $result;

    function logintest($db,$loginuser_account,$loginuser_password){
        $accountData = mysqli_query($db,"SELECT * FROM login_inf WHERE user_id='{$loginuser_account}'");
        if($accountData){
            $accountData=mysqli_fetch_array($accountData);
            if(!$accountData)return false;
            
            if($accountData["password"]===$loginuser_password)return true;
        
            return false;
        }
        else return false;
    }

    if($_SESSION["v-code"]!=$loginuser_vcode)$result="verify-error";
    else if (!logintest($loginsys,$loginuser_account,$loginuser_password))$result="login-error";
    else{
        $ipaddress=$_SERVER['REMOTE_ADDR'];//使用者登入ip
        
        clearIPLogin($loginsys,$ipaddress);

        $inf_upd="UPDATE login_inf SET last_ip='$ipaddress',status=1 WHERE user_id='$loginuser_account'";
        
        mysqli_query($loginsys,$inf_upd);

        $result="success";
    }

    echo json_encode(["result"=>$result]);
?>