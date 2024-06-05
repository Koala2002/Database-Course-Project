<?php
    require_once("DB_Common.php");

    $LoginUserInf=GetLoginUser($loginsys);

    if(!$LoginUserInf)header("location:../../index.php");

    $account=$LoginUserInf[0];
    $password=$LoginUserInf[1];

    $user=mysqli_connect("localhost",$account,$password,"bookstore");
    
    /*fetch goods from user database*/
    $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE user_id='$account'");
    $goodslistData=array();
    
    
    while($row=mysqli_fetch_array($result))array_push($goodslistData,$row);

   // print_r($result);
    /*fetch goods from user database*/


    function UserInf($db,$account){
        $data=mysqli_fetch_row(mysqli_query($db,"SELECT * FROM user WHERE user_id='$account'"));

        return $data;
    }

    

    function GoodsListView($db,$account,$goodslistData){
        $len=count($goodslistData);
        echo $len;
        $tabnum=intdiv($len,6)+($len<6?1:($len%6>0));
        
        $bookImage=array("📔","📕","📗","📘","📙");
        
        for($tabid=0;$tabid<$tabnum;$tabid++){
            echo "<div class='ViewTab' id='goodslist-sub-view-tab-$tabid'>";
            
            for($id=0;$id<min(6,$len-6*$tabid);$id++){
                if($id==0||$id==3)echo "<div class='ViewTab-Row'>";

                
                $item_id=$tabid*6+$id;
           
                $bookname=$goodslistData[$item_id]["goods_name"];
                $bookprice=$goodslistData[$item_id]["price"];
                $booknum=$goodslistData[$item_id]["number"];
                $img=$bookImage[rand(0,4)];

                if(mb_strlen($bookname)>22)$bookname=mb_substr($bookname,0,21)."...";

                echo "
                    <div class='goods-item-Block' id='goods-item-Block-$item_id'>
                        <button class='DeleteItem-Btn' id='DI-Btn-$item_id'>❌</button>    
                        <button class='EditBookInf-Btn' id='EBI-Btn-$item_id'>🖊️</button>
                        <div class='Book-Img-Block'>$img</div>
                        <div class='Book-Name-Block'>$bookname</div>
                        <div class='Book-PriceNumber-Block'>
                            <div class='Book-Price-Block'>$$bookprice</div>
                            <div class='Book-Number-Block'>剩餘:$booknum</div>
                        </div>
                    </div>";
        
                if($id==2||$id==5||$id==min(6,$len-6*$tabid)-1)echo "</div>";//view tab row end
            }

            echo "</div>";//view tab end
        }

    
        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-1'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn' id='goodslist-tab-btn-$id'>$vis_id</button>";
        }
    }

    function CurOrderInf($goodslistData){
        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-2'>";
        
        for( $i= 0; $i<count($goodslistData); $i++ ){
            //echo "<button class='tab-btn' id='goodslist-tab-btn-$i'>$i</button>";
        }
    }

    function HistoryOrderInf($goodslistData){
        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-3'>";
        
        for( $i= 0; $i<count($goodslistData); $i++ ){
            //echo "<button class='tab-btn' id='goodslist-tab-btn-$i'>$i</button>";
        }
    }
?>