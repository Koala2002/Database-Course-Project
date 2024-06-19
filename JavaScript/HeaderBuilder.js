function OnlyHomeLinkBuild(indexPrefix){
    header="\
    <div id='header-bar'></div>\
    <a href='"+indexPrefix+"index.php' id='System-Title'>📖校園二手書局📖</a>\
    <button onclick=DeveloperInfControl() id='DeveloperInformationBtn'>❔</button>\
    <div id='DeveloperInfBlock'></div>";
    document.write(header);
}

function UserUnLoginHeaderBuild(indexPrefix,phpPrefix){
    header="\
    <div id='header-bar'></div>\
    <a href='"+indexPrefix+"index.php' id='System-Title'>📖校園二手書局📖</a>\
    <button onclick=DeveloperInfControl() id='DeveloperInformationBtn'>❔</button>\
    <div id='DeveloperInfBlock'></div>\
    <a href='"+phpPrefix+"LoginPage.php' id='LoginLink'>Login</a>";

    document.write(header);
}

function UserLoginHeaderBuild(indexPrefix,phpPrefix){
    $.ajax({
        url:"../PHP/API/API_GetLoginUserID.php",
        type: 'POST',
        async:false,
        success:(data)=>{
            header="\
            <div id='header-bar'></div>\
            <a href='"+indexPrefix+"index.php' id='System-Title'>📖校園二手書局📖</a>\
            <button onclick=DeveloperInfControl() id='DeveloperInformationBtn'>❔</button>\
            <div id='DeveloperInfBlock'></div>\
            <a href='"+phpPrefix+"newGoodsPage.php?GoodsNum=0&State=0' id='newGoodsLink'>➕</a>\
            <button onclick=MailBoxControl() id='MailBoxBtn'>✉️</button>\
            <a href='"+phpPrefix+"UserPage.php?UserID="+data["UserID"]+"' id='UserPageLink'>Profile</a>\
            <a href='"+phpPrefix+"UserLogout.php' id='LogoutLink'>Logout</a>\
            <div id='MailBox'></div>";
            
            document.write(header);
        },
        error: (error)=>{console.log(error,"In File HeaderBuilder.js UserLoginHeaderBuild(indexPrefix,phpPrefix) API fail");}
    });
}

/*MailBox Checker*/
var BoxState=0,mailBox;
var inMainPage=window.location.hash.match("MainPage");
var mailContentContainer=null;

function MailBoxControl(){   
    if(BoxState)mailBox.style.top = "-60vh";
    else {
        mailBox.style.top = "8vh";
        GetMailData();
    }
    BoxState=!BoxState;
}

function MailRead(ID,container){
    $.ajax({
        url:"../PHP/API/API_MailSetRead.php",
        type:"POST",
        data:{MailID:ID},
        success:(result)=>{
            console.log(result);
            container.style.backgroundColor="var(--websitesecondColor)";
                
            container.addEventListener('mouseover', ()=>{
                container.style.backgroundColor="var(--contentBlock-hover-background-color)";
            });
            
            container.addEventListener('mouseout', ()=>{
                container.style.backgroundColor="var(--websitesecondColor)";
            });
},
        error:(error)=>{console.log(error,"In File HeaderBuilder.js MailRead(ID) API fail");}
    });
}

