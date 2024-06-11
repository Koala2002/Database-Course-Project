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