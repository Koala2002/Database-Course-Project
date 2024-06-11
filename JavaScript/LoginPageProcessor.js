var inputBlock,wrongingBlock,inputwrongingBlock

window.onload = ()=>{    
    GenerateCode();

    document.getElementById("verify-code-img").addEventListener("click", GenerateCode);
    
    inputBlock=document.getElementById("input-Block");
    wrongingBlock=document.getElementById("wronging-Block");
    inputwrongingBlock=document.getElementById("wronging-Block");
}

function Login(){
    let account=document.getElementById("account").value;
    let password=document.getElementById("password").value;
    let vcode=document.getElementById("verifyCode").value;
    
    let account_msg=document.getElementById("account-wronging-msg");
    let vcode_msg=document.getElementById("login-vcode-wronging-msg");

    account_msg.innerHTML="";
    vcode_msg.innerHTML="";

    $.ajax({
        url:"../PHP/API/API_Login.php",
        type:"POST",
        data:{
            account:account,
            password:password,
            vcode:vcode,
        },
        success:(result)=>{
            if(result["result"]=="verify-error"){
                vcode_msg.innerHTML="驗證碼錯誤!!!";
            }
            else if(result["result"]=="login-error"){
                account_msg.innerHTML="帳號或密碼錯誤!!!";
            }
            else window.location.href="../../index.php";
        },
        error:(error)=>{console.log(error,"In File LoginPageProcessor.js Login() API fail");} 
    });
}

function GenerateCode(){
    $.ajax({
        url:'../PHP/API/API_VerifyCodeGenerate.php',
        type:'POST',
        async:false,
        success:(data)=>{
            eval(data["code"]);
        },
        error:(error)=>{
            console.log(error,'In File LoginPageProcessor.js generateCaptcha() API fail');
        }
    });
}

