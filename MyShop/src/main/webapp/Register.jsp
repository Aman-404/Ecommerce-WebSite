<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
         <script src="https://kit.fontawesome.com/a81368914c.js"></script>
         
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
       
        <img class="wave" src="img/wave2.png">
        <div class="container">
            
            <div class="img">
                <img src="img/p2.svg">
            </div>
            <div class="login-content container" >
                <form action="Register" method="post">
                    <img class="avatar" src="img/p1.png">
                    
                    <h2 class="title">sign up </h2>
                   
                    <%@include file="components/message.jsp" %>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>User name :</h5>
                            <input type="text" class="input" name="user_name" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="far fa-envelope"></i>
                        </div>
                        <div class="div">
                            <h5>Email :</h5>
                            <input type="email" class="input" name="user_email" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password :</h5>
                            <input type="password" class="input" name="user_password" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="div">
                            <h5>Phone :</h5>
                            <input type="number" class="input" name="user_phone" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="far fa-address-card"></i>
                        </div>
                        <div class="div">
                            <h5>Address :</h5>
                            <input type="text" class="input" name="user_address" required>
                        </div>
                    </div>
                   
                    <input type="submit" class="btn" value="Submit">
                </form>
            </div>
        </div>
        <script src="js/app2.js"></script>
    </body>
</html>
