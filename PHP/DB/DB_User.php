<?php
    require_once("PHP//DB//DB_Common.php");
 
    $LoginUserInf=GetLoginUser($loginsys);

    $account=$LoginUserInf?$LoginUserInf[0]:null;
    $password=$LoginUserInf?$LoginUserInf[1]:null;
   
    /*fetch goods from user database*/
    $result=mysqli_query($bookstore,"SELECT * FROM goods WHERE user_id='$_GET[UserID]'");
    $goodslistData=array();
    
    while($row=mysqli_fetch_array($result))array_push($goodslistData,$row);

   // print_r($result);
    /*fetch goods from user database*/


    /*fetch order from user database*/ 
    $result=mysqli_query($bookstore,"
        SELECT * FROM order_form
        WHERE (ord_buyer='$account' OR ord_seller='$account') AND (ord_state='0' OR ord_state='1')
        ORDER BY ord_seller='$account' DESC
    ");

    $orderData=array();
    while($row=mysqli_fetch_array($result))array_push($orderData,$row);
    /*fetch order from user database*/

    /*fetch historyorder from user database*/ 
    $result=mysqli_query($bookstore,"
        SELECT * FROM order_form
        WHERE (ord_buyer='$account' OR ord_seller='$account') AND (ord_state='2' OR ord_state='3' OR ord_state='4')
        ORDER BY ord_seller='$account' DESC
    ");

    $historyorderData=array();
    while($row=mysqli_fetch_array($result))array_push($historyorderData,$row);
    /*fetch historyorder from user database*/


    function UserInf($db,$account){//VIEW USER INF
        $data=mysqli_fetch_array(mysqli_query($db,"SELECT * FROM user WHERE user_id='$account'"));

        return $data;
    }

    function UserInfBuild($db){
        $data=UserInf($db,$_GET["UserID"]);
        echo "
            <label class='labelTitle'>ID</label><label class='labelContent'>$_GET[UserID]</label>
            <label class='labelTitle'>暱稱</label><label class='labelContent'>$data[user_name]</label>
            <label class='labelTitle'>EMail</label><label class='labelContent'>$data[user_email]</label>
        ";
    }

    function InformationSelectListViewButtonBuild($account){
        echo "<button class='ViewChange-Btn' id='ViewChange-Btn-1' onclick=ViewChange(1)>個人商品架</button>";
        if($account==$_GET["UserID"]){
            echo "<button class='ViewChange-Btn' id='ViewChange-Btn-2' onclick=ViewChange(2)>進行中訂單</button>";
            echo "<button class='ViewChange-Btn' id='ViewChange-Btn-3' onclick=ViewChange(3)>歷史訂單</button>";
        }
    }

    function GoodsListView($account,$goodslistData){
        $len=count($goodslistData);
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
                ";
                if($account==$_GET["UserID"])echo "
                        <button class='DeleteItem-Btn' id='DI-Btn-$item_id'>❌</button>    
                        <button class='EditBookInf-Btn' id='EBI-Btn-$item_id'>🖊️</button>
                ";
                echo "
                        <div class='Book-Img-Block'>$img</div>
                        <div class='Book-Name-Block'>$bookname</div>
                        <div class='Book-PriceNumber-Block'>
                            <div class='Book-Price-Block'>$$bookprice</div>
                            <div class='Book-Number-Block'>剩餘:$booknum</div>
                        </div>
                    </div>
                ";
        
                if($id==2||$id==5||$id==min(6,$len-6*$tabid)-1)echo "</div>";//view tab row end
            }

            echo "</div>";//view tab end
        }

    
        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-1'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn goodslist-btn' id='GoodsList-tab-btn-$id'>$vis_id</button>";
        }
    }

    function CurOrderListView($account,$orderData){
        $len=count($orderData);
        $tabnum=intdiv($len,6)+($len<6?1:($len%6>0));

        for($tabid=0;$tabid<$tabnum;$tabid++){
            echo "<div class='ViewTab order-view' id='curorder-sub-view-tab-$tabid'>";
            
            for($id=0;$id<min(6,$len-6*$tabid);$id++){
                $item_id=$tabid*6+$id;

                echo "<div class='Order-List-Block'>";
                
                $order_ID=$orderData[$item_id]["ord_id"];
                $another_userID=$account==$orderData[$item_id]["ord_seller"]?$orderData[$item_id]["ord_buyer"]:$orderData[$item_id]["ord_seller"];
                $order_time=$orderData[$item_id]["ord_ordtime"];
          
                echo "
                    <div class='Order-List-OrderID-Block'>
                        <a href='#' class='OrderDetailLink'>$order_ID</a>
                    </div>
                    <div class='Order-List-UserId-Block'>
                        <a href='UserPage.php?UserID=$another_userID'>$another_userID</a>
                    </div>
                    <div class='Order-List-OrderTime-Block'>$order_time</div>
                    <div class='Order-List-State-Block'>
                ";
                
                if($account==$orderData[$item_id]["ord_seller"]){//賣家view
                   
                    if($orderData[$item_id]["ord_state"]==0){
                        echo "
                            <button class='Order-List-Btn ord-list-btn-accept' id='ord-accept-btn-$order_ID'>確認</button>
                            <button class='Order-List-Btn ord-list-btn-reject' id='ord-reject-btn-$order_ID'>拒絕</button>
                        ";
                    }
                    else{
                        echo "
                            <button class='Order-List-Btn ord-list-btn-complete' id='ord-complete-btn-$order_ID'>完成</button>
                            <button class='Order-List-Btn ord-list-btn-terminate' id='ord-terminate-btn-$order_ID'>終止</button>
                        ";
                    }
                    
                }
                else{//買家view
                    if($orderData[$item_id]["ord_state"]==0){
                        echo "
                            賣家還沒確認您的訂單
                        ";
                    }
                    else{
                        echo "
                            賣家確認了您的訂單
                        ";
                    }
                }
                echo "</div>";//Order-List-State-Block END
               

                echo "</div>";//Order-List-Block END
            }

            echo "</div>";//view tab end
        }


        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-2'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn curorder-btn' id='CurOrder-tab-btn-$id'>$vis_id</button>";
        }
    }

    function HistoryOrderInf($account,$orderData){
        $len=count($orderData);
        $tabnum=intdiv($len,6)+($len<6?1:($len%6>0));

        for($tabid=0;$tabid<$tabnum;$tabid++){
            echo "<div class='ViewTab order-view' id='historyorder-sub-view-tab-$tabid'>";
            
            for($id=0;$id<min(6,$len-6*$tabid);$id++){
                $item_id=$tabid*6+$id;

                echo "<div class='Order-List-Block'>";
                
                $order_ID=$orderData[$item_id]["ord_id"];
                $another_userID=$account==$orderData[$item_id]["ord_seller"]?$orderData[$item_id]["ord_buyer"]:$orderData[$item_id]["ord_seller"];
                $order_time=$orderData[$item_id]["ord_ordtime"];
          
                echo "
                    <div class='Order-List-OrderID-Block'>
                        <a href='#' class='OrderDetailLink'>$order_ID</a>
                    </div>
                    <div class='Order-List-UserId-Block'>
                        <a href='UserPage.php?UserID=$another_userID'>$another_userID</a>
                    </div>
                    <div class='Order-List-OrderTime-Block'>$order_time</div>
                    <div class='Order-List-State-Block'>
                ";
                
                if($orderData[$item_id]["ord_state"]==2){
                    echo "
                        這筆交易訂單已經完成
                    ";
                }
                if($orderData[$item_id]["ord_state"]==3||$orderData[$item_id]["ord_state"]==4){
                    echo "
                        這筆交易訂單已無效
                    ";
                }
                        
                echo "</div>";//Order-List-State-Block END
               

                echo "</div>";//Order-List-Block END
            }

            echo "</div>";//view tab end
        }


        echo "</div>";
        echo "<div class='tab-btn-bar' id='tab-btn-bar-3'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn' id='HistoryOrder-tab-btn-$id'>$vis_id</button>";
        }
    }
?>