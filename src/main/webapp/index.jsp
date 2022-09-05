<%-- 
    Document   : index
    Created on : 02-Sep-2022, 12:23:28
    Author     : acer
--%>

<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>

        <style>
            h1{
                text-align: center;
            }
            
            .invisibleNic{
                display: none;
            }
            
            .register-container{
                background: cyan;
                border-radius: 20px;
                margin: 30px;
                padding: 30px;
            }

        </style>
    </head>


    <body>
        <h1>Register Form</h1>

        <div class="register-container">

            <form action="validateNic" method="post">
                <label for="nic">NIC Number</label>
                <br><input type="text" name="nic" placeholder="Enter NIC">

                <input type="submit" value="Try NIC">

            </form>

            <form class="register-form" action="register" method="post">
                <div>

                    <br>
                    <span class="error" id="error-space">*<%= request.getAttribute("errMsg")%></span><br>
                    <br><input type="text" class="invisibleNic" name="invisibleNic" value=<%= request.getAttribute("nicNumber")%> ><br> 
                    
                    <label for="nic_num">NIC number</label>
                    <br><input type="text" name="nicNumber" value=<%= request.getAttribute("nicNumber")%> disabled="true" ><br>  
                    
                    <label for="birthdate">Birth Date</label>
                    <br><input type="text" name="birthdate" value=<%= request.getAttribute("birthdate")%> disabled="true"><br>      
                    <label for="age">Age</label>
                    <br><input type="number" name="age" placeholder=<%= request.getAttribute("age")%> disabled="true"><br>  
                    <label for="gender">Gender</label>
                    <br><input type="text" name="gender" placeholder=<%= request.getAttribute("sex")%> disabled="true"><br><br>

                    <label for="fullname">Full Name</label>
                    <br><input type="text" name="fullname" placeholder="Enter Full Name"><br>

                    <label for="address">Address</label>
                    <br><input type="text" name="address" placeholder="Enter Address"><br>

                    <label for="nationality">Nationality</label>
                    <br>
                    <select name="nationality">
                        <option value="sinhala">Sinhala</option>
                        <option value="tamil">Tamil</option>
                        <option value="english">English</option>
                    </select><br><br><br>

                    <input type="submit" value="Register">
                </div>
            </form>

        </div>


    </body>
</html>
