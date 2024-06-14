function addGoodsInCart(){
    let cart;

    let goods_id=window.location.href.substring(
                    window.location.href.indexOf("GoodsID=")+8,
                    window.location.href.length
                );

    let number=document.getElementById("order-number-input").value;
    let requirement=document.getElementById("order-require-input").value;
        

    if(cart=sessionStorage.getItem("Cart")){
        console.log(typeof(cart));
        cart=JSON.parse(cart);
        cart.push({GoodsID:goods_id,Number:number,Require:requirement});
        sessionStorage.setItem("Cart",JSON.stringify(cart));
    }
    else{
        sessionStorage.setItem("Cart",JSON.stringify([{GoodsID:goods_id,Number:number,Require:requirement}]));
    }
    
    location.reload();
}

function BookInfoBuild(GoodsID){
    $.ajax({
        type:"POST",
        url:"../PHP/API/API_GetGoodsINFO.php",
        data:{
            GoodsID:GoodsID
        },
        async: false,
        success:(data)=>{
            console.log(data);
            let Name=data["GoodsName"];
            let Price=data["GoodsPrice"];
            let Number=data["GoodsPrice"];
            let Description=data["GoodsDescription"];
            let ISBN=data["GoodsISBN"];
            let Seller=data["GoodsSeller"];

            document.getElementById("Book-Name-Block").innerHTML=Name;
            document.getElementById("Book-ISBN-Block").innerHTML="ISBN："+ISBN;
            document.getElementById("Book-Num-Block").innerHTML="剩餘數量："+Number;
            document.getElementById("Book-Price-Block").innerHTML="價格(單價)："+Price;
            document.getElementById("Book-Description-Block").innerHTML=Description;
           
            let orderBlock=document.getElementById("Order-Block");

            if(data["LoginState"]){
                document.getElementById("Book-UserID-Block").innerHTML="\
                    書籍持有者：<a href='UserPage.php?UserID="+
                    String(Seller)+
                    "'>"+
                    String(Seller)+
                    "</a>\
                ";
                if(Seller===data["LoginUserID"]){
                    orderBlock.innerHTML="<button id='Book-Order-Button'>這是您的商品</button>";
                }
                else{
                    orderBlock.innerHTML="\
                        <div id='button-number-block'>\
                            <input type='number' value=1 name='ord_number' id='order-number-input' min=1 max=100>\
                            <button id='Book-Order-Button' onclick=addGoodsInCart()>加入購物車</button>\
                        </div>\
                        \
                        <textarea id='order-require-input' placeholder='可以輸入最多100字的要求' maxlength='100'></textarea>\
                    ";        
                }
            }
            else{
                document.getElementById("Book-UserID-Block").innerHTML="\
                    書籍持有者：<a href='LoginPage.php'>"+Seller+"</a>\
                ";
                orderBlock.innerHTML="\
                    <a href='LoginPage.php' id='Book-Order-Button'>登入發送購買請求</a>\
                ";
            }
            
        },
        error:(error)=>{console.log(error,"In File BookPageProcessor.js BookInfoBuild(GoodsID,loginstate) API fail");}
    });
}