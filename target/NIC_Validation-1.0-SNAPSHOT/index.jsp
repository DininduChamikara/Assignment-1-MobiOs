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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <style>
            h1{
                text-align: center;
            }

            .invisibleNic{
                display: none;
            }

            .register-container{
                border: 2px solid cyan;
                border-radius: 20px;
                margin: 30px;
                padding: 30px;
                display: block;
            }

            .register-container>form{
                border: 1px solid blue;
                padding: 20px;
                border-radius: 20px;
                margin-top: 20px;
/*                margin: 20px;*/
            }

        </style>
    </head>
    <%
        String error = "";
        String genaratedNic = "";
        String genaratedBirthDate = "";
        String genaratedAge = "";
        String genaratedGender = "";

        if (request.getAttribute("errMsg") != null) {
            error = request.getAttribute("errMsg").toString();
        }
        if (request.getAttribute("nicNumber") != null) {
            genaratedNic = request.getAttribute("nicNumber").toString();
        }
        if (request.getAttribute("birthdate") != null) {
            genaratedBirthDate = request.getAttribute("birthdate").toString();
        }
        if (request.getAttribute("age") != null) {
            genaratedAge = request.getAttribute("age").toString();
        }
        if (request.getAttribute("sex") != null) {
            genaratedGender = request.getAttribute("sex").toString();
        }
         
    %>


    <body>
        <h1>Register Form</h1>

        <div class="register-container">
            <a class="btn btn-primary" style="float:right" href="view.jsp">View All Users</a>
            <br><br>
            
            <!--NIC data validation-->
            <form action="validateNic" method="post">
                <div class="form-group">
                    <label for="nic">NIC number</label>
                    <input type="text" class="form-control" id="nic" name="nic" placeholder="Enter the NIC">
                    <small id="error" class="form-text text-muted"><%=error%></small>
                </div>
                <button type="submit" class="btn btn-primary">Try NIC</button>
            </form>
                
                
            <!--Form Data Field-->
            <form action="register" method="post">
                
                <input type="text" class="invisibleNic" name="invisibleNic" value="<%= request.getAttribute("nicNumber")%>" >
                
                <div class="form-group">
                    <label for="nic_num">NIC number</label>
                    <input type="text" class="form-control" name="nicNumber" disabled="true" value="<%=genaratedNic %>" >
                </div>
                
                <div class="form-group">
                    <label for="birthdate">Birth Date</label>
                    <input type="text" class="form-control" name="birthdate" disabled="true" value="<%=genaratedBirthDate %>" >
                </div>
                
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" class="form-control" name="age" disabled="true" value="<%=genaratedAge %>" >
                </div>
                
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <input type="text" class="form-control" name="gender" disabled="true" value="<%=genaratedGender %>" >
                </div>
                
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" class="form-control" name="fullname" placeholder="Enter full name" >
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" placeholder="Enter address" >
                </div>
                
                <div class="form-group">
                    <label for="nationality">Nationality</label>
                    <select class="form-control" name="nationality">
                        <option value="sinhala">Sinhala</option>
                        <option value="tamil">Tamil</option>
                        <option value="english">English</option>
                    </select>
                </div>
                <br><br>
                
                <button type="submit" class="btn btn-primary">Register</button>
            </form>

        </div>


    </body>
</html>
