
<%@page import="com.learn.myshop.entities.Product"%>
<%@page import="com.learn.myshop.Dao.ProductDao"%>
<%@page import="com.learn.myshop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myshop.Dao.CategoryDao"%>
<%@page import="com.learn.myshop.helper.FactoryProvider"%>
<%@page import="com.learn.myshop.entities.User"%>

<%
User user1 = (User)session.getAttribute("current-user");

 CategoryDao ndao = new CategoryDao(FactoryProvider.getFactory());
 List<Category> nlist = ndao.getCategory();
%>

<nav class="navbar sticky-top  navbar-expand-lg navbar-dark  custom-bg " style="font-family: 'Poppins', sans-serif; width: 100%;">
    <div class="container">
        
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span> MyShop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
      </li>

      
     
      <li class="nav-item dropdown active">
        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Categories <span class="fa fa-sort-desc"></span>
        </a>
        <div class="dropdown-menu custom-bg2 text-white" aria-labelledby="navbarDropdown">
            <div class="container text-center ">
                <a href="index.jsp?category=all" class="list-group-item-action active custom-bg2 pr-4"><span class="fa fa-unsorted"></span> All Products :</a>
              
            </div>
              <div class="dropdown-divider"></div> 
             <%
                for (Category n : nlist) {
            %>
            <a class="dropdown-item custom-bg2" href="index.jsp?category=<%=n.getCategoryId()%>"><span class="fa fa-unsorted"></span> <%= n.getCategoryTitle() %><span>  :  </span> </a>
           <div class="dropdown-divider"></div> 
         
          <%
              }
          %>
          
        </div>
      </li>
      <!--Search Bar-->
      <form class="navbar-form navbar-center" action="">
          <div id="search1" class="container-fluid " style="margin-left: 2rem;">
              <div class="input-group shadow-lg  bg-white rounded ">
                  <input type="text" class="form-control" placeholder="Search" name="search">
                  <div class="input-group-btn " style="background:#fdd835;">
                      <button class="btn btn-default" type="submit" >
                          <span class="fa fa-search text-white"></span>
                      </button>
                  </div>
              </div>
          </div>
      </form>

    </ul>
      <ul class="navbar-nav ml-auto">
         
          <!--Cart Start-->
          <li class="nav-item active">
              
              <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 23px;"><span  class="bag_btn ml-1 cart-items ">0</span></i></a>
          </li>
          <!--Cart End-->
          <%
          if(user1==null)
          {
          %>
          
          <li class="nav-item active">
              <a class="nav-link" href="Login.jsp"><span class="fa fa-user-o"></span> Login</a>
          </li>
          <li class="nav-item active">
              <a class="nav-link" href="Register.jsp"><span class="fa fa-user-plus"></span> Register</a>
          </li>
          
          <%
          }
          else
          {
          %>
          
          <li class="nav-item active">
              <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"#" %>"><span class="fa fa-user-o"></span> <%= user1.getUserName()%></a>
          </li>
          <li class="nav-item active">
              <a class="nav-link" href="Logout"><span class="fa fa-user-plus"></span> Logout</a>
             
          </li>
          <%
          
          }
          %>


      </ul>
  </div>
    </div>
</nav>