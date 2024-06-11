<?php
    $path=getcwd();
    require_once($path."/DB_Common.php");

    /*fetch all goods from database*/
    $SQL="";
    
    $goodslistData=array();
    
    if(isset($_GET["Search"])){
        
        $sql_data=SearchStatement_ToSQL($_GET["Search"]);
        
        for($id=0;$id<count($sql_data);$id++){
            
            $SQL.= $sql_data[$id];
            if($id==count($sql_data)-1)continue;
            $SQL.= " UNION ";
        }
    }
    else $SQL="SELECT * FROM goods WHERE number>0";

    

    $result=mysqli_query($bookstore,$SQL);
    while($result&&$row=mysqli_fetch_array($result))array_push($goodslistData,$row);
    /*fetch all goods from database*/


    function SearchStatement_ToSQL($SearchStatement) {//查詢轉換
        $sql=array();
        
        $SearchStatement=explode(" ",$SearchStatement);

       
        $all_chinese = "/^[\x{4e00}-\x{9fa5}]+$/u";
        $all_alpha="/^[a-zA-z]+$/";
        $all_digit="/^[0-9]{13}$/";
        
        foreach($SearchStatement as $str) {
            $SQL_Query="(";
            if(preg_match($all_chinese,$str)){//科系、教授名稱
                $statement1="
                    (SELECT * FROM goods
                    WHERE number>0 AND goods.isbn IN (
                        SELECT course.isbn FROM course
                        WHERE course.isbn IS NOT NULL AND course.dep_id=(
                            SELECT department.dep_id FROM department WHERE department.dep_name='$str'
                        )
                    ))
                ";

                $statement2="
                    (SELECT * FROM goods
                    WHERE number>0 AND goods.isbn IN (
                        SELECT course.isbn FROM course
                        WHERE course.isbn IS NOT NULL AND course.ins_id=(
                            SELECT instructor.ins_id FROM instructor WHERE instructor.ins_name='$str'
                        )
                    ))
                ";

                $SQL_Query.=$statement1." UNION ".$statement2;
            }
            else if(preg_match($all_alpha,$str)){//教授名稱
                $statement="
                    (SELECT * FROM goods
                    WHERE number>0 AND goods.isbn IN (
                        SELECT course.isbn FROM course
                        WHERE course.isbn IS NOT NULL AND course.ins_id=(
                            SELECT instructor.ins_id FROM instructor WHERE instructor.ins_name='$str'
                        )
                    ))
                ";

                $SQL_Query.=$statement;
            }
            else if(preg_match($all_digit,$str)){//ISBN
                $statement="
                    (SELECT * FROM goods WHERE number>0 AND goods.isbn=$str)
                ";
                
                $SQL_Query.=$statement;
            }

            $statement="
                (SELECT * FROM goods WHERE number>0 AND goods.goods_name LIKE '%$str%')
            ";
            
            if(strlen($SQL_Query)>1)$SQL_Query.=" UNION ".$statement.")";
            else $SQL_Query.= $statement.")";
            array_push($sql,$SQL_Query);
        }

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
        echo "<div class='tab-btn-bar' id='MainPage-tab-btn-bar'>";
        
        for( $id= 0; $id<$tabnum; $id++ ){
            $vis_id=$id+1;
            echo "<button class='tab-btn' id='MainPage-tab-btn-$id'>$vis_id</button>";
        }
    }
?>