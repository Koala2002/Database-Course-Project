function isAllDigit(str){return /^[0-9]+$/.test(str);}
function isAllAlpha(str){return /^[a-zA-z]+$/.test(str);}
function isAllAlphaDigit(str){return /^[a-zA-Z0-9]+$/.test(str);}

function ISBN_CHECK(id){
    var isbn=document.getElementById("ISBN_VAL").value;
    
    var Key_Index=window.location.search.indexOf("&ISBN["+id+"]=");

    if(isbn.length<13)return "Length Invalid";
    
    var sum=0;
    for(var a=0,t=1;a<isbn.length-1;a++,t=4-t)sum+=(isbn[a]-'0')*t;
    
    if(Math.abs(sum%10-10)%10!=isbn[12]-'0')return "CheckDigit Invalid";

    return isbn;
}


function NextState(id,oldstate,newstate,value){
    let Key_Index=window.location.search.indexOf("&State=");
    
    let stateInf="&State="+newstate;
    
    if(oldstate==0&&newstate==1){
        let ISBN_CK=ISBN_CHECK(id);
        
        if(ISBN_CK=="Length Invalid");
        else if(ISBN_CK=="CheckDigit Invalid");
        else{     
            $.get(
                '../PHP/API/API_BookQuery.php',
                {ISBN:ISBN_CK}
            )
            .done(function(data){
                if(data["name"])NextState(id,1,3,[data["isbn"],data["name"]]);
                else NextState(id,1,2,[data["isbn"]]);
            })
            .fail(function(data){
                console.log("In File newGoodsProcessor.js NextState(id,oldstate,newstate,value) API fail");
            });
        }
    }
    else if(oldstate==1&&newstate==2){
        window.location.search =  window.location.search.substring(0, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length)+
                                "&ISBN["+id+"]="+
                                value[0]; 
    }
    else if(oldstate==1&&newstate==3){
        window.location.search =  window.location.search.substring(0, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length) +
                                "&ISBN["+id+"]="+
                                value[0]+
                                "&BookName["+id+"]=" +
                                value[1];
    }
    else if(oldstate==2&&newstate==3){
        let name=document.getElementById("BookName_VAL").value;
        if(name.length<1)return;

        window.location.search =  window.location.search.substring(0, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length) +
                                "&BookName["+id+"]=" +
                                name;
    }
    else if(oldstate==3&&newstate==4){
        let num=document.getElementById("BookNum_VAL").value;
        if(!isAllDigit(num)||parseInt(num)>100||parseInt(num)<1)return;

        window.location.search =  window.location.search.substring(0, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length) +
                                "&BookNum["+id+"]=" +
                                num;    
    }
    else if(oldstate==4&&newstate==5){
        let price=document.getElementById("BookPrice_VAL").value;
        if(!isAllDigit(price)||parseInt(price)>10000||parseInt(price)<0)return;
    
        window.location.search =  window.location.search.substring(0, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length)  +
                                "&BookPrice["+id+"]=" +
                                price;
    }
    else if(oldstate==5&&newstate==0){
        let description=document.getElementById("BookDescription_VAL").value;
        
        if(description.length>100)return;

        var GoodsNum_Index=window.location.search.indexOf("GoodsNum=");
        
        window.location.search =  window.location.search.substring(0, GoodsNum_Index) +
                                "GoodsNum=" +
                                (id+1) +
                                window.location.search.substring(GoodsNum_Index+10+(id+1)/10, Key_Index) +
                                stateInf +
                                window.location.search.substring(Key_Index+8,window.location.search.length) +
                                "&BookDescription["+id+"]=" +
                                description;
    }
}

function PreState(){history.back();}

function GoodsItemSetting(ISBN,Name,Num,Price){
    document.getElementById("");
}

var TabNow=0;

function TabSetting(tabcnt){
    if(window.location.hash=="")window.location.hash="NewGoodsPage-0";
    
    
    TabNow=tabcnt-1;
    console.log(TabNow);
    for(let id=0;id<tabcnt;id++){
        if(id!=TabNow)document.getElementById("tab-"+id).style.display = "none";
        else  document.getElementById("tab-"+id).style.display="flex";
    }

    let urlhash=window.location.hash.slice(1).split("-");
    console.log(urlhash[0]+"-tab-btn-"+urlhash[1]);
    document.getElementById(urlhash[0]+"-tab-btn-"+urlhash[1]).click();
}