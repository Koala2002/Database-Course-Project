<?php
    require_once("DB/DB_Common.php");
    require_once("DB/DB_newGoods.php");

    if($_POST){GoodsUpload($bookstore,$loginsys);}
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/newGoodsPage.css">
    <link rel="stylesheet" href="../CSS/GoodsList.css">

    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/newGoodsProcessor.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <script>UserLoginHeaderBuild('../','');</script>
    </div>

    <div id="GoodsInfInputBlock">
        <?php GoodsInfInputBlockContentBuild();?>
    </div>

    <div id="newGoodsList">
        <div class="ViewTabBlock">
            <?php newGoodsListBuild();?>
        </div>

        <form method="post" >
            <input type="submit" name="UploadButton" id="UploadButton" value="Upload">            
        </form>
    </div>

</body>
</html>