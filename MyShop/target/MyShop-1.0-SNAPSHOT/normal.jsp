
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

if(user.getUserType().equals("admin"))
{
session.setAttribute("message", "You are not User ! Do not access this page");
response.sendRedirect("Login.jsp");
return;
}

}


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <%@include file="components/commen_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/NavBar.jsp" %>
       
    </body>
</html>
