<?php
    require_once("PHP/DB/DB_Common.php");
    require_once("PHP/DB/DB_MainPage.php");
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/Common.css">
    <link rel="stylesheet" href="CSS/Header.css">
    <link rel="stylesheet" href="CSS/MainPage.css">
    <link rel="stylesheet" href="CSS/GoodsList.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="JavaScript/MainPageProcessor.js"></script>
    <script type="text/javascript" src="JavaScript/TabViewButtonProcessor.js"></script>
    <script type="text/javascript" src="JavaScript/GoodsListProcessor.js"></script>
    

    <title>School Book Store</title>
</head>

<body>
    <script>CartChecker();</script>
    <div id="header">
        <?php
            if(CheckLogin($loginsys))echo "<script>UserLoginHeaderBuild('','PHP/');</script>";
            else echo "<script>UserUnLoginHeaderBuild('','PHP/');</script>";
        ?>

    </div>

    <div id="searchBlock">
        <form method="get" id="search">
            <input type="text" name="Search" id="querytext" placeholder="請輸入書籍、科系、教授、課程名稱查詢..." maxlength="40">
            <input type="submit" name="querybutton" value="search" id="querybutton">
        </form>
    </div>

    <div id="goodsBlock">
        <div class="ViewTabBlock MainPage-ViewTabBlock">
            <?php SearchPageBuild($bookstore,$goodslistData);?>
            <script>
                tabButtonSetting("tab-btn","MainPage-tab-btn-bar","goodslist-view-tab-","MainPage");
                tabInit();
                GoodsSetting("MainPage");
            </script>
        </div>
    </div>
</body>
</html>