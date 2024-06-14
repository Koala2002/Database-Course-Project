<?php
    require_once ("DB/DB_Common.php");
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/BookPage.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/BookPageProcessor.js"></script>
    

    <title>School Book Store</title>
</head>

<body>
    <script>CartChecker();</script>
    <div id="header">
        <?php
            if($loginstate)echo "<script>UserLoginHeaderBuild('../','');</script>";
            else echo "<script>UserUnLoginHeaderBuild('../','');</script>";
        ?>
    </div>

    <div id="Book-Information-Block">
        <div id="Book-Img-Block">📔</div>
        <div id="Book-INF-Block">
            <div id="Book-Name-Block"></div>
            <div id="Book-ISBN-Block"></div>
            <div id="Book-Num-Block"></div>
            <div id="Book-Price-Block"></div>
            <div id="Book-Description-Block-Title">書況描述</div>
            <div id="Book-Description-Block"></div>
        </div>
        <div id="Book-User-INF-Block">
            <div id="Book-UserID-Block"></div>
            <div id="Order-Block"></div>
        </div>
        <?php
            echo "<script>BookInfoBuild({$_GET["GoodsID"]});</script>"
        ?>
    </div>
</body>
</html>