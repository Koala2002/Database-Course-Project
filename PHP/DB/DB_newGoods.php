<?php
    function GoodsUpload($db, $loginuser, $loginsys) {
        if ($_GET["GoodsNum"] == 0) return;

        $LoginUserInf = $loginuser;

        for ($id = 0; $id < $_GET["GoodsNum"]; $id++) {
            $isbn = $_GET["ISBN"][$id];
            $name = $_GET["BookName"][$id];
            $description = $_GET["BookDescription"][$id];
            $price = $_GET["BookPrice"][$id];
            $num = $_GET["BookNum"][$id];

            $result = mysqli_query($db, "INSERT INTO Goods_INSERT_ViewForLoginUser (isbn, goods_name, description, user_id, price, number) VALUES(
                '{$isbn}',
                '{$name}',
                '{$description}',
                '{$LoginUserInf}',
                '{$price}',
                '{$num}'
            )");
            
	}

	header("location:newGoodsPage.php?GoodsNum=0&State=0");
    }

    function GoodsInfInputBlockContentBuild(){
        /*
            state - 0~1:ISBN 驗證與資料輸入
            state - 2:書名輸入
            state - 3:數量輸入
            state - 4:單價輸入
            state - 5:上傳資料
        */

        if($_GET["State"]==0&&!isset($_GET["ISBN"][$_GET["GoodsNum"]])){
            echo "<input type='text' name='ISBN_VAL' id='ISBN_VAL' placeholder='ISBN-13' maxlength='13'>";
        }
        else if($_GET["State"]>=0){
            $value=$_GET["ISBN"][$_GET["GoodsNum"]];
            echo "<input type='text' name='ISBN_VAL' id='ISBN_VAL' value='$value' disabled>";
        }
        
        if($_GET["State"]==2&&!isset($_GET["BookName"][$_GET["GoodsNum"]])){
            echo "<input type='text' name='BookName_VAL' id='BookName_VAL' placeholder='請輸入書籍名稱(最多50字)' maxlength='50'>";
        }
        else if($_GET["State"]>=2){
            $value=$_GET["BookName"][$_GET["GoodsNum"]];
            echo "<input type='text' name='BookName_VAL' id='BookName_VAL' value='$value' disabled>";
        }

        if($_GET["State"]==3&&!isset($_GET["BookNum"][$_GET["GoodsNum"]])){
            echo "<input type='text' name='BookNum_VAL' id='BookNum_VAL' placeholder='請輸入數量(最多100)'>";
        }
        else if($_GET["State"]>=3){
            $value=$_GET["BookNum"][$_GET["GoodsNum"]];
            echo "<input type='text' name='BookNum_VAL' id='BookNum_VAL' value='$value' disabled>";
        }

        if($_GET["State"]==4&&!isset($_GET["BookPrice"][$_GET["GoodsNum"]])){
            echo "<input type='text' name='BookPrice_VAL' id='BookPrice_VAL' placeholder='請輸入單價(最多10000)'>";
        }
        else if($_GET["State"]>=4){
            $value=$_GET["BookPrice"][$_GET["GoodsNum"]];
            echo "<input type='text' name='BookPrice_VAL' id='BookPrice_VAL' value='$value' disabled>";
        }

        if($_GET["State"]==5&&!isset($_GET["BookDescription"][$_GET["GoodsNum"]])){
            echo "<textarea  name='BookDescription_VAL' id='BookDescription_VAL' placeholder='請輸入最多100字的描述' maxlength='100'></textarea>";
        }


        if($_GET["State"]==0){
            echo "<div id='StateBlock'>";
            echo "  <button onclick='PreState()' id='PRE_BTN' disabled>上一步</button>";
            echo "  <button onclick='NextState($_GET[GoodsNum],0,1,null)' id='NEXT_BTN'>下一步</button>";
            echo "</div>";
        }
        else if($_GET["State"]==2){
            echo "<div id='StateBlock'>";
            echo "  <button onclick='PreState()' id='PRE_BTN'>上一步</button>";
            echo "  <button onclick='NextState($_GET[GoodsNum],2,3,null)' id='NEXT_BTN'>下一步</button>";
            echo "</div>";
        }
        else if($_GET["State"]==3){
            echo "<div id='StateBlock'>";
            echo "  <button onclick='PreState()' id='PRE_BTN'>上一步</button>";
            echo "  <button onclick='NextState($_GET[GoodsNum],3,4,null)' id='NEXT_BTN'>下一步</button>";
            echo "</div>";
        }
        else if($_GET["State"]==4){
            echo "<div id='StateBlock'>";
            echo "  <button onclick='PreState()' id='PRE_BTN'>上一步</button>";
            echo "  <button onclick='NextState($_GET[GoodsNum],4,5,null)' id='NEXT_BTN'>下一步</button>";
            echo "</div>";
        }
        else if($_GET["State"]==5){
            echo "<div id='StateBlock'>";
            echo "  <button onclick='PreState()' id='PRE_BTN' style='position:absolute;bottom:25px;left:50px;'>上一步</button>";
            echo "  <button onclick='NextState($_GET[GoodsNum],5,0,null)' id='NEXT_BTN' style='position:absolute;bottom:25px;right:50px;'>確認</button>";
            echo "</div>";
        }
    }

    function newGoodsListBuild(){
      
        $TabNum=intdiv($_GET["GoodsNum"],6)+($_GET["GoodsNum"]<6?1:($_GET["GoodsNum"]%6>0));
        
        for($tabid=0;$tabid<$TabNum;$tabid++){
            echo "<div class='ViewTab' id='tab-$tabid'>";
        
            for($id=0;$id<min(6,$_GET["GoodsNum"]-6*$tabid);$id++){
                if($id==0||$id==3)echo "<div class='ViewTab-Row'>";
                $item_id=$tabid*6+$id;

                $BookName=$_GET["BookName"][$item_id];
                $ISBN=$_GET["ISBN"][$item_id];
                $BookNum=$_GET["BookNum"][$item_id];
                $BookPrice=$_GET["BookPrice"][$item_id];
                $BookDescription=$_GET["BookDescription"][$item_id];

                $BookName_AlphaLen=mb_strlen(preg_replace("/[^a-zA-Z]/",'',$BookName));
                $BookDescription_AlphaLen=mb_strlen(preg_replace("/[^a-zA-Z]/",'',$BookDescription));

                if(mb_strlen($BookDescription)>20)$BookDescription=mb_substr($BookDescription,0,19)."....";
                if(mb_strlen($BookName)>22)$BookName=mb_substr($BookName,0,21)."...";

                echo "
                <div class='goods-item-Block NewGoods-goods-item-Block' id='goods-item-Block-$item_id'>
                    <button class='DeleteItem-Btn' id='DI-Btn-$item_id'>❌</button>    
                    <button class='EditBookInf-Btn' id='EBI-Btn-$item_id'>🖊️</button>
                    
                    <div class='Book-Name-Block NewGoods-Book-Name-Block' id='item-name-$item_id'>$BookName</div>
                    <div class='Book-ISBN-Block NewGoods-Book-ISBN-Block' id='item-ISBN-$item_id'>ISBN:$ISBN</div>
                    
                    <div class='Book-Number-Price-Description-Block'>
                        <div class='Book-Number-Price-Block'>          
                            <div class='Book-Number-Block NewGoods-Book-Number-Block' id='item-num-$item_id'>剩餘:$BookNum</div>
                            <div class='Book-Price-Block NewGoods-Book-Price-Block' id='item-price-$item_id'>$$BookPrice</div>      
                        </div>
                        <div class='Book-Description-Block NewGoods-Book-Description-Block' id='item-description-$item_id'>$BookDescription</div>
                    </div>

                </div>";

              

                if($id==2||$id==5||$id==min(6,$_GET["GoodsNum"]-6*$tabid)-1)echo "</div>";//view tab row end
            }

            echo "</div>";
        }
        
        echo "</div>";

        echo "<div class='tab-btn-bar' id='NewGoods-tab-btn-bar'>";

        for($tabid=0;$tabid<$TabNum;$tabid++){
            $vis_id=$tabid+1;
            echo "<button class='tab-btn' id='NewGoodsPage-tab-btn-$tabid'>$vis_id</button>";
        }

        echo "
        <script>
            tabButtonSetting('tab-btn','NewGoods-tab-btn-bar','tab-','NewGoodsPage');
            TabSetting($TabNum);
        </script>";
    }
?>
