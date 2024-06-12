var ViewNow=1,subview=[0,0,0];

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

    document.getElementById("goodslist-sub-view-tab-"+0).style.display="flex";
    document.getElementById("curorder-sub-view-tab-"+0).style.display="flex";
    document.getElementById("historyorder-sub-view-tab-"+0).style.display="flex";

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

    let btn=document.getElementsByClassName("EditBookInf-Btn"); //
    console.log(urlhash[0]+"-tab-btn-"+urlhash[1]);
    document.getElementById(urlhash[0]+"-tab-btn-"+urlhash[1]).click();
}

function ViewChange(view){
    if(view==1){
        window.location.hash="GoodsList-0";
        document.getElementById("GoodsList-tab-btn-0").click();
    }
    else if(view==2){
        window.location.hash="CurOrder-0";
        document.getElementById("CurOrder-tab-btn-0").click();
    }
    else if(view==3){
        window.location.hash="HistoryOrder-0";
        //document.getElementById("Historyorder-tab-btn-0").click();
    }
    document.getElementById("main-view-tab-"+ViewNow).style.display="none";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="none";

    console.log("ViewChange-Btn-"+ViewNow);
    let previewbtn=document.getElementById("ViewChange-Btn-"+ViewNow);
    previewbtn.style.backgroundColor="var(--websitebackground-color)";

    ViewNow=view;

    let viewbtn=document.getElementById("ViewChange-Btn-"+ViewNow);
    viewbtn.style.backgroundColor="var(--websitethirdColor)";
    

    document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="none";
    document.getElementById("curorder-sub-view-tab-"+subview[1]).style.display="none";
    subview[0]=subview[1]=subview[2]=0;
    document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="flex";
    document.getElementById("curorder-sub-view-tab-"+subview[1]).style.display="flex";

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
        });
    });
}