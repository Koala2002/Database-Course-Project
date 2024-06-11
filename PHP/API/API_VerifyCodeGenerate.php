<?php
    header('Content-Type: application/json; charset=UTF-8');
    require_once("../DB/DB_Common.php");

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
              
        $response=['code'=> "
                function generateRandomString(length) {
                    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                    let result = '';
                    for (let i = 0; i < length; i++) {
                        result += characters.charAt(Math.floor(Math.random() * characters.length));
                    }
                    return result;
                }

                function getRandomColor() {
                    const letters = '456789ab';
                    let color = '#';
                    for (let i = 0; i < 6; i++) {
                        color += letters[Math.floor(Math.random() * 8)];
                    }
                    return color;
                }

                function generateCaptcha() {
                    const canvas = document.getElementById('verify-code-img');
                    const ctx = canvas.getContext('2d');

                    ctx.clearRect(0, 0, canvas.width, canvas.height);

                    const captchaText = generateRandomString(6);

                    $.ajax({
                        url:'../PHP/API/API_VerifyCodeUpdate.php',
                        type:'POST',
                        data:{code:captchaText},
                        async:false,
                        success:(data)=>{console.log(data);},
                        error:(error)=>{
                            (error)=>{console.log(error,'In File LoginPageProcessor.js generateCaptcha() API fail');}
                        }
                    });

                    ctx.fillStyle = '#323232';
                    ctx.fillRect(0, 0, canvas.width, canvas.height);

                    ctx.font = '65px Arial';
                
                    ctx.fillStyle = getRandomColor();

                    ctx.save();
                    
                    ctx.rotate(Math.random() * 0.1 - 0.05);
                    ctx.fillText(captchaText, 10, canvas.height/2);
                    ctx.restore();


                    for (let i = 0; i < 5; i++) {
                        ctx.strokeStyle = getRandomColor();
                        ctx.beginPath();
                        ctx.moveTo(Math.random() * canvas.width, Math.random() * canvas.height);
                        ctx.lineTo(Math.random() * canvas.width, Math.random() * canvas.height);
                        ctx.stroke();
                    }

                    for (let i = 0; i < 100; i++) {
                        ctx.fillStyle = getRandomColor();
                        ctx.beginPath();
                        ctx.arc(Math.random() * canvas.width, Math.random() * canvas.height, 1, 0, Math.PI * 2);
                        ctx.fill();
                    }
                }

                generateCaptcha();
        "];
    
        echo json_encode($response);
    }
?>