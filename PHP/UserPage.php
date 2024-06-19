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
    <script type="text/javascript" src="../JavaScript/MsgProcessor.js"></script>

    

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
    
    <div id="SortSettingBlock">
        <form method="post" class="sortview" id="goodslist-sort-view">
            <?php
                $minPrice="";
                $maxPrice="";

                if(isset($_POST["minPrice"]))$minPrice=$_POST["minPrice"];
                if(isset($_POST["maxPrice"]))$maxPrice=$_POST["maxPrice"];

                echo"
                    <input type='number' name='minPrice' id='minPrice' min='0' max='10000' value='{$minPrice}' placeholder='最低價'>
                    <input type='number' name='maxPrice' id='maxPrice' min='0' max='10000' value='{$maxPrice}' placeholder='最高價'>
                ";

                $SortTypeText="";
                if(isset($_POST["goods-sort"]))$SortTypeText=$_POST["goods-sort"]=='up'?"價格 ⬆":"價格 ⬇";
                else $SortTypeText="價格 ⬇";
                
                $type=!isset($_POST["goods-sort"])?'down':$_POST["goods-sort"];

                echo "
                    <div class='sortText' id='goods-sort-text' onclick=viewsort('GoodsList')>{$SortTypeText}</div>
                    <input type='hidden' name='goods-sort' id='goods-sort' value='{$type}'>
                ";
            ?>
            <button onclick="viewsort">查詢</button>
        </form>
        <form method="post" class="sortview" id="curorder-sort-view">
            <?php
                $minTime="";
                $maxTime="";

                if(isset($_POST["c-minTime"]))$minTime=$_POST["c-minTime"];
                if(isset($_POST["c-maxTime"]))$maxTime=$_POST["c-maxTime"];

                echo"
                    <input type='datetime-local' name='c-minTime' id='c-minTime' value='{$minTime}'>
                    <input type='datetime-local' name='c-maxTime' id='c-maxTime' value='{$maxTime}'>
                ";

                $SortTypeText="";
                if(isset($_POST["cord-sort"]))$SortTypeText=$_POST["cord-sort"]=='up'?"日期 ⬆":"日期 ⬇";
                else $SortTypeText="日期 ⬇";
                
                $type=!isset($_POST["cord-sort"])?'down':$_POST["cord-sort"];

                echo "
                    <div class='sortText' id='curorder-sort-text' onclick=viewsort('CurOrder')>{$SortTypeText}</div>
                    <input type='hidden' name='cord-sort' id='cord-sort' value='{$type}'>
                ";

                $opt1="";
                $opt2="";
                $opt3="";
                if(isset($_POST["curorder-state"])){
                    if($_POST["curorder-state"]=="全部")$opt1="selected";
                    if($_POST["curorder-state"]=="尚未確認")$opt2="selected";
                    if($_POST["curorder-state"]=="交易中")$opt3="selected";
                }

                echo "
                    <select name='curorder-state' id='curorder-state'>
                        <option $opt1>全部</option>
                        <option $opt2>尚未確認</option>
                        <option $opt3>交易中</option>
                    </select>
                ";
            ?>
            

            <button onclick="viewsort">查詢</button>
        </form>
        <form method="post" class="sortview" id="historyorder-sort-view">
            <?php
                $minTime="";
                $maxTime="";

                if(isset($_POST["h-minTime"]))$minTime=$_POST["h-minTime"];
                if(isset($_POST["h-maxTime"]))$maxTime=$_POST["h-maxTime"];

                echo"
                    <input type='datetime-local' name='h-minTime' id='h-minTime' value='{$minTime}'>
                    <input type='datetime-local' name='h-maxTime' id='h-maxTime' value='{$maxTime}'>
                ";

                $SortTypeText="";
                if(isset($_POST["hord-sort"]))$SortTypeText=$_POST["hord-sort"]=='up'?"日期 ⬆":"日期 ⬇";
                else $SortTypeText="日期 ⬇";
                
                $type=!isset($_POST["hord-sort"])?'down':$_POST["hord-sort"];

                echo "
                    <div class='sortText' id='historyorder-sort-text' onclick=viewsort('HistoryOrder')>{$SortTypeText}</div>
                    <input type='hidden' name='hord-sort' id='hord-sort' value='{$type}'>
                ";

                $opt1="";
                $opt2="";
                $opt3="";
                $opt4="";
                $opt5="";
                if(isset($_POST["historyorder-state"])){
                    if($_POST["historyorder-state"]=="全部")$opt1="selected";
                    if($_POST["historyorder-state"]=="交易完成")$opt2="selected";
                    if($_POST["historyorder-state"]=="已被拒絕")$opt3="selected";
                    if($_POST["historyorder-state"]=="用戶中斷")$opt4="selected";
                    if($_POST["historyorder-state"]=="系統中斷")$opt5="selected";
                }

                echo "
                    <select name='historyorder-state' id='historycurorder-state'>
                        <option selected>全部</option>
                        <option>交易完成</option>
                        <option>已被拒絕</option>
                        <option>用戶中斷</option>
                        <option>系統中斷</option>
                    </select>
                ";
            ?>
           
            <button onclick="viewsort">查詢</button>
        </form>
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
        GoodsSetting("UserPage",1);
        OrderDetailLinkSetting();
        OrderCheckButtonSetting();
        SortBlockSetting();
    </script>

</body>
</html>
