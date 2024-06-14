<?php
    $loginsys=mysqli_connect("localhost","Admin","DBCourseProject","loginsystem");//系統資料庫
    $loginstate=CheckLogin($loginsys);
    $loginuser=GetLoginUser($loginsys);

    $DB=$loginstate?
        mysqli_connect("localhost","LoginUser","DBCourseProject","bookstore"):
        mysqli_connect("localhost","UnloginUser","DBCourseProject","bookstore");

    //$bookstore_Unlogin=mysqli_connect("localhost","expdb","WU20021111","bookstore");//書籍未登入資料庫
    //$bookstore=mysqli_connect("localhost","root","WU20021111","bookstore");//書籍資料庫

    function CheckLogin($db){//確認目前裝置有沒有登入者
        $ipaddress=$_SERVER['REMOTE_ADDR'];
        
        $find_user="SELECT status FROM login_inf WHERE last_ip='$ipaddress'";
        
        $result=mysqli_query($db,$find_user);

        if($result&&mysqli_num_rows($result))return mysqli_fetch_array($result)[0]=='1';

        return false;
    }

    function GetLoginUser($db){//尋找目前裝置登入者帳號ID
        $ipaddress=$_SERVER['REMOTE_ADDR'];
        
        $find_user="SELECT user_id FROM login_inf WHERE last_ip='$ipaddress' AND status='1'";
        
        $result=mysqli_query($db,$find_user);

        if($result)return mysqli_fetch_array($result)["user_id"];

        return null;
    }

    function clearIPLogin($db,$IP){
        $ipcheck="SELECT user_id FROM login_inf WHERE last_ip='$IP'";
        $checkresult=mysqli_query($db,$ipcheck);

        if(mysqli_num_rows($checkresult)){
            $checkresult=mysqli_fetch_row($checkresult)[0];

            $ipclear="UPDATE login_inf SET last_ip=NULL WHERE user_id='$checkresult'";
            mysqli_query($db,$ipclear);
        }
    }
    
    function UserLogout($db){//使用者帳號登出
        $ipaddress=$_SERVER['REMOTE_ADDR'];//使用者登入ip

        $query_user="SELECT user_id FROM login_inf WHERE last_ip='$ipaddress'";
        $user_id=mysqli_fetch_row(mysqli_query($db,$query_user))[0];

        $inf_upd="UPDATE login_inf SET last_ip='$ipaddress',status='0' WHERE user_id='$user_id'";
        
        mysqli_query($db,$inf_upd);
        
    }
?>