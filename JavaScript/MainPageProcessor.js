var tabNow=0;

function tabInit(){
    let tabs=document.getElementsByClassName("ViewTab");
    for(let id=0;id<tabs.length;id++){
        if(id>0)tabs[id].style.display="none";
        else tabs[id].style.display="flex";
    }
}

function tabButtonSetting(){
    let btns=document.getElementsByClassName("tab-btn");

    for(let id=0; id<btns.length;id++){
        btns[id].addEventListener("click",()=>{
            document.getElementById("goodslist-view-tab-"+tabNow).style.display="none";
            tabNow=id;
            document.getElementById("goodslist-view-tab-"+tabNow).style.display="flex";
        });
    }
}

function GoodsSetting(){
    let goods=document.getElementsByClassName("goods-item-Block");

    $.get(
        '../PHP/API/API_GoodsQueryALL.php',
    )
    .done((data)=>{
        for(let id=0;id<goods.length;id++){
            goods[id].addEventListener("click",()=>{
                window.location.href="../PHP/BookPage.php?GoodsID="+data["GoodsData"][id]["goods_id"];
            });
        }})
    .fail((data)=>{
        console.log("In File MainPageProcessor.js GoodsSetting(Query) API fail");
    });
}