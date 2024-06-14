var inputBlock,wrongingBlock,inputwrongingBlock,state1Btn,state2Btn


window.onload = ()=>{
    inputBlock=document.getElementById("input-Block");
    wrongingBlock=document.getElementById("wronging-Block");
    inputwrongingBlock=document.getElementById("wronging-Block");

    state1Btn=document.getElementById("register-state-1-btn");
    state2Btn=document.getElementById("register-state-2-btn");

    state1Btn.onclick=RegisterFirstState;
    state2Btn.onclick=RegisterSecondState;

    sessionStorage.clear();

    
}

function RegisterFirstState(){
    inputBlock.innerHTML="";
    wrongingBlock.innerHTML="";

    let account=document.createElement("input");
    let password=document.createElement("input");
    let nickname=document.createElement("input");
    
    account.setAttribute("type", "text");
    account.setAttribute("name", "account");
    account.setAttribute("id", "account");
    account.setAttribute("placeholder", "請輸入新用戶帳號");

    password.setAttribute("type", "text");
    password.setAttribute("name", "password");
    password.setAttribute("id", "password");
    password.setAttribute("placeholder", "請輸入新用戶密碼");
    
    nickname.setAttribute("type", "text");
    nickname.setAttribute("name", "nickname");
    nickname.setAttribute("id", "nickname");
    nickname.setAttribute("placeholder", "請輸入新用戶暱稱");

    account.value = sessionStorage.getItem("account");
    password.value = sessionStorage.getItem("password");
    nickname.value = sessionStorage.getItem("nickname");

    sessionStorage.clear();

    inputBlock.appendChild(account);
    inputBlock.appendChild(password);
    inputBlock.appendChild(nickname);

    state1Btn=document.getElementById("register-state-1-btn");
    state2Btn=document.getElementById("register-state-2-btn");
    state2Btn.innerHTML="下一步";
    state1Btn.style.display="none";
    
    state2Btn.onclick=RegisterSecondState;


    let account_wronging_msg=document.createElement("label");
    let password_wronging_msg=document.createElement("label");
    let nickname_wronging_msg=document.createElement("label");
    
    account_wronging_msg.setAttribute("id","account-wronging-msg");
    password_wronging_msg.setAttribute("id","password-wronging-msg");
    nickname_wronging_msg.setAttribute("id","nickname-wronging-msg");

    wrongingBlock.appendChild(account_wronging_msg);
    wrongingBlock.appendChild(password_wronging_msg);
    wrongingBlock.appendChild(nickname_wronging_msg);
}

function RegisterSecondState(){
    let account=document.getElementById("account").value;
    let password=document.getElementById("password").value;
    let nickname=document.getElementById("nickname").value;

    let account_regex = new RegExp("^[" + "a-zA-Z0-9@_" + "]+$");
    let password_regex = new RegExp("^[" + "a-zA-Z0-9@_" + "]+$");
    let nickname_regex = new RegExp("^[" + "a-zA-Z_\u4e00-\u9fa5" + "]+$");

    let account_msg=document.getElementById("account-wronging-msg");
    let password_msg=document.getElementById("password-wronging-msg");
    let nickname_msg=document.getElementById("nickname-wronging-msg");


    account_msg.innerHTML="";
    password_msg.innerHTML="";
    nickname_msg.innerHTML="";

    if(account.length<5){//帳號太短
        account_msg.innerHTML="帳號太短!!!";
        return;
    }
    else if(!account_regex.test(account)){
        account_msg.innerHTML="帳號格式錯誤!!!(只允許大小寫英文字母、@、_、數字)";
        return;
    }
    
    if(password.length<5){//密碼太短
        password_msg.innerHTML="密碼太短!!!";
        return;
    }
    else if(!password_regex.test(password)){
        password_msg.innerHTML="密碼格式錯誤!!!(只允許大小寫英文字母、@、_、數字)";
        return;
    }

    if(nickname.length<2){
        nickname_msg.innerHTML="暱稱太短!!!";
        return;
    }
    else if(!nickname_regex.test(nickname)){
        nickname_msg.innerHTML="暱稱格式錯誤!!!(只允許大小寫英文字母、中文)";
        return;
    }


    $.ajax({
        url:"../PHP/API/API_RegisterUserAccountCheck.php",
        type:"POST",
        data:{newaccount:account},
        success:(result)=>{
            if(result["result"]=="success"){
                sessionStorage.setItem("account",account);
                sessionStorage.setItem("password",password);
                sessionStorage.setItem("nickname",nickname);

                inputBlock.innerHTML="";
                wrongingBlock.innerHTML="";

                let mail=document.createElement("input");
                let mail_vcode_container=document.createElement("div");
                let mail_verifycode=document.createElement("input");
                let mail_vcode_resend_link=document.createElement("a");
                
                mail.setAttribute("type", "text");
                mail.setAttribute("name", "mail");
                mail.setAttribute("id", "mail");
                mail.setAttribute("placeholder", "請輸入電子郵件");

                mail_vcode_container.setAttribute("id","mail-vcode-container");
                mail_vcode_resend_link.setAttribute("id","mail-vcode-resend-link");

                mail_verifycode.setAttribute("type", "text");
                mail_verifycode.setAttribute("name", "mail-verifycode");
                mail_verifycode.setAttribute("id", "mail-verifycode");
                mail_verifycode.setAttribute("placeholder", "驗證碼");

                mail_vcode_resend_link.innerHTML="傳送驗證碼";
                mail_vcode_resend_link.addEventListener("click", MailSendVerificationCode);

                mail_vcode_container.appendChild(mail_verifycode);
                mail_vcode_container.appendChild(mail_vcode_resend_link);

                inputBlock.appendChild(mail);
                inputBlock.appendChild(mail_vcode_container);

                
                state2Btn.innerHTML="Register";
                state1Btn.style.display="flex";


                state2Btn.onclick=Register;


                let mail_wronging_msg=document.createElement("label");
                let mail_vcode_wronging_msg=document.createElement("label");
                
                mail_wronging_msg.setAttribute("id","mail-wronging-msg");
                mail_vcode_wronging_msg.setAttribute("id","mail-vcode-wronging-msg");
                
                wrongingBlock.appendChild(mail_wronging_msg);
                wrongingBlock.appendChild(mail_vcode_wronging_msg);

            }
            else{//帳號已被使用
                account_msg.innerHTML="此帳號已有用戶使用!!!";
            }
        },
        error:(error)=>{console.log(error,"In File RegisterPageProcessor.js Register() API fail");}
    });
}

