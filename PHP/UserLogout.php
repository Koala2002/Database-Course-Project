<?php

    require_once("DB/DB_Common.php");    
    UserLogout($loginsys,$loginuser);

    print_r("$loginsys->error"); 
    print_r($loginsys->error); 
?>
<script>
    sessionStorage.removeItem("Cart");
    
    while(sessionStorage.getItem("Cart"));
    
    window.location.href="../index.php";
</script>