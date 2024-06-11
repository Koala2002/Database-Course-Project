<?php
    $path=getcwd();
    require_once($path."/DB/DB_Common.php");
    
?>
<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/CartList.css">

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/CartPageProcessor.js"></script>


    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <?php
            if(CheckLogin($loginsys))echo "<script>UserLoginHeaderBuild('../','');</script>";
            else echo "<script>UserUnLoginHeaderBuild('../','');</script>";
        ?>
    </div>

    <div id="Cart-List-Block">
        <div class="table-Block">
            <div id="table-container">
                <table id="Cart-List">
                    <thead  id="cart-list-top-header">
                        <tr>
                            <th class="goods-del-btn-Block"></th>
                            <th class="goods-id">商品ID</th>
                            <th class="goods-name">商品名稱</th>
                            <th class="goods-require">需求</th>
                            <th class="goods-price">單價</th>
                            <th class="goods-number">數量</th>
                            <th class="goods-totalprice">總計</th>
                            <th class="goods-edit-btn-Block"></th>
                        </tr>
                    </thead>
               
                    <tbody id="Cart-List-Content">
                        
                        <script>CartListBuild();</script>
                        
                    </tbody>

                    <thead id="cart-list-bottom-header" >
                        <tr>
                            <th class="goods-totalbooks" id="totalbooks">總書籍數：</th>
                            <th class="goods-allgoodstotalprice" id="allgoodstotalprice">總金額：</th>
                        </tr>
                    </thead>
                </table>
            </div> 
        </div>

        <button id="Cart-Clear-Button" onclick="ClearCart()">清空購物車</button>
        <button id="Order-Upload-Button" onclick="OrderSend()">送出訂單</button>
    </div>

</body>
</html>