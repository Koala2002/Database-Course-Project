<?php
    require_once("DB_Common.php");

    $bookinf=mysqli_query($bookstore,"SELECT * FROM goods WHERE goods_id = $_GET[GoodsID]");
    $bookinf=mysqli_fetch_array($bookinf);

    print_r($bookinf);
?>