<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
         <script src="https://kit.fontawesome.com/a81368914c.js"></script>
          <link rel="stylesheet" type="text/css" href="css/style2.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
      
       
        <img class="wave" src="img/wave2.png">
        <div class="container">
            
            <div class="img">
                <img src="img/p2.svg">
            </div>
            <div class="login-content container" >
                <form action="Login" method="post">
                    <img class="avatar" src="img/p1.png">
                    
                    <h2 class="title">Login</h2>
                   
                    <%@include file="components/message.jsp" %>
                    
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="far fa-envelope"></i>
                        </div>
                        <div class="div">
                            <h5>Email :</h5>
                            <input type="email" class="input" name="email" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password :</h5>
                            <input type="password" class="input" name="password" required>
                        </div>
                    </div>
                    <div class="div" style="padding-right:150px;">
                        <a href="Register.jsp">create new account ?</a>
                    </div>
                    <input type="submit" class="btn" value="Submit">

                </form>
                
            </div>
        </div>
        <script src="js/app2.js"></script>
    </body>
</html>
