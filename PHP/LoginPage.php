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
        <a href="RegisterPage.php">To Register&ensp;<big><big>&rArr;</big></big></a>
        <form method="post" id="LoginForm">
            <input type="text" name="account" id="account" placeholder="帳號">
            <input type="text" name="password" id="password" placeholder="密碼">
            <input type="submit" name="LoginButton" value="Login">
        </form>
    </div>

    <script>
        var Form=document.getElementById("LoginForm");
        Form.style.height="calc("+(50*Form.children.length-1)+"px + 100px)";
    </script>
</body>
</html>

<?php        
    require_once("DB/DB_Common.php");
    require_once("DB/DB_UnLogin.php");

    if($_POST){

        if(!userLogin($loginsys,$_POST["account"],$_POST["password"])){
            echo "<script>
                var label = document.createElement('font');
                
                label.setAttribute('id','create_user_error_text');
                label.innerHTML='帳號或密碼不正確!!!';
                
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
        else header("location:../index.php"); 
    }
?>