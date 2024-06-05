function OnlyHomeLinkBuild(indexPrefix){
    header="\
    <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>";

    document.write(header);
}

function UserUnLoginHeaderBuild(indexPrefix,phpPrefix){
    header="\
    <label>校園二手書局📖</label>\
    <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>\
    <a href='"+phpPrefix+"LoginPage.php' id='LoginLink'>Login</a>";

    document.write(header);
}

function UserLoginHeaderBuild(indexPrefix,phpPrefix){
    header="\
    <label>校園二手書局📖</label>\
    <a href='"+indexPrefix+"index.php' id='HomeLink'>🛖</a>\
    <a href='"+phpPrefix+"newGoodsPage.php?GoodsNum=0&State=0' id='newGoodsLink'>➕</a>\
    <button onclick=MailBoxControl() id='MailBoxBtn'>✉️</button>\
    <a href='"+phpPrefix+"UserPage.php' id='UserPageLink'>Profile</a>\
    <a href='"+phpPrefix+"UserLogout.php' id='LogoutLink'>Logout</a>\
    <div id='MailBox'></div>";
    document.write(header);
}


var BoxState=0;

function MailBoxControl(){
    if(BoxState)document.getElementById("MailBox").style.display="none";
    else document.getElementById("MailBox").style.display="flex";

    BoxState=!BoxState;
    console.log(BoxState);
}