function OnlyHomeLinkBuild(indexPrefix){
    header="\
    <div id='header-bar'></div>\
    <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>";

    document.write(header);
}

function UserUnLoginHeaderBuild(indexPrefix,phpPrefix){
    header="\
    <div id='header-bar'></div>\
    <a href='"+indexPrefix+"index.php' id='System-Title'>📖校園二手書局📖</a>\
    <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>\
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
            <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>\
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

function MailBoxControl(){
    
    if(BoxState){    
        mailBox.style.height="0";
        mailBox.style.paddingBottom="0";
    }
    else{
        mailBox.style.height="500px";
        mailBox.style.paddingBottom="10px";
    }

    BoxState=!BoxState;
    console.log(BoxState);
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

$(document).ready(()=>{
    mailBox=document.getElementById("MailBox");
    
    if(!mailBox)return;

    let mailContentContainer=document.createElement("div");
    mailContentContainer.setAttribute("id","mailContentContainer");

    mailBox.appendChild(mailContentContainer);
});