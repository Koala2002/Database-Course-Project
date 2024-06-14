<?php

    require_once("DB/DB_User.php");            
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/UserPage.css">
    <link rel="stylesheet" href="../CSS/GoodsList.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/UserPageProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/TabViewButtonProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/OrderProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/GoodsListProcessor.js"></script>

    

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

    <div id="user_inf">
        <?php UserInfBuild($DB);?>
        <!--a href="UserProfileEditPage.php" id="profileEditURL">🖊️</a-->
    </div>

    <div id="InformationSelectList">
        <?php InformationSelectListViewButtonBuild($account);?>
    </div>
    
    <div id="InformationBlock">
        <div class="ViewTabBlock">
            <div class="ViewTab vtb-goodslist" id="main-view-tab-1">
                <?php GoodsListView($DB,$account);?>
            </div>
            
            <div class="ViewTab vtb-curorder" id="main-view-tab-2">
                <?php if($loginuser)CurOrderListView($DB,$account);?>
            </div>

            
            <div class="ViewTab vtb-historyorder" id="main-view-tab-3">
                <?php HistoryOrderInf($DB,$account);?>
            </div>
        </div>
    </div>

    <script>
        tabButtonSetting("goodslist-btn","tab-btn-bar-1","goodslist-sub-view-tab-","GoodsList");
        tabButtonSetting("curorder-btn","tab-btn-bar-2","curorder-sub-view-tab-","CurOrder");
        tabButtonSetting("historyorder-btn","tab-btn-bar-3","historyorder-sub-view-tab-","HistoryOrder");
        TabInit();
        GoodsSetting("UserPage");
        OrderDetailLinkSetting();
        OrderCheckButtonSetting();
    </script>

</body>
</html>