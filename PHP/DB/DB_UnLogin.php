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

    function userLogin($db,$account,$password){
        if (!mysqli_connect('localhost',$account,$password,'bookstore'))return false;
        else{
            $ipaddress=$_SERVER['REMOTE_ADDR'];//使用者登入ip
           
            clearIPLogin($db,$ipaddress);

            $inf_upd="UPDATE login_inf SET last_ip='$ipaddress',status=1 WHERE user_id='$account'";
            
            if(!mysqli_query($db,$inf_upd))echo "testing";

            return true;
        }
    }
    function createUser($bookstoredb,$sysdb,$account,$password,$nickname,$phonenumber){
        $useraccount=mysqli_query($bookstoredb,"SELECT user_id FROM user WHERE user_id='$account'");


        if(mysqli_num_rows($useraccount))return false;
        else{
            $sql="CREATE USER '{$account}'@'localhost' IDENTIFIED BY '{$password}'";
            
            echo "testing testing testing";

            if (mysqli_query($bookstoredb,$sql)){
                mysqli_query($bookstoredb,"GRANT ALL PRIVILEGES ON bookstore.* TO '$account'@'localhost'");
                mysqli_query($bookstoredb,"INSERT INTO user VALUES('$account','$nickname','1','$phonenumber')");

                $ipaddress=$_SERVER['REMOTE_ADDR'];
                
                
                $inf_add="INSERT INTO login_inf VALUES('$account','$password','$ipaddress',0)";
                

                clearIPLogin($sysdb,$ipaddress);
              
                mysqli_query($sysdb,$inf_add);
                
                return true;
            }
            else return false;
        }
    }
?>