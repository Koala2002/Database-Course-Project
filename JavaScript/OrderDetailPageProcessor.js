function OrderDetailBuild(ID){
    console.log(ID);
    let List=document.getElementById('Cart-List-Content');

    $.ajax({
        url:"../PHP/API/API_GetOrderDetail.php",
        type:"POST",
        data:{OrderID:ID},
        success:(data)=>{
            data["detail"].forEach((detail)=>{
                let item=document.createElement('tr');
                let Name,Price;
                let GoodsID=detail["goods_id"];
                let Require=detail["description"];
                let Number=detail["ord_quantity"];

                $.ajax({
                    type:"POST",
                    url:"../PHP/API/API_GetGoodsINFO.php",
                    data:{GoodsID:GoodsID},
                    async: false,
                    success:(data)=>{
                        Name=data["GoodsName"];
                        Price=data["GoodsPrice"];
                    },
                    error:(error)=>{console.log(error,"In File OrderDetailPageProcessor.js OrderDetailBuild(ID) API fail");}
                });

                let itemID=document.createElement('td');
                let itemName=document.createElement('td');
                let itemRequire=document.createElement('td');
                let itemPrice=document.createElement('td');
                let itemNumber=document.createElement('td');
                let itemTotalPrice=document.createElement('td');
                
                itemID.setAttribute('class',"goods-id");
                itemName.setAttribute('class',"goods-name");
                itemRequire.setAttribute('class',"goods-require");
                itemPrice.setAttribute('class',"goods-price");
                itemNumber.setAttribute('class',"goods-number");
                itemTotalPrice.setAttribute('class',"goods-totalprice");
               
        
                itemID.innerHTML=GoodsID;
                itemName.innerHTML=Name;
                itemRequire.innerHTML=Require;
                itemPrice.innerHTML=Price;
                itemNumber.innerHTML=Number;
                itemTotalPrice.innerHTML=parseInt(Price)*parseInt(Number);
             
         
                item.appendChild(itemID);
                item.appendChild(itemName);
                item.appendChild(itemRequire);
                item.appendChild(itemPrice);
                item.appendChild(itemNumber);
                item.appendChild(itemTotalPrice);
                List.appendChild(item);
            });
        },
        error:(error)=>{console.log(error,"In File OrderDetailPageProcessor.js OrderDetailBuild(ID) API fail");}
    });
}