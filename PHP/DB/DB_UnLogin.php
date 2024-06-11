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
?>