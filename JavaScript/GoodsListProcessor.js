function GoodsSetting(page){
    let goods=document.getElementsByClassName("goods-item-Block");
    let UserID;

    if(page=="UserPage"){
        UserID=window.location.search.substring(
            window.location.search.indexOf("UserID=")+7,
            window.location.search.length
        );
    }
    
    $.ajax({
        url:"../PHP/API/API_GoodsQueryALL.php",
        data:{
            Page:page,
            UserID:UserID
        },
        type:"POST",
        success:(data)=>{
            for(let id=0;id<goods.length;id++){
                goods[id].addEventListener("click",()=>{
                    window.location.href="../PHP/BookPage.php?GoodsID="+data["GoodsData"][id]["goods_id"];
                });
            }
        },
        error:(error)=>{console.log(error,"In File MainPageProcessor.js GoodsSetting(Query) API fail2");}
    });
}