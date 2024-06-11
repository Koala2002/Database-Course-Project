


<?php
    $path=getcwd();
    require_once($path."/DB_Common.php");    
    UserLogout($loginsys);
?>
<script>
    sessionStorage.removeItem("Cart");
    
    while(sessionStorage.getItem("Cart"));
    
    window.location.href="../index.php";
</script>