function add_to_cart(pid,pname,price)
{
    let cart = localStorage.getItem("cart");
//   We check First time cart empty or any cart empty
    if (cart == null)
    {
      let products=[];
      let product = {productId:pid, productName:pname, productQuantity:1, productPrice:price};
      products.push(product);
      localStorage.setItem("cart",JSON.stringify(products));
//        console.log("added successfully in cart.........");
        
      
    }
//Cart is Already Present
    else
    {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct)
        {
            //Only to we have to increse the quanty.......
            oldProduct.productQuantity = oldProduct.productQuantity+1;
            pcart.map((item)=>{
                if(item.productId == oldProduct.productId);
                {
                    item.productQuantity = oldProduct.productQuantity;
                    
                }
                
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("product quanty increesed....")

        } 
        else
        {
//           Only we have add product.......
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
//            console.log("product is added in the cart--");

        }
    }
    updateCart();
}
//Update Cart...................
function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart==null || cart.length==0)
    {
//        console.log("Cart is empty");
        $(".cart-items").html("0");
        $(".card-body1").html("<h3>Cart is empty!....</h3>");
        $(".checkout-btn").remove();
    }
    else
    {
        
       
      $(".cart-items").html(`${cart.length}`); 
      let table = `
      <table class='table'>
        <thead class='thead-light'>
        <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quntity</th>
        <th>Total Price</th>
        <th>Action</th>
        
          </tr>
        </thead>
       
        
        `;
         $(".checkout-btn").add();
        let totalPrice = 0;
        cart.map(item =>{
          table+=`
          <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity*item.productPrice}</td>
            <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
            
              </tr>


           `;
            totalPrice+=item.productPrice*item.productQuantity;
            
            
        });
        
        
        table = table + ` <tr><td colspan='5' class='text-center font-weight-bold'> Total Price : ${totalPrice}</td></tr> </table>`;
                            
        $(".card-body1").html(table);
        
         
    }
   
}

//Deleting cart product...........
function deleteItemFromCart(pid)
{
   let cart = JSON.parse(localStorage.getItem('cart')); 
   let newcart = cart.filter((item)=>item.productId!=pid);
   
   localStorage.setItem('cart',JSON.stringify(newcart));
    updateCart();
   
}
$(document).ready(function (){
    updateCart();
     
});