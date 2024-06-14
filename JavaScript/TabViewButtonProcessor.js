var viewNow={};
var ddd={};

function tabButtonSetting(btnClass,btnbarclass,tabID,viewName){
    let btns=document.getElementsByClassName(btnClass);
    let bar=document.getElementById(btnbarclass);

    if(!bar)return;

    ddd[viewName]=[];
    ddd[viewName].push(document.createElement("label"));
    ddd[viewName].push(document.createElement("label"));
    
    ddd[viewName][0].setAttribute("class","btn-dotdotdot "+viewName+"-btnddd");
    ddd[viewName][0].innerHTML="...";
    ddd[viewName][0].style.display="none";
    ddd[viewName][1].setAttribute("class","btn-dotdotdot "+viewName+"-btnddd");
    ddd[viewName][1].innerHTML="...";
    ddd[viewName][1].style.display="none";

    viewNow[viewName]=0;
    if(btns.length>0)btns[viewNow[viewName]].style.backgroundColor="var(--websitethirdColor)"
  
    bar.insertBefore(ddd[viewName][0],btns[1]);
    bar.insertBefore(ddd[viewName][1],btns[btns.length-1]);

    Array.from(btns).forEach((btn,idx)=>{
        btn.style.display="none";

        btn.addEventListener("click",()=>{
            btns[viewNow[viewName]].style.backgroundColor="var(--websitebackground-color)";
            document.getElementById(tabID+viewNow[viewName]).style.display="none";
            
            let preid=viewNow[viewName];
            
            btns[viewNow[viewName]].style.backgroundColor="var(--websitebackground-color)";
            
            viewNow[viewName]=idx;

            document.getElementById(tabID+viewNow[viewName]).style.display="flex";
      
            let urlhash=window.location.hash;//url hash
            urlhash=urlhash.slice(1).split('-');
            window.location.hash=viewName+"-"+viewNow[viewName];


            btns[viewNow[viewName]].style.backgroundColor="var(--websitethirdColor)";
           
            ddd[viewName][0].style.display="none";
            ddd[viewName][1].style.display="none";

            btns[preid].style.display="none";
            for(let i=1;i<=3;i++){
                if(preid-i>=0)btns[preid-i].style.display="none";
                if(preid+i<btns.length)btns[preid+i].style.display="none";
            }
            
            btns[0].style.marginRight="15px";
            if(preid+2<btns.length)btns[preid+2].style.marginRight="15px";
            if(preid+3<btns.length)btns[preid+3].style.marginRight="15px";

            btns[viewNow[viewName]].style.display="flex";
            for(let i=1;i<=2;i++){
                if(viewNow[viewName]-i>=0)btns[viewNow[viewName]-i].style.display="flex";
                if(viewNow[viewName]+i<=btns.length-1)btns[viewNow[viewName]+i].style.display="flex";
            }


            if(viewNow[viewName]==0&&btns.length>=4)btns[3].style.display="flex";
            if(viewNow[viewName]==btns.length-1&&btns.length>=4)btns[btns.length-4].style.display="flex";

            btns[0].style.display=btns[btns.length-1].style.display="flex";

            if(viewNow[viewName]-2>0){
                ddd[viewName][0].style.display="flex";
                btns[0].style.marginRight="0";
            }
            if(viewNow[viewName]+2<btns.length-1){
                ddd[viewName][1].style.display="flex";
                if(viewNow[viewName]>0)btns[viewNow[viewName]+2].style.marginRight="0";
                else btns[viewNow[viewName]+3].style.marginRight="0";
            }
        });

        btn.addEventListener("mouseover",()=>{
            if(idx==viewNow[viewName])btn.style.backgroundColor="var(--btnPageNow-Hover-backgroundColor)";
            else btn.style.backgroundColor="var(--linkBackground-hover-color)";
        });

        btn.addEventListener("mouseout",()=>{
            if(idx==viewNow[viewName])btn.style.backgroundColor="var(--websitethirdColor)";
            else btn.style.backgroundColor="var(--websitebackground-color)";
        });
        console.log(btn);
    });
}