<?php
    require_once("DB_Common.php");

    /*fetch all goods from database*/
    $result=mysqli_query($bookstore,"SELECT * FROM goods");
    
    $goodslistData=array();
    
    while($row=mysqli_fetch_array($result))array_push($goodslistData,$row);
    /*fetch all goods from database*/


    function SearchStatement_ToSQL($SearchStatement) {//查詢轉換
        $sql="";



        return $sql;
    }

    function SearchPageBuild($db,$goodslistData){
        $len=count($goodslistData);
        $tabnum=intdiv($len,10)+($len<10?1:($len%10>0));
        $bookImage=array("📔","📕","📗","📘","📙");
        for($tabid=0;$tabid<$tabnum;$tabid++){
            echo "<div class='ViewTab MainPage-ViewTab' id='goodslist-view-tab-$tabid'>";
            
            for($id=0;$id<min(10,$len-10*$tabid);$id++){
                if($id==0||$id==5)echo "<div class='ViewTab-Row MainPage-ViewTab-Row'>";

                
                $item_id=$tabid*10+$id;
           
                $bookname=$goodslistData[$item_id]["goods_name"];
                $bookprice=$goodslistData[$item_id]["price"];
                $booknum=$goodslistData[$item_id]["number"];
                $img=$bookImage[rand(0,4)];
                
                if(mb_strlen($bookname)>22)$bookname=mb_substr($bookname,0,21)."...";

                echo "
                    <div class='goods-item-Block' id='goods-item-Block-$item_id'>
                        <div class='Book-Img-Block'>$img</div>
                        <div class='Book-Name-Block'>$bookname</div>
                        <div class='Book-PriceNumber-Block'>
                            <div class='Book-Price-Block'>$$bookprice</div>
                            <div class='Book-Number-Block'>剩餘:$booknum</div>
                        </div>
                    </div>";
        
                if($id==4||$id==9||$id==min(10,$len-10*$tabid)-1)echo "</div>";//view tab row end
            }

            echo "</div>";//view tab end
        }

    
        echo "</div>";
        echo "<div class='tab-btn-bar MainPage-tab-btn-bar'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn' id='goodslist-tab-btn-$id'>$vis_id</button>";
        }
    }
?>