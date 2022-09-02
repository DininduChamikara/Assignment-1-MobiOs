<%-- 
    Document   : index
    Created on : 02-Sep-2022, 12:23:28
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
    </head>
    <body>
        <h1>Register Form</h1>
        
        <div class="register-container">
            <form action="register" method="post">
                First Name : <input type="text" name="fname" placeholder="Enter First Name"><br><br>
                Last Name  : <input type="text" name="lname" placeholder="Enter Last Name"><br><br>
                <input type="submit" value="Register">
            </form>
        </div>
    </body>
</html>
