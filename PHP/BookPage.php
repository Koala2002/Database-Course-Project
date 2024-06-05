<?php
    require_once("DB/DB_BookPage.php");
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/BookPage.css">

    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
   
    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <?php
            if(CheckLogin($loginsys))echo "<script>UserLoginHeaderBuild('../','');</script>";
            else echo "<script>UserUnLoginHeaderBuild('../','');</script>";
        ?>
    </div>

    <div id="Book-Information-Block">
        <div id="Book-Img-Block">📔</div>
        <div id="Book-INF-Block">
            <div id="Book-Name-Block">
                <?php
                    echo $bookinf["goods_name"];
                ?>
            </div>
            <div id="Book-ISBN-Block">
                <?php
                    echo "ISBN：".$bookinf["isbn"];
                ?>
            </div>
            <div id="Book-Num-Block">
                <?php
                    echo "剩餘數量：".$bookinf["number"];
                ?>
            </div>
            <div id="Book-Price-Block">
                <?php
                    echo "價格(單價)：".$bookinf["price"];
                ?>
            </div>
            <div id="Book-Description-Block-Title">書況描述</div>
            <div id="Book-Description-Block">
                <?php
                    echo $bookinf["description"];
                ?>
            </div>
        </div>
        <div id="Book-User-INF-Block">
            <div id="Book-UserID-Block">
                <?php
                    echo "書籍持有者：".$bookinf["user_id"];
                ?>
            </div>
            
            <?php
                if(CheckLogin($loginsys))echo "<button id='Book-Order-Button'>發送購買請求</button>";
                else echo "<a href='LoginPage.php' id='Book-Order-Button'>登入即可發送購買請求</a>";
            ?>
            
        </div>
    </div>
</body>
</html>