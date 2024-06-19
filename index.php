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
            if($loginstate)echo "<script>UserLoginHeaderBuild('','PHP/');</script>";
            else echo "<script>UserUnLoginHeaderBuild('','PHP/');</script>";
        ?>
    </div>

    

    <div id="searchBlock">
        <form method="get" id="search">
            <div id="SortSettingBlock">
                <div id="sort-type-block">
                    <?php
                        $SortTypeText="";
                        if(isset($_GET["SortType"]))$SortTypeText=$_GET["SortType"]=='up'?"價格 ⬆":"價格 ⬇";
                        else $SortTypeText="價格 ⬇";
                        
                        $type=!isset($_GET["SortType"])?'down':$_GET["SortType"];

                        echo "
                            <div id='SortType-input' onclick='SortChange()'>{$SortTypeText}</div>
                            <input type='hidden' name='SortType' id='SortType' value='{$type}'>
                        ";
                    ?>
                </div>
                <div id="price-ord-block">
                    <?php
                        $minPrice="";
                        $maxPrice="";

                        if(isset($_GET["minPrice"]))$minPrice=$_GET["minPrice"];
                        if(isset($_GET["maxPrice"]))$maxPrice=$_GET["maxPrice"];
                        
                        echo "
                            <input type='number' name='minPrice' id='minPrice' value='{$minPrice}' placeholder='最低價' min='0' max='10000'>
                            <pre> ~ </pre>
                            <input type='number' name='maxPrice' id='maxPrice' value='{$maxPrice}' placeholder='最高價' min='0' max='10000'>
                        ";
                    ?>
                </div>
            </div>
            
            <?php
                $searchvalue="";
                if(isset($_GET["Search"]))$searchvalue=$_GET["Search"];

                echo "
                    <input type='text' name='Search' id='querytext' value='{$searchvalue}' placeholder='請輸入書籍、科系、教授、課程名稱查詢...' maxlength='40'>
                ";
            ?>
            <input type="submit" name="querybutton" value="search" id="querybutton">
        </form>
    </div>

    <div id="goodsBlock">
        <div class="ViewTabBlock MainPage-ViewTabBlock">
            <?php SearchPageBuild($goodslistData);?>
            <script>
                tabButtonSetting("tab-btn","MainPage-tab-btn-bar","goodslist-view-tab-","MainPage");
                tabInit();
                <?php
                    if($loginstate)echo "GoodsSetting('MainPage',1);";
                    else echo "GoodsSetting('MainPage',0);";
                ?>
            </script>
        </div>
    </div>
</body>
</html>