
<%@page import="com.learn.myshop.helper.Helper"%>
<%@page import="com.learn.myshop.Dao.CategoryDao"%>
<%@page import="com.learn.myshop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myshop.entities.Product"%>
<%@page import="com.learn.myshop.helper.FactoryProvider"%>
<%@page import="com.learn.myshop.Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Shop</title>
        
       
        <%@include file="components/commen_css_js.jsp" %>
         </head>
    <body>
        <!--Navbar Start-->
        <%@include file="components/NavBar.jsp" %>
        <!--Navbar End-->
        <!--Carousel Start-->
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="img/B1.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="img/B2.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="img/B3.jpg" alt="Third slide">
                </div>
            </div>
           
        </div>
        
        <!--Carousel End-->
        <br>
        <%    
            String cat = request.getParameter("category");
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = dao.getAllProduct();

           try {
                    //Filter the products by its category Start.........
            if(cat==null || cat.trim().equals("all")) {
                list = dao.getAllProduct();
                

            }
            else {
                list = dao.getAllProductById(Integer.parseInt(cat.trim()));

            }
               } catch (Exception e) {
               e.printStackTrace();
               }
               //Filter thr Products by its category End.............

        %>
            <!--  Show products Start-->
            <div class="row row-cols-2 row-cols-md-4 pl-3 pr-3">

                <%                      for (Product p : list) {
                %>
                <div class="col mb-4">
                    <div class="card h-100  product-cart" style="border: none">
                        <div class="container text-center">
                            <img src="img/product/<%= p.getpPhoto()%>" class="card-img-top m-2" style="max-height: 250px; max-width: 100%; width: auto;" alt="...">

                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title" ><%=p.getpName()%></h5>
                             <div class="dropdown-divider"></div> 
                            <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                        </div> 

                        <div class="container text-center">
                            <a class="btn custom-bg2 text-white" onclick="add_to_cart(<%=p.getPid()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplingDiscount()%>)"><span class="fa fa-shopping-cart " ></span> Add to Cart</a> 
                            <h5 style="color: coral">&#8377; <%=p.getPriceAfterApplingDiscount()%>/- <span class="discount-lable">&#8377;<%= p.getpPrice()%></span> <span class="discount-lable2" style="color:#4caf50!important;"><%=p.getpDiscount() %>% off</span></h5>
                        </div>

                    </div>
                </div>

                <%
                    }

                  
                   
                %>  
                <%
                
                if (list.size() == 0) {
                %>
                <div class="container fluid text-center">
                    <img src="img/412986.svg" alt="img">
                    <h1 style="color: red; font-size: 36px; display: inline">Nothing is found  !</h1>
                </div>
                <%
                    }
                %>
            </div>



    </div>       
    <!--Show products End-->
    <%@include file="components/common_modals.jsp" %>

</body>
</html>
