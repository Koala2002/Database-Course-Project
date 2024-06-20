var ID=null,UID=null;
var ChatBlock=null;

function resetChatBlock(){
    $.ajax({
        url:"../PHP/API/API_GetChatData.php",
        type:"POST",
        async:false,
        data:{
            OrderID:ID
        },
        success:(data)=>{
            ChatBlock.innerHTML="";

            Array.from(data["ChatData"]).forEach((ele,idx)=>{
                let ChatItemContainer=document.createElement("div");
                ChatItemContainer.className="chat-item-container";
                ChatItemContainer.id="chat-item-container-"+idx;

                let ChatItem=document.createElement("div");
                ChatItem.className="chat-item";
                ChatItem.innerHTML=ele["msg_msg"];

                ChatItemContainer.appendChild(ChatItem);

                if(ele["sender_id"]==UID){
                    ChatItem.style.backgroundColor="var(--ChatRightUserBackgroundColor)";
                    ChatItemContainer.style.justifyContent= "right";
                }
                else{
                    ChatItem.style.backgroundColor="var(--ChatLeftUserBackgroundColor)";
                    ChatItemContainer.style.justifyContent = "left";
                }

                ChatBlock.appendChild(ChatItemContainer);
            });

            
            console.log("chat reset");
        },
        error:(error)=>{
            console.log(error,"In File ChatSystemProcessor.js GetChatData(OrdID) API fail");
        }
    }); 
}

function GetChatData(OrdID,UserID) {
    ID=OrdID;
    UID=UserID;
    ChatBlock=document.getElementById("chat-Block");
    
    resetChatBlock();
    setInterval(resetChatBlock,500);
    ChatBlock.scrollTop = ChatBlock.scrollHeight;
}

window.onload = ()=>{
    let ChatMsgInput=document.getElementById("chat-input-Block");
    if(!ChatMsgInput)return;
    let preKey=null;
    ChatMsgInput.addEventListener("keydown",(event)=>{
        if(event.key=="Enter"&&preKey!="Shift"){
            console.log(ChatMsgInput.value);
            let Msg=ChatMsgInput.value.trim();
           
            if(Msg==""){
                ChatMsgInput.value='';
                ChatMsgInput.value=ChatMsgInput.value.trim();
                return
            }
            ChatMsgInput.value='';
            ChatMsgInput.value=ChatMsgInput.value.trim();
            console.log("TEST");
            $.ajax({
                url:"../PHP/API/API_MsgSend.php",
                type:"POST",
                data:{
                    ItemID:ID,
                    UserMsg:Msg,
                    MailType:7
                },
                success:(result)=>{
                    console.log(result);
                    resetChatBlock();
                    ChatBlock.scrollTop = ChatBlock.scrollHeight;
                },
                error:(error)=>{
                    console.log(error,"In File ChatSystemProcessor.js ChatMsgInput.keydown API fail");
                }
            });
        }

        preKey=event.key;
    });
};