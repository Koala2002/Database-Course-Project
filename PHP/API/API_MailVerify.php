<?php
    session_start();
    header('Content-Type: application/json; charset=UTF-8');
    
    require '../../PHPMailer/src/PHPMailer.php';
    require '../../PHPMailer/src/SMTP.php';
    require '../../PHPMailer/src/Exception.php';
    
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    
    try {

        $mail = new PHPMailer(true);

        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = '41043117@gm.nfu.edu.tw';
        $mail->Password = 'gcco vckt eyce hnyh';
        $mail->SMTPSecure = 'tls'; 
        $mail->Port = 587;
    
        $VerificationCode="";
        $characters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        $charactersLength = strlen($characters);

        for($i=0;$i<10;$i++){
            $VerificationCode.=$characters[rand(0, $charactersLength - 1)];
        }

        $_SESSION["mail_vcode"]=$VerificationCode;

        $mail->setFrom('41043117@gm.nfu.edu.tw', 'School Book store'); 
        $mail->addAddress($_POST["MailAddress"]);
        $mail->Subject = 'School Book store Mail Verification Code';
        $mail->Body = "Your verification code is:$_SESSION[mail_vcode]";

        $mail->send();

        echo json_encode(["result" =>'Email sent successfully.']);
    } catch (Exception $e) {    
        echo json_encode(["result" =>"failure"]);
    }
?>