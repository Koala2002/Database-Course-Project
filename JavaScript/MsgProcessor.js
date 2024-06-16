function MsgSend(type,ID,ExtraData){
    let API_Data;
    
    if(
        type==1||
        type==2||
        type==3||
        type==5||
        type==6
    ){
        API_Data={
            MailType:type,
            ItemID:ID
        }
    }

    if(type==4){
        API_Data={
            MailType:type,
            ItemID:ID,
            UserMsg:ExtraData["UserMsg"]
        }
    }

    if(type==7){
        API_Data={
            MailType:type,
            ItemID:ID,
            SystemTerminateUserID:ExtraData["SystemTerminateUserID"]
        }
    }
    
    if(type==8){
        API_Data={
            MailType:type,
            ItemID:ID,
            GoodsUploadUserID:ExtraData["GoodsUploadUserID"],
            GoodsUploadSenderID:ExtraData["GoodsUploadSenderID"]
        }
    }

    $.ajax({
        url:"../PHP/API/API_MsgSend.php",
        type:"POST",
        data:API_Data,
        success:(result)=>{
            console.log(result);
        },
        error:(error)=>{
            console.log(error,"In File MsgProcessor.js MsgSend(type,ID,ExtraData) API fail");
        }
    });
}