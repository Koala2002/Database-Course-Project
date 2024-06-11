<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/LoginRegisterPage.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>
    <script type="text/javascript" src="../JavaScript/RegisterPageProcessor.js"></script>
    

    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <script>OnlyHomeLinkBuild('../');</script>
    </div>
    <div id="FormBlock">
        <a href="LoginPage.php">To Login&ensp;<big><big>&rArr;</big></big></a>

        <div id="input-wronging-Block">
            <div id="input-Block">
                <input type="text" name="account" id="account" placeholder="請輸入新用戶帳號" minlength="5" maxlength="20">
                <input type="text" name="password" id="password" placeholder="請輸入新用戶密碼" minlength="5" maxlength="20">
                <input type="text" name="nickname" id="nickname" placeholder="請輸入新用戶暱稱" minlength="2" maxlength="20">
            </div>    
            <div id="wronging-Block">
                <label id="account-wronging-msg"></label>
                <label id="password-wronging-msg"></label> 
                <label id="nickname-wronging-msg"></label>
            </div>
        </div>

        <div id="btn-container">
            <button id="register-state-1-btn">上一步</button>
            <button id="register-state-2-btn">下一步</button>
        </div>
    </div>

</body>
</html>