function validateEmail(email){
    return String(email).toLowerCase().match(
        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    );
};

function MailSendVerificationCode(){
    let mail=document.getElementById("mail").value;
    
    let mail_wronging_msg=document.getElementById("mail-wronging-msg");
    mail_wronging_msg.innerHTML="";
    
    if(!validateEmail(mail)){
        mail_wronging_msg.innerHTML="mail格式錯誤!!!";    
        return;
    }

    let link=document.getElementById("mail-vcode-resend-link");
    link.style.animation="emailSending 0.75s infinite alternate";

    let timer=setTimeout(()=>{
        link.style.animation="";
    },10000);

    $.ajax({
        url:"../PHP/API/API_MailVerify.php",
        type:"POST",
        data:{MailAddress:mail},
        success:(result)=>{
            console.log(result);
                
            if(result["result"]!="failure")link.style.animation="";
            clearInterval(timer);
        },
        error:(error)=>{console.log(error,"In File RegisterPageProcessor.js MailSendVerificationCode() API fail");}
    });
    
}

function Register(){
    let verifycationCode=document.getElementById("mail-verifycode").value;
    let mail_vcode_wronging_msg=document.getElementById("mail-vcode-wronging-msg");
    let mail_wronging_msg=document.getElementById("mail-wronging-msg");

    mail_wronging_msg.innerHTML="";
    mail_vcode_wronging_msg.innerHTML="";

    $.ajax({
        url:"../PHP/API/API_MailVerificationCode_Verified.php",
        type:"POST",
        data:{vcode:verifycationCode},
        success:(result)=>{
            if(result["result"]=="success"){
                $.ajax({
                    url:"../PHP/API/API_Register.php",
                    type:"POST",
                    data:{
                        account:sessionStorage.getItem("account"),
                        password:sessionStorage.getItem("password"),
                        nickname:sessionStorage.getItem("nickname"),
                        email:document.getElementById("mail").value
                    },
                    success:(result)=>{
                        

                        if(result["result"]=="mail exists"){
                            mail_wronging_msg.innerHTML="此電子郵件已經註冊過";
                            return;
                        }
                        console.log(result["result"]);

                        sessionStorage.clear();

                        while(
                            sessionStorage.getItem("account")&&
                            sessionStorage.getItem("password")&&
                            sessionStorage.getItem("nickname")
                        );

                        window.location.href="../PHP/LoginPage.php";
                    },
                    error:(error)=>{console.log(error,"In File RegisterPageProcessor.js Register() inner API fail");}    
                });
            }
            else{
                console.log(result,result["result"]);
                mail_vcode_wronging_msg.innerHTML="驗證碼錯誤!!!";
            }
        },
        error:(error)=>{console.log(error,"In File RegisterPageProcessor.js Register() API fail");}
    });
}