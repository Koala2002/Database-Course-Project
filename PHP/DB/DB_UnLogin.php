<?php
    function clearIPLogin($db,$IP){
        $ipcheck="SELECT user_id FROM login_inf WHERE last_ip='$IP'";
        $checkresult=mysqli_query($db,$ipcheck);

        if(mysqli_num_rows($checkresult)){
            $checkresult=mysqli_fetch_row($checkresult)[0];

            $ipclear="UPDATE login_inf SET last_ip=NULL WHERE user_id='$checkresult'";
            mysqli_query($db,$ipclear);
        }
    }

    function userLogin($db,$account,$password,$verifyCode){
        if($_SESSION["v-code"]!=$verifyCode)return "verify-error";
        else if (!mysqli_connect('localhost',$account,$password,'bookstore'))return "login-error";
        else{

            $ipaddress=$_SERVER['REMOTE_ADDR'];//使用者登入ip
           
            clearIPLogin($db,$ipaddress);

            $inf_upd="UPDATE login_inf SET last_ip='$ipaddress',status=1 WHERE user_id='$account'";
            
            if(!mysqli_query($db,$inf_upd))echo "testing";

            return "success";
        }
    }
?>