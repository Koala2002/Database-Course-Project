<?php
    $path=getcwd();
    require_once($path."/DB_Common.php");

    $bookinf=mysqli_query($bookstore,"SELECT * FROM goods WHERE goods_id = $_GET[GoodsID]");
    $bookinf=mysqli_fetch_array($bookinf);



    function OrderBlockBuild($loginsys,$bookinf){
        if(CheckLogin($loginsys)){
            if($bookinf["user_id"]==GetLoginUser($loginsys)[0])echo "<button id='Book-Order-Button'>這是您的商品</button>";
            else echo "
                
                <div id='button-number-block'>
                    <input type='number' value=1 name='ord_number' id='order-number-input' min=1 max=100>
                    <button id='Book-Order-Button' onclick=addGoodsInCart()>加入購物車</button>
                </div>
                
                <textarea id='order-require-input' placeholder='可以輸入最多100字的要求' maxlength='100'></textarea>        
            
            ";
        }
        else echo "<a href='LoginPage.php' id='Book-Order-Button'>登入發送購買請求</a>";
    }
?>