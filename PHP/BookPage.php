<?php
    $path=getcwd();
    require_once($path."/DB/DB_BookPage.php");

    if(isset($cart)){
        echo "<script>have cart</script>";
    }
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
            if(CheckLogin($loginsys))echo "<script>UserLoginHeaderBuild('../','');</script>";
            else echo "<script>UserUnLoginHeaderBuild('../','');</script>";
        ?>
    </div>

    <div id="Book-Information-Block">
        <div id="Book-Img-Block">📔</div>
        <div id="Book-INF-Block">
            <div id="Book-Name-Block">
                <?php echo $bookinf["goods_name"];?>
            </div>
            <div id="Book-ISBN-Block">
                <?php echo "ISBN：".$bookinf["isbn"];?>
            </div>
            <div id="Book-Num-Block">
                <?php echo "剩餘數量：".$bookinf["number"];?>
            </div>
            <div id="Book-Price-Block">
                <?php echo "價格(單價)：".$bookinf["price"];?>
            </div>
            <div id="Book-Description-Block-Title">書況描述</div>
            <div id="Book-Description-Block">
                <?php echo $bookinf["description"];?>
            </div>
        </div>
        <div id="Book-User-INF-Block">
            <div id="Book-UserID-Block">
                <?php
                    if(CheckLogin($loginsys))echo "書籍持有者："."<a href='UserPage.php?UserID=$bookinf[user_id]'>$bookinf[user_id]</a>";
                    else echo "書籍持有者："."<a href='LoginPage.php'>$bookinf[user_id]</a>";
                ?>
            </div>
            
            <div id="Order-Block">
                <?php OrderBlockBuild($loginsys,$bookinf)?>
            </div>
        </div>
    </div>
</body>
</html>