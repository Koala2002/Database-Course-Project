var ViewNow=1,subview=[0,0,0];
var sortview;

function TabInit(){
    let urlhash=window.location.hash;//url hash
    urlhash=urlhash.slice(1).split('-');
    let tabid=urlhash.length==2?urlhash[1]:0;

    if(window.location.hash===""||urlhash[0]==="GoodsList"){
        ViewNow=1;
        window.location.hash="GoodsList-"+tabid;
        urlhash= window.location.hash.slice(1).split('-');
    }
    else if(urlhash[0]==="CurOrder")ViewNow=2;
    else if(urlhash[0]==="HistoryOrder")ViewNow=3;

    let GoodsListSubViewTab=document.getElementById("goodslist-sub-view-tab-"+0);
    if(GoodsListSubViewTab)GoodsListSubViewTab.style.display="flex";
    let CurOrderSubViewTab=document.getElementById("curorder-sub-view-tab-"+0);
    if(CurOrderSubViewTab)CurOrderSubViewTab.style.display="flex";
    let HistoryOrderSubViewTab=document.getElementById("historyorder-sub-view-tab-"+0);
    if(HistoryOrderSubViewTab)HistoryOrderSubViewTab.style.display="flex";

    document.getElementById("main-view-tab-"+ViewNow).style.display="flex";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="flex";

    for(let id=1;id<=3;id++){
        let viewbtn=document.getElementById("ViewChange-Btn-"+id);

        if(!viewbtn)continue;

        viewbtn.addEventListener("mouseover",()=>{
            if(id==ViewNow)viewbtn.style.backgroundColor="var(--btnPageNow-Hover-backgroundColor)";
            else viewbtn.style.backgroundColor="var(--linkBackground-hover-color)";
        });
        viewbtn.addEventListener("mouseout",()=>{
            if(id==ViewNow)viewbtn.style.backgroundColor="var(--websitethirdColor)";
            else viewbtn.style.backgroundColor="var(--websitebackground-color)";
        });

        if(id==ViewNow){
            document.getElementById("ViewChange-Btn-"+id).style.backgroundColor="var(--websitethirdColor)";
            continue;
        }
        document.getElementById("main-view-tab-"+id).style.display="none";
        document.getElementById("tab-btn-bar-"+id).style.display="none";
    }
    
    document.getElementById(urlhash[0]+"-tab-btn-"+urlhash[1]).click();
}

window.addEventListener("hashchange",(event)=>{
    let urlhash=window.location.hash;
    urlhash=urlhash.slice(1).split('-');
    
    let tabid=urlhash.length==2?urlhash[1]:0;

    if(window.location.hash===""||urlhash[0]==="GoodsList"){
        ViewNow=1;
        window.location.hash="GoodsList-"+tabid;
        urlhash= window.location.hash.slice(1).split('-');
    }
    else if(urlhash[0]==="CurOrder")ViewNow=2;
    else if(urlhash[0]==="HistoryOrder")ViewNow=3;

    document.getElementById("main-view-tab-"+ViewNow).style.display="flex";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="flex";

    for(let id=1;id<=3;id++){
        let viewbtn=document.getElementById("ViewChange-Btn-"+id);

        if(!viewbtn)continue;

        if(id==ViewNow){
            document.getElementById("ViewChange-Btn-"+id).style.backgroundColor="var(--websitethirdColor)";
            continue;
        }
        else viewbtn.style.backgroundColor="var(--websitebackground-color)";
        
        document.getElementById("main-view-tab-"+id).style.display="none";
        document.getElementById("tab-btn-bar-"+id).style.display="none";
    }

    document.getElementById(urlhash[0]+"-tab-btn-"+urlhash[1]).click();
});

