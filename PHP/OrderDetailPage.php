<?php
    require_once("DB/DB_Common.php");
    require_once("DB/DB_OrderDetail.php");
    echo $_POST["OrderID"];
?>

<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/OrderDetailPage.css">
    <link rel="stylesheet" href="../CSS/CartList.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/OrderDetailPageProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/OrderProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    

    <title>School Book Store</title>
</head>

<body>
    <script>CartChecker();</script>
    <div id="header">
        <script>UserLoginHeaderBuild('../','');</script>;
    </div>

    <div id="Detail-Block">
        <div class="table-Block">
            
            <table id="Cart-List">
                <thead  class="cart-list-detail-page" id="cart-list-top-header">
                    <tr>
                        <th class="goods-id">商品ID</th>
                        <th class="goods-name">商品名稱</th>
                        <th class="goods-require">需求</th>
                        <th class="goods-price">單價</th>
                        <th class="goods-number">數量</th>
                        <th class="goods-totalprice">總計</th>
                    </tr>
                </thead>
            
                <tbody id="Cart-List-Content">
                    <?php
                        echo "<script>OrderDetailBuild($_POST[OrderID]);</script>"
                    ?>
                </tbody>

                <thead class="cart-list-detail-page" id="cart-list-bottom-header" >
                    <tr>
                        <th class="goods-totalbooks" id="totalbooks">總書籍數：</th>
                        <th class="goods-allgoodstotalprice" id="allgoodstotalprice">總金額：</th>
                    </tr>
                </thead>
            </table>
            
        </div>
        <div id="Order-Detail-State-Chat-Block">
            <div id="Order-Detail-State-Block">
                <?php OrderStateViewBuild($loginsys,$orderData)?>
            </div>
            <div id="Order-Detail-Chat-Block">
                <textarea id="chat-Block" placeholder="請輸入訊息"></textarea>
            </div>
        </div>
    </div>
    <script>
        OrderCheckButtonSetting();
    </script>
</body>
</html>