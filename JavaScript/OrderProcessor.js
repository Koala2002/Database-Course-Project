function OrderCheckButtonSetting(){
    let acceptBtn=document.getElementsByClassName("ord-list-btn-accept");
    let rejectBtn=document.getElementsByClassName("ord-list-btn-reject");
    let completeBtn=document.getElementsByClassName("ord-list-btn-complete");
    let terminateBtn=document.getElementsByClassName("ord-list-btn-terminate");

    
    Array.from(acceptBtn).forEach((btn)=>{
        let id=btn.id.substring(btn.id.lastIndexOf("ord-accept-btn-")+15,btn.id.length);

        btn.addEventListener("click",()=>{
            if(confirm("您確定要接受這筆訂單嗎？")){
                MsgSend(6,id);
                $.ajax({
                    url:"../PHP/API/API_OrderCheck.php",
                    type:"POST",
                    data:{
                        OrderID:id,
                        state:"accept"
                    },
                    success:(data)=>{window.location.reload();},
                    error:(error)=>{
                        console.log(error,"In File OrderProcessor.js OrderCheckButtonSetting() API fail");
                    }
                });
            }
        });
    });

    Array.from(rejectBtn).forEach((btn)=>{
        let id=btn.id.substring(btn.id.lastIndexOf("ord-reject-btn-")+15,btn.id.length);

        btn.addEventListener("click",()=>{
            if(confirm("您確定要拒絕這筆訂單嗎？")){
                MsgSend(1,id);
                $.ajax({
                    url:"../PHP/API/API_OrderCheck.php",
                    type:"POST",
                    data:{
                        OrderID:id,
                        state:"reject"
                    },
                    success:(result)=>{
                        console.log(result);
                        if(window.location.href.match("OrderDetailPage.php")){
                            //window.location.href=document.referrer+"#CurOrderView";
                        }
                        //else window.location.reload();
                    },
                    error:(error)=>{
                        console.log(error,"In File OrderProcessor.js OrderCheckButtonSetting() API fail");
                    }
                });
            }           
        });
    });

    Array.from(completeBtn).forEach((btn)=>{
        let id=btn.id.substring(btn.id.lastIndexOf("ord-complete-btn-")+17,btn.id.length);



        btn.addEventListener("click",()=>{
            if(confirm("已經完成這筆訂單交易了嗎？")){
                $.ajax({
                    url:"../PHP/API/API_OrderCheck.php",
                    type:"POST",
                    data:{
                        OrderID:id,
                        state:"complete"
                    },
                    success:(result)=>{
                        if(result["result"]=="fullcomplete")MsgSend(3,id);
                        window.location.reload();
                    },
                    error:(error)=>{
                        console.log(error,"In File OrderProcessor.js OrderCheckButtonSetting() API fail");
                    }
                });
            }
        });
    });

    Array.from(terminateBtn).forEach((btn)=>{
        let id=btn.id.substring(btn.id.lastIndexOf("ord-terminate-btn-")+18,btn.id.length);

        btn.addEventListener("click",()=>{
            if(confirm("您確定要終止這筆訂單嗎？")){
                MsgSend(2,id);
                $.ajax({
                    url:"../PHP/API/API_OrderCheck.php",
                    type:"POST",
                    data:{
                        OrderID:id,
                        state:"terminate"
                    },
                    success:(data)=>{window.location.reload();},
                    error:(error)=>{
                        console.log(error,"In File OrderProcessor.js OrderCheckButtonSetting() API fail");
                    }
                });
            }           
        });
    });

}
