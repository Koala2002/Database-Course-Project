<!DOCTYPE html>
<html lang="zh_TW">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../CSS/Common.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <link rel="stylesheet" href="../CSS/LoginRegisterPage.css">
    <script type="text/javascript" src="../JavaScript/HeaderBuilder.js"></script>

    <title>School Book Store</title>
</head>

<body>
    <div id="header">
        <script>OnlyHomeLinkBuild('../');</script>
    </div>
    <div id="FormBlock">
        <a href="LoginPage.php">To Login&ensp;<big><big>&rArr;</big></big></a>

        <form method="post" id="RegisterForm">
            <input type="text" name="account" id="account" placeholder="帳號" minlength="5" maxlength="20">
            <input type="text" name="password" id="password" placeholder="密碼">
            <input type="text" name="nickname" id="nickname" placeholder="暱稱" minlength="2" maxlength="20">
            <input type="text" name="phonenumber" id="phonenumber" placeholder="手機號碼" minlength="10" maxlength="10">
            <input type="submit" name="RegisterButton" value="Register">
        </form>
    </div>

    <script>
        var Form=document.getElementById("RegisterForm");
        Form.style.height="calc("+(50*Form.children.length-1)+"px + 100px)";
    </script>

</body>
</html>

<?php
    require_once("DB/DB_Common.php");
    require_once("DB/DB_UnLogin.php");

    if($_POST){
        if(!createUser($bookstore,$loginsys,$_POST["account"],$_POST["password"],$_POST["nickname"],$_POST["phonenumber"])){
            echo "<script>
                var label = document.createElement('font');
                
                label.setAttribute('id','create_user_error_text');
                label.innerHTML='已存在此帳號!!!';
                
                label.style.display = 'flex';
                label.style.alignItems = 'center';
                
                label.style.position='absolute';
                label.style.left='340px';
                label.style.top='40px';

                label.style.height='40px';
               

                label.style.fontSize='1em';
                label.setAttribute('color','red');

                document.getElementById('FormBlock').appendChild(label);
            </script>";
        }
        else {
            userLogin($loginsys,$_POST["account"],$_POST["password"]);
            header("location:../index.php"); 
        }
    }
?>
