var ViewNow=1;
var subview=[0,0,0];

function TabInit(){
    document.getElementById("main-view-tab-"+ViewNow).style.display="flex";
    document.getElementById("goodslist-sub-view-tab-"+0).style.display="flex";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="flex";

    for(let id=2;id<=3;id++){
        document.getElementById("main-view-tab-"+id).style.display="none";
        document.getElementById("tab-btn-bar-"+id).style.display="none";
    }

    let btn=document.getElementsByClassName("EditBookInf-Btn"); //
    for(let id=0;id<btn.length;id++)console.log(btn[id].parentElement);
}

function tabBarButton_Setting(){
    let buttons=document.getElementsByClassName("tab-btn");

    for(let i=0;i<buttons.length;i++){
        let id=buttons[i].id;
    
        if(id.match("goodslist")){
            buttons[i].addEventListener("click",()=>{
                document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="none";
                subview[0]=i;
                document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="flex";
            });
        }
        if(id.match("curorder")){
            buttons[i].addEventListener("click",()=>{
                document.getElementById("curorder-sub-view-tab-"+subview[1]).style.display="none";
                subview[1]=i;
                document.getElementById("curorder-sub-view-tab-"+subview[1]).style.display="flex";
            });
        }
        if(id.match("historyorder")){
            buttons[i].addEventListener("click",()=>{
                document.getElementById("historyorder-sub-view-tab-"+subview[2]).style.display="none";
                subview[2]=i;
                document.getElementById("historyorder-sub-view-tab-"+subview[2]).style.display="flex";
            });
        }
    }

    
}

function ViewChange(view){
    document.getElementById("main-view-tab-"+ViewNow).style.display="none";
    document.getElementById("tab-btn-bar-"+ViewNow).style.display="none";
    
    ViewNow=view;
    document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="none";
    subview[0]=subview[1]=subview[2]=0;
    document.getElementById("goodslist-sub-view-tab-"+subview[0]).style.display="flex";

    document.getElementById("main-view-tab-"+view).style.display="flex";
    document.getElementById("tab-btn-bar-"+view).style.display="flex";
}