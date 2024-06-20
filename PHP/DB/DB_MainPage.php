<?php
    require_once("DB_Common.php");

    /*fetch all goods from database*/
    $SQL="(";
    $goodslistData=array();
      
    $sql_data=SearchStatement_ToSQL(isset($_GET["Search"])?$_GET["Search"]:null,$loginstate);
        
    for($id=0;$id<count($sql_data);$id++){
        $SQL.= $sql_data[$id];
        if($id==count($sql_data)-1)$SQL.=")";
        else $SQL.= " UNION ";
    }

    $SQL="SELECT * FROM ".$SQL;
    $SQL.=" G ";

    $minP=0;
    $maxP=10000;
    if(isset($_GET["minPrice"])){
        if($_GET["minPrice"]!="")$minP=max(0,min(10000,$_GET["minPrice"]));
    }
    if(isset($_GET["maxPrice"])){
        if($_GET["maxPrice"]!="")$maxP=max($minP,min(10000,$_GET["maxPrice"]));
    }
    $SQL.=" WHERE G.price>={$minP} AND G.price<={$maxP}";
    
    if(isset($_GET["SortType"])&&$_GET["SortType"]=='up')$SQL.=" ORDER BY G.price DESC";
    else $SQL.=" ORDER BY G.price";
    
    $result=null;
    $result=mysqli_query($DB,$SQL);

    echo $SQL;
    
    echo $DB->error;
    while($result&&$row=mysqli_fetch_array($result))array_push($goodslistData,$row);
    /*fetch all goods from database*/

    function SearchStatement_ToSQL($SearchStatement,$loginstate) {//查詢轉換
        $sql=array();
        
        $CourseView=$loginstate?"CourseViewForLoginUser":"CourseViewForUnloginUser";
        $GoodsView=$loginstate?"Goods_SELECT_ViewForLoginUser":"GoodsViewForUnloginUser";
        $DepartmentView=$loginstate?"DepartmentViewForLoginUser":"DepartmentViewForUnloginUser";
        $InstructorView=$loginstate?"InstructorViewForLoginUser":"InstructorViewForUnloginUser";
        $BookView=$loginstate?"BookViewForLoginUser":"BookViewForUnloginUser";

        if(!$SearchStatement){
            $SQL="(SELECT * FROM {$GoodsView} WHERE number>0)";
            array_push($sql,$SQL);
            return $sql;
        }

        $SearchStatement=explode(" ",$SearchStatement);

        $all_chinese = "/^[\x{4e00}-\x{9fa5}]+$/u";
        $all_alpha="/^[a-zA-z]+$/";
        $all_digit="/^[0-9]{13}$/";
        
        foreach($SearchStatement as $str) {
            $SQL_Query="(";
            if(preg_match($all_chinese,$str)){//科系、教授、課程名稱
                $statement1="
                    (SELECT * FROM {$GoodsView}
                    WHERE number>0 AND {$GoodsView}.isbn IN (
                        SELECT {$CourseView}.isbn FROM {$CourseView}
                        JOIN {$DepartmentView} ON {$CourseView}.isbn IS NOT NULL AND {$DepartmentView}.dep_id={$CourseView}.dep_id
                        WHERE {$DepartmentView}.dep_name LIKE '%$str%'
                    ))
                ";

                $statement2="
                    (SELECT * FROM {$GoodsView}
                    WHERE number>0 AND {$GoodsView}.isbn IN (
                        SELECT {$CourseView}.isbn FROM {$CourseView}
                        JOIN {$InstructorView} ON {$CourseView}.isbn IS NOT NULL AND {$InstructorView}.ins_id={$CourseView}.ins_id
                        WHERE {$InstructorView}.ins_name LIKE '%$str%'
                    ))
                ";

                $statement3="
                    (SELECT * FROM {$GoodsView}
                    WHERE number>0 AND {$GoodsView}.isbn IN (
                        SELECT {$CourseView}.isbn FROM {$CourseView}
                        WHERE {$CourseView}.cou_title LIKE '%$str%'
                    ))
                ";

                $SQL_Query.=$statement1." UNION ".$statement2." UNION ".$statement3;
            }
            else if(preg_match($all_alpha,$str)){//教授名稱
                $statement="
                    (SELECT * FROM {$GoodsView}
                    WHERE number>0 AND {$GoodsView}.isbn IN (
                        SELECT {$CourseView}.isbn FROM {$CourseView}
                        JOIN {$InstructorView} ON {$CourseView}.isbn IS NOT NULL AND {$InstructorView}.ins_id={$CourseView}.ins_id
                        WHERE {$InstructorView}.ins_name LIKE '%$str%'  
                    ))
                ";

                $SQL_Query.=$statement;
            }
            else if(preg_match($all_digit,$str)){//ISBN
                $statement="
                    (SELECT * FROM {$GoodsView} WHERE number>0 AND {$GoodsView}.isbn=$str)
                ";
                
                $SQL_Query.=$statement;
            }

            $statement="
                (SELECT * FROM {$GoodsView} WHERE number>0 AND {$GoodsView}.goods_name LIKE '%$str%')
            ";
            
            if(strlen($SQL_Query)>1)$SQL_Query.=" UNION ".$statement.")";
            else $SQL_Query.= $statement.")";
            array_push($sql,$SQL_Query);
        }

        return $sql;
    }

    function SearchPageBuild($goodslistData){
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