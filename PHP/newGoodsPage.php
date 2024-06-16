<?php
    require_once("DB//DB_Common.php");
    require_once("DB/DB_newGoods.php");
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/newGoodsPage.css">
    <link rel="stylesheet" href="../CSS/GoodsList.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/newGoodsProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/TabViewButtonProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/MsgProcessor.js"></script>

    <title>School Book Store</title>
</head>

<body>
    <script>CartChecker();</script>
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
<?php
    if($_POST){
        GoodsUpload($DB,$loginuser,$loginsys);
    }
?>