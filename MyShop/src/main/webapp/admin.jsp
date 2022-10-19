<%@page import="java.util.Map"%>
<%@page import="com.learn.myshop.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myshop.entities.Category"%>
<%@page import="com.learn.myshop.helper.FactoryProvider"%>
<%@page import="com.learn.myshop.Dao.CategoryDao"%>
<%@page import="com.learn.myshop.entities.User"%>
<%
User user = (User)session.getAttribute("current-user");
if(user==null)
{
session.setAttribute("message", "You are not logged in !! Login first");
response.sendRedirect("Login.jsp");
return;
}
else{

if(user.getUserType().equals("normal"))
{
session.setAttribute("message", "You are not Admin ! Do not access this page");
response.sendRedirect("Login.jsp");
return;
}

}


%>
<%     CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
       List<Category> list = cdao.getCategory();
       //geting count...
       Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        
        <%@include file="components/commen_css_js.jsp" %>
    </head>
    <body style="background: #11998e; 
background: -webkit-linear-gradient(to right, #38ef7d, #11998e); 
background: linear-gradient(to right, #38ef7d, #11998e)!important;">

        <%@include file="components/NavBar.jsp" %>
        <div class="container admin">
            <div class="container-fluid">
                <!--We Add message Class For show the success message for Add Category..-->
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-5 text-center">
                <!--First Colum-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body ">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/customer.png" alt="customer">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h4 class="text-uppercase text-muted">User</h4>
                        </div>
                    </div>

                </div>
                <!--Second Colum-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/list.png" alt="customer">
                            </div>
                            <h1><%= list.size()%></h1>
                            <h4 class="text-uppercase text-muted">Categories</h4>
                        </div>
                    </div>

                </div>
                <!--Third Colum-->
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/shopping.png" alt="customer">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h4 class="text-uppercase text-muted">Products</h4>
                        </div>
                    </div>

                </div>
            </div>
            <!--Second Row-->
            <div class="row mt-3">
                <div class="col-md-4" data-toggle="modal" data-target="#add_category_modal">
                    <!--card one-->
                    <div class="card">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/plus.png" alt="customer">
                            </div>
                            <p>Click here to Add..</p>
                            <h4 class="text-uppercase text-muted">Add Categories</h4>
                        </div>
                    </div>
                </div>
                <!--Card two-->
                <div class="col-md-4">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/products.png" alt="customer">
                            </div>
                            <p>Click here new Products</p>
                            <h4 class="text-uppercase text-muted">Add Products</h4>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
        <!--Add Category modal Start-->
        
        <div class="modal fade" id="add_category_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg text-center text-white">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details...</h5>
                        <button type="button" class="close active" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-white ">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOpreationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group"></div>
                            <input required type="text" class="form-control" name="catTitle" placeholder="Title :">
                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control mt-2" required placeholder="Enter the category description :" name="catDescription"></textarea>
                            </div>
                            <div class="container">
                                <button class="btn custom-bg text-center text-white"><span class="fa fa-plus"></span> Add</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn custom-bg text-white" data-dismiss="modal"><span class="fa fa-times-circle"></span> Close</button>
                        
                    </div>
                </div>
            </div>
        </div>

        <!--End Category Modal-->
        <!--*******************************-->
        <!--Start Add Product Modal-->
        
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title " id="exampleModalLabel">Add product details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-white">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                      <!--Start Form-->
                      <form action="ProductOpreationServlet" method="post" enctype="multipart/form-data">
                          <input type="hidden"name="operation" value="addproduct">
                          <!--product Name-->
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Enter the name of product :" required name="pName">
                          </div>
                          <!--price-->
                          <div class="form-group">
                              <input type="number" class="form-control" placeholder="Enter the product price :" required name="pPrice">
                          </div>
                          <!--Product discount-->
                          <div class="form-group">
                              <input type="number" class="form-control" placeholder="Enter the product discount :" name="pDiscount">
                          </div>
                          <!--product quantity-->
                          <div class="form-group">
                              <input type="number" class="form-control" placeholder="Enter the product quantity :" required name="pQuantity">
                          </div>
                          <!--product category-->
                         
                          <div class="form-group">
                              <select name="catId" class="form-control">
                                  <option  disabled selected>--Categories--</option>
                                  
                                  <%
                                  for(Category c:list)
                                  {
                                  %>
                                  <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                  <%
                                      }
                                  %>
                                  
                              </select>
                           </div>
                          <!--product file-->
                          <div class="form-group">
                               <label for="pPic">Select picture of product :</label>
                               <br>
                               <input type="file" id="pPic" name="pPic" required > 
                          </div>
                          
                          <!--product description-->
                          <div class="form-group">
                             
                              <textarea style="height: 150px" class="form-control" placeholder="Enter the product Description :" required name="pDesc"></textarea>
                          </div>
                          <!--Submit Button-->
                          <div class="container text-center">
                              
                              <button class="btn custom-bg text-white"><span class="fa fa-plus"></span> Add</button>  
                              <button type="button" class="btn custom-bg text-white" data-dismiss="modal"><span class="fa fa-times-circle"></span> Close</button>
                          </div>
                      </form>
                      
                      <!--End Form-->
                    </div>
                   
                </div>
            </div>
        </div>
        <!--End Add Product Modal-->
    </body>
</html>
