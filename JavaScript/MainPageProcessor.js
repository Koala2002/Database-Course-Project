function tabInit(){
    if(window.location.hash==="")window.location.hash="MainPage-0";
    
    let urlhash=window.location.hash;//url hash
    urlhash=urlhash.slice(1).split('-');
    
    let tabs=document.getElementsByClassName("ViewTab");
    for(let id=0;id<tabs.length;id++){
        if(id!=urlhash[1])tabs[id].style.display="none";
        else tabs[id].style.display="flex";
    }

    document.getElementById("MainPage-tab-btn-"+urlhash[1]).click();
}

function SortChange(){
    let orderNow=document.getElementById("SortType");
    
    if(orderNow.value=="down")orderNow.value="up";
    else orderNow.value="down";

    document.getElementById("search").submit();
}

window.onload=()=>{
    document.getElementById("search").addEventListener("submit",()=>{
        history.replaceState(null, null, window.location.pathname + window.location.search);
    });
}