function GetMailData(){
    $.ajax({
        url:"../PHP/API/API_GetMailData.php",
        type:"POST",
        async:false,
        success:(data) => {
            mailContentContainer.innerHTML = "";
            data["data"].forEach((row,idx)=>{
                let mailRowContainer=document.createElement("div");
                mailRowContainer.setAttribute("class", "Mail-Row-Container");
                mailRowContainer.setAttribute("id", "Mail-Row-Container-"+idx);

                if(row["mail_type"]!=3&&row["mail_type"]!=4){
                    if(inMainPage){
                        mailRowContainer.innerHTML+="\
                            <a class='mail-link' href='PHP/UserPage.php?UserID="+row["sender_id"]+"'>"+row["sender_id"]+"</a>\
                        "
                    }
                    else{
                        mailRowContainer.innerHTML+="\
                            <a class='mail-link' href='UserPage.php?UserID="+row["sender_id"]+"'>"+row["sender_id"]+"</a>\
                        "
                    }
                }

                if(row["mail_state"]=='1'){
                    mailRowContainer.style.backgroundColor="var(--websitesecondColor)";
                
                    mailRowContainer.addEventListener('mouseover', ()=>{
                        mailRowContainer.style.backgroundColor="var(--contentBlock-hover-background-color)";
                    });
                   
                    mailRowContainer.addEventListener('mouseout', ()=>{
                        mailRowContainer.style.backgroundColor="var(--websitesecondColor)";
                    });
                }
                else{
                    mailRowContainer.style.backgroundColor="var(--MailUnReadBackground)";
                    mailRowContainer.addEventListener('mouseover', ()=>{
                        mailRowContainer.style.backgroundColor="var(--MailUnReadHoverBackground)";
                    });
                   
                    mailRowContainer.addEventListener('mouseout', ()=>{
                        mailRowContainer.style.backgroundColor="var(--MailUnReadBackground)";
                    });
                }

                $.ajax({
                    url:"../PHP/API/API_GetMailDetail.php",
                    type:"POST",
                    async:false,
                    data:{
                        MailType:row["mail_type"],
                        MailID:row["mail_id"]
                    },
                    success:(result) => {
                        let link=document.createElement("a");
                        link.className="mail-link";
                        link.innerHTML=String(result["detail"]);
                        
                        if(row["mail_type"]>=1&&row["mail_type"]<=7){

                            link.addEventListener("click",(event)=>{
                                event.preventDefault();
                                let form = document.createElement("form");
                                form.method = "POST";
                                if(inMainPage)form.action = "PHP/OrderDetailPage.php";
                                else form.action = "OrderDetailPage.php";
                        
                                var OrderID = document.createElement("input");
                                OrderID.type = "hidden";
                                OrderID.name = "OrderID";
                                OrderID.value = String(result["detail"]);
                        
                                form.appendChild(OrderID);
                        
                                document.body.appendChild(form);
                                form.submit();
                                form.remove();
                            });
                        }
                        else {
                            if(inMainPage)link.href = "PHP/BookPage.php?GoodsID="+result["detail"];
                            else link.href = "BookPage.php?GoodsID="+result["detail"];
                        }
                        if(row["mail_type"]==1){
                            mailRowContainer.appendChild(document.createTextNode("拒絕了您在"));
                            mailRowContainer.appendChild(link);
                            mailRowContainer.appendChild(document.createTextNode("上的訂單請求"));
                        }
                        else if(row["mail_type"]==2){
                            mailRowContainer.appendChild(document.createTextNode("中止了您在"));
                            mailRowContainer.appendChild(link);
                            mailRowContainer.appendChild(document.createTextNode("的交易"));
                        }
                        else if(row["mail_type"]==3){
                            mailRowContainer.appendChild(document.createTextNode("您的"));
                            mailRowContainer.appendChild(link);
                            mailRowContainer.appendChild(document.createTextNode("交易已完成~"));
                        }
                        else if(row["mail_type"]==4){
                            mailRowContainer.appendChild(document.createTextNode("系統中止了您在"));
                            mailRowContainer.appendChild(link);
                            mailRowContainer.appendChild(document.createTextNode("上的交易"));
                        }
                        else if(row["mail_type"]==5){
                            mailRowContainer.appendChild(document.createTextNode("向您請求了一筆訂單，訂單細節："));
                            mailRowContainer.appendChild(link);
                        }
                        else if(row["mail_type"]==6){
                            mailRowContainer.appendChild(document.createTextNode("確認了您請求的一筆訂單，訂單細節："))
                            mailRowContainer.appendChild(link);
                        }
                        else if(row["mail_type"]==7){
                            mailRowContainer.appendChild(document.createTextNode("向您傳送了一則訊息，訊息位於："));
                            mailRowContainer.appendChild(link);
                        }
                        else if(row["mail_type"]==8){
                            mailRowContainer.appendChild(document.createTextNode("上傳了您所需要的書籍，書籍資訊："));
                            mailRowContainer.appendChild(link);
                        }
                    }, 
                    error:(error) => {
                        console.log(error,"In File HeaderBuilder.js MailBoxContentBuild() API fail");
                    }
                });

                mailRowContainer.addEventListener("click",()=>{MailRead(row["mail_id"],mailRowContainer);});

                mailContentContainer.appendChild(mailRowContainer);
            });
        },
        error:(error) => {
            console.log(error,"In File HeaderBuilder.js MailBoxContentBuild() API fail");
        }
    });
}
/*MailBox Checker*/

/*Cart Checker*/
function CartChecker(){
    if(sessionStorage.getItem("Cart")){
        let cart=document.createElement("a");
        cart.setAttribute("id","Cart-Link");
        cart.innerHTML="🛒";

        if(window.location.pathname=="/index.php")cart.setAttribute("href","PHP/CartPage.php");
        else cart.setAttribute("href","CartPage.php");

        document.body.appendChild(cart);
    }
}
/*Cart Checker*/

/*Creator Information*/
function DeveloperInfBlockBuild(){
    let Info="\
        <div id='developer-inf'>\
            <div id='title'>開發者</div>\
            <div id='item'>資工甲班 吳瑋修</div>\
            <div id='item'>資工甲班 吳俊憲</div>\
            <div id='item'>資工甲班 林獻堂</div>\
            <div id='item'>資工甲班 邱立翰</div>\
        </div>\
        <div id='bottom-inf'>Site design 2024/05/15 ~ 2024/06/20 © NFU 資訊工程系 - 資料庫系統專題</div>\
    ";

    let block=document.getElementById("DeveloperInfBlock");
    block.innerHTML=Info;   
}

function DeveloperInfControl(){
    let block=document.getElementById("DeveloperInfBlock");
    console.log(block.style.top);

    if(block.style.top=="8vh")block.style.top="-92vh";
    else block.style.top="8vh";
}
/*Creator Information*/

$(document).ready(()=>{
    DeveloperInfBlockBuild();
    mailBox=document.getElementById("MailBox");
    
    if(!mailBox)return;

    mailContentContainer=document.createElement("div");
    mailContentContainer.setAttribute("id","mailContentContainer");
    mailBox.appendChild(mailContentContainer);

    let mailContentShadow=document.createElement("div");
    mailContentShadow.setAttribute("id","mailContentShadow");
    mailBox.appendChild(mailContentShadow);
    
    GetMailData();
});