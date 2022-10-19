<%

User user = (User)session.getAttribute("current-user");
if(user==null)
{
session.setAttribute("message", "You are not logged in !! Login first");
response.sendRedirect("Login.jsp");
return;
}


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/commen_css_js.jsp" %>
    </head>
    <body>
        <!--Navbar Start-->
        <%@include file="components/NavBar.jsp" %>
        <!--Navbar End-->
        
           <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--Cart details..........-->
                    <div class="card">
                        <div class="card-header custom-bg text-white">
                            <h1 class="text-center  ">Your Selected Items</h1>
                        </div>
                        <div class="card-body">

                            <div class="card-body1">


                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                     <!--form details........-->
                     <div class="card">
                        <div class="card-header custom-bg text-white">
                            <h1 class="text-center  ">Your details for order</h1>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <!--******************-->

                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <!--******************-->
                                <div class="form-group">
                                    <label for="name">Your contact</label>
                                    <input value="<%= user.getUserPhone()%>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your phone number">
                                </div>
                                <!--******************-->
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1" >Enter shipping address here</label>
                                    <textarea  placeholder="Eneter your address here....."  class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn custom-bg3 "> <span class="fa fa-bolt"></span> Order Now</button>
                                </div>
                            </form>

                           
                        </div>
                    </div>
                 </div>
             </div>
         </div>
         <%@include file="components/common_modals.jsp" %>
    </body>
</html>
