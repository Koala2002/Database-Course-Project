var cart=sessionStorage.getItem('Cart');
var CartSendingData={},goodsTotalNumber={},goodsMaxNumber={};
cart=JSON.parse(cart);
console.log(cart);

var totalbooks=0;
var allgoodstotalprice=0;

function CartListBuild(){
    let List=document.getElementById('Cart-List-Content');

    for(let id=0; id<cart.length; id++){
        $.ajax({
            type:"POST",
            url:"../PHP/API/API_GetGoodsINFO.php",
            data:{GoodsID:cart[id]["GoodsID"]},
            async: false,
            success:(data)=>{
                let item=document.createElement('tr');
            
                let Name,Price;
                let GoodsID=cart[id]["GoodsID"];
                let Require=cart[id]["Require"];
                let Number=cart[id]["Number"];
                
                goodsMaxNumber[cart[id]["GoodsID"]]=data["GoodsNumber"];
                if(!goodsTotalNumber[cart[id]["GoodsID"]])goodsTotalNumber[cart[id]["GoodsID"]]=0;
                if(!CartSendingData[data["GoodsSeller"]])CartSendingData[data["GoodsSeller"]]=[];
                
                goodsTotalNumber[cart[id]["GoodsID"]]+=parseInt(Number);
                CartSendingData[data["GoodsSeller"]].push(cart[id]);

                Name=data["GoodsName"];
                Price=data["GoodsPrice"];

                allgoodstotalprice+=parseInt(Price);
                totalbooks+=parseInt(Number);

                let delBtnBlock=document.createElement('td');
                let itemID=document.createElement('td');
                let itemName=document.createElement('td');
                let itemRequire=document.createElement('td');
                let itemPrice=document.createElement('td');
                let itemNumber=document.createElement('td');
                let itemTotalPrice=document.createElement('td');
                let editBtnBlock=document.createElement('td');
                
                delBtnBlock.setAttribute('class',"goods-del-btn-Block");
                itemID.setAttribute('class',"goods-id");
                itemName.setAttribute('class',"goods-name");
                itemRequire.setAttribute('class',"goods-require");
                itemPrice.setAttribute('class',"goods-price");
                itemNumber.setAttribute('class',"goods-number");
                itemTotalPrice.setAttribute('class',"goods-totalprice");
                editBtnBlock.setAttribute('class',"goods-edit-btn-Block");

            
                itemID.innerHTML=GoodsID;
                itemName.innerHTML=Name;
                itemRequire.innerHTML=Require;
                itemPrice.innerHTML=Price;
                itemNumber.innerHTML=Number;
                itemTotalPrice.innerHTML=parseInt(Price)*parseInt(Number);
                
                
                let delbtn=document.createElement("button");
                let editbtn=document.createElement("button");
                delbtn.innerHTML = "❎";
                editbtn.innerHTML = "✒️";

                delbtn.setAttribute("class","goods-del-btn");
                editbtn.setAttribute("class","goods-edit-btn");

                delbtn.addEventListener("click",()=>{
                    cart.splice(id,1);
                    if(cart.length){
                        sessionStorage.setItem("Cart",JSON.stringify(cart));
                        window.location.reload();
                    }
                    else{
                        sessionStorage.removeItem("Cart");                
                        while(sessionStorage.getItem("Cart"));

                        window.location.href="../index.php";
                    }
                });

                
                if(goodsTotalNumber[cart[id]["GoodsID"]]>goodsMaxNumber[cart[id]["GoodsID"]]){
                    itemID.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                    itemName.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                    itemRequire.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                    itemPrice.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                    itemNumber.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                    itemTotalPrice.setAttribute('style',"background-color:var(--CartItemWarningBackgroundColor);");
                }


                delBtnBlock.appendChild(delbtn);
                item.append(delBtnBlock);
                item.appendChild(itemID);
                item.appendChild(itemName);
                item.appendChild(itemRequire);
                item.appendChild(itemPrice);
                item.appendChild(itemNumber);
                item.appendChild(itemTotalPrice);
                editBtnBlock.appendChild(editbtn);
                item.appendChild(editBtnBlock);
                List.appendChild(item);
                
                
            },
            error:(error)=>{console.log(error,"In File CartPageProcessor.js CartListBuild() API fail");}    
        });
    }
}

function ClearCart(){
    sessionStorage.removeItem("Cart");                
    while(sessionStorage.getItem("Cart"));

    window.location.href="../index.php";
}

function OrderSend(){
    $.ajax({
        url:"../PHP/API/API_OrderSending.php",
        type: "POST",
        data:{
            Cart:CartSendingData,
            GoodsTotal:goodsTotalNumber,
            GoodsMaxNumber:goodsMaxNumber
        },
        success: (data)=>{
            console.log(data);
            Array.from(data["IdData"]).forEach((ID)=>{
                MsgSend(5,ID);
            });

            sessionStorage.removeItem("Cart");
    
            while(sessionStorage.getItem("Cart"));
            
            window.location.href="../../index.php";
        },
        error: (error)=>{console.log(error,"In File CartPageProcessor.js OrderSend() API fail");}
    });    
}

$(document).ready(()=>{
    document.getElementById("totalbooks").innerHTML+=parseInt(totalbooks);
    document.getElementById("allgoodstotalprice").innerHTML+=parseInt(allgoodstotalprice);
});