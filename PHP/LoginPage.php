<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/LoginRegisterPage.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/LoginPageProcessor.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    

    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <script>OnlyHomeLinkBuild('../');</script>
    </div>
    
    <div id="FormBlock">
        <a href="RegisterPage.php">To Register&ensp;<big><big>&rArr;</big></big></a>
        
        <div id="input-wronging-Block">
            <div id="input-Block">
                <input type="text" name="account" id="account" placeholder="帳號">
                <input type="password" name="password" id="password" placeholder="密碼">
                <div id="verify-Code-Img-Block">
                    <input type="text" name="verifyCode" id="verifyCode" placeholder="驗證碼" maxlength="6">
                    <canvas id="verify-code-img"></canvas>
                </div>
            </div>    
            <div id="wronging-Block">
                <label id="account-wronging-msg"></label>
                <label id="password-wronging-msg"></label> 
                <label id="login-vcode-wronging-msg"></label>
            </div>
        </div>
        <div id="btn-container">
            <button id="LoginButton" onclick="Login()">Login</button>
        </div>
          
    </div>
</body>
</html>