function ViewChange(view){
    let urlhash=window.location.hash;//url hash
    urlhash=urlhash.slice(1).split('-');
    sortview[urlhash[0]].style.display = "none";

    if(view==1){
        window.location.hash="GoodsList-0";
        document.getElementById("GoodsList-tab-btn-0").click();
        sortview["GoodsList"].style.display = "flex";
    }
    else if(view==2){
        window.location.hash="CurOrder-0";
        document.getElementById("CurOrder-tab-btn-0").click();
        sortview["CurOrder"].style.display = "flex";
    }
    else if(view==3){
        window.location.hash="HistoryOrder-0";
        document.getElementById("HistoryOrder-tab-btn-0").click();
        sortview["HistoryOrder"].style.display = "flex";
    }
    document.getElementById("main-view-tab-"+ViewNow).style.display="none";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="none";

    let previewbtn=document.getElementById("ViewChange-Btn-"+ViewNow);
    previewbtn.style.backgroundColor="var(--websitebackground-color)";

    ViewNow=view;

    let viewbtn=document.getElementById("ViewChange-Btn-"+ViewNow);
    viewbtn.style.backgroundColor="var(--websitethirdColor)";
    
    if(ViewNow==1){
        let GoodsListSubViewTab=document.getElementById("goodslist-sub-view-tab-"+subview[0]);
        
        if(GoodsListSubViewTab){
            GoodsListSubViewTab.style.display="none";    
            subview[0]=0;
            GoodsListSubViewTab.style.display="flex";
        }
    }
    else if(ViewNow==2){
        let CurOrderSubViewTab=document.getElementById("curorder-sub-view-tab-"+subview[1]);
        if(CurOrderSubViewTab){
            CurOrderSubViewTab.style.display="none";
            subview[1]=0;
            CurOrderSubViewTab.style.display="flex";
        }
    }
    else if(ViewNow==3) {
        let HistoryOrderSubViewTab=document.getElementById("historyorder-sub-view-tab-"+subview[2]);
        if(HistoryOrderSubViewTab){
            HistoryOrderSubViewTab.style.display="none";
            subview[2]=0;
            HistoryOrderSubViewTab.style.display="flex";
        }
    }
    
    document.getElementById("main-view-tab-"+view).style.display="flex";
    document.getElementById("tab-btn-bar-"+view).style.display="flex";
}

function OrderDetailLinkSetting(){
    Links=document.getElementsByClassName("OrderDetailLink");

    Array.from(Links).forEach((link)=>{
        link.addEventListener("click",(event)=>{
            event.preventDefault();

            let form = document.createElement("form");
            form.method = "POST";
            form.action = "OrderDetailPage.php";

            var OrderID = document.createElement("input");
            OrderID.type = "hidden";
            OrderID.name = "OrderID";
            OrderID.value = link.innerHTML;

            form.appendChild(OrderID);

            document.body.appendChild(form);
            form.submit();
            form.remove();
        });
    });
}



function SortBlockSetting(){
    sortview={
        "GoodsList":document.getElementById("goodslist-sort-view"),
        "CurOrder":document.getElementById("curorder-sort-view"),
        "HistoryOrder":document.getElementById("historyorder-sort-view")
    };

    for(let key in sortview){
        if(sortview[key]){
            sortview[key].style.display = "none";           
        }
    };

    let urlhash=window.location.hash;//url hash
    urlhash=urlhash.slice(1).split('-');

    sortview[urlhash[0]].style.display = "flex";
}

function viewsort(view){
    let urlhash=window.location.hash;//url hash
    urlhash=urlhash.slice(1).split('-');
    window.location.hash=urlhash[0]+"-0";

    if(view=="GoodsList"){
        let orderNow=document.getElementById("goods-sort");
    
        if(orderNow.value=="down")orderNow.value="up";
        else orderNow.value="down";

        document.getElementById("goodslist-sort-view").submit();
    }
    if(view=="CurOrder"){
        let orderNow=document.getElementById("cord-sort");
    
        if(orderNow.value=="down")orderNow.value="up";
        else orderNow.value="down";

        document.getElementById("curorder-sort-view").submit();
    }
    if(view=="HistoryOrder"){
        let orderNow=document.getElementById("hord-sort");
    
        if(orderNow.value=="down")orderNow.value="up";
        else orderNow.value="down";

        document.getElementById("historyorder-sort-view").submit();
    }
}