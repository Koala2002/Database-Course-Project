<?php
    require_once("DB/DB_USER.php");            
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/UserPage.css">
    <link rel="stylesheet" href="../CSS/GoodsList.css">
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/UserPageProcessor.js"></script>

    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <script>UserLoginHeaderBuild('../','');</script>
    </div>

    <div id="user_inf">
        <?php
            $data=UserInf($user,$account);
            echo (
        "<div class='infBlock'><label class='labelTitle'>ID</label><label class='labelContent'>$data[0]</label></div>
        <div class='infBlock'><label class='labelTitle'>暱稱</label><label class='labelContent'>$data[1]</label></div>
        <div class='infBlock'><label class='labelTitle'>Phone</label><label class='labelContent'>$data[3]</label></div>
");
        ?>
        <a href="UserProfileEditPage.php" id="profileEditURL">🖊️</a>
    </div>

    <div id="InformationSelectList">
        <button class="ViewChange-Btn" onclick=ViewChange(1)>個人商品架</button>
        <button class="ViewChange-Btn" onclick=ViewChange(2)>進行中訂單</button>
        <button class="ViewChange-Btn" onclick=ViewChange(3)>歷史訂單</button>
    </div>
    
    <div id="InformationBlock">
        <div class="ViewTabBlock">
            <div class="ViewTab vtb-goodslist" id="main-view-tab-1">
                <?php GoodsListView($bookstore,$account,$goodslistData);?>
            </div>
            
            <div class="ViewTab vtb-curorder" id="main-view-tab-2">
                <?php CurOrderInf($goodslistData);?>
            </div>

            
            <div class="ViewTab vtb-historyorder" id="main-view-tab-3">
                <?php HistoryOrderInf($goodslistData);?>
            </div>
        </div>
    </div>

    <script>TabInit();</script>
    <script>tabBarButton_Setting();</script>

</body>
</html>