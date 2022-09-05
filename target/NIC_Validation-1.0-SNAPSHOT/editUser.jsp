<%-- 
    Document   : editUser
    Created on : 04-Sep-2022, 17:36:03
    Author     : acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Utilities.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
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
                margin: 20px;
            }

        </style>

        <%

            ResultSet resultSet = null;
            Connection con = null;

            String retrivedNic = "";
            String retrivedFullname = "";
            String retrivedAddress = "";
            String retrivedNationality = "";

            String id = "";

            try {
                con = DBconnection.createConnection();

                Statement stmt = con.createStatement();

                String sql = "SELECT * FROM nic_register.users WHERE id='" + request.getParameter("id") + "';";

                resultSet = stmt.executeQuery(sql);

                resultSet.next();

                System.out.println(resultSet.getString(1));
                System.out.println(resultSet.getString(2));

                retrivedNic = resultSet.getString(2);
                retrivedFullname = resultSet.getString(3);
                retrivedAddress = resultSet.getString(4);
                retrivedNationality = resultSet.getString(5);

                id = request.getParameter("id");
                
                System.out.println("Full name is " + resultSet.getString(3));
                System.out.println("Full name is " + retrivedFullname );

            } catch (Exception e) {
                System.out.println("the error is " + e.getMessage());
            }
            finally{
                con.close();
            }

        %>
    </head>

    <%  
        String error = "";
        String genaratedNic = "";
        String genaratedBirthDate = "";
        String genaratedAge = "";
        String genaratedGender = "";
        
        String invisibleNic = "";

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
        
        if(genaratedNic==""){
            invisibleNic = retrivedNic;
        }else{
            invisibleNic = genaratedNic;
        }
        
    %>

    <body>
        <h1>Edit User</h1>


        <div class="register-container">

            <!--NIC data validation-->
            <form action="editValidateNic?id=<%=id%>" method="post">
                <div class="form-group">
                    <label for="nic">NIC number</label>
                    <input type="text" class="form-control" name="nic" placeholder="Enter the NIC" value="<%=retrivedNic%>" >
                    <small id="error" class="form-text text-muted"><%=error%></small>
                </div>
                <button type="submit" class="btn btn-primary">Try NIC</button>
            </form>


            <!--Form Data Field-->
            <form action="editUser?id=<%=id%>" method="post">

                <input type="text" class="invisibleNic" name="invisibleNic" value="<%=invisibleNic %>" >

                <div class="form-group">
                    <label for="nic_num">NIC number</label>
                    <input type="text" class="form-control" name="nicNumber" disabled="true" value="<%=genaratedNic %>">
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
                    <input type="text" class="form-control" name="fullname" placeholder="Enter full name" value="<%=retrivedFullname %>" >
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" placeholder="Enter address" value="<%=retrivedAddress %>" >
                </div>

                <div class="form-group">
                    <label for="nationality">Nationality</label>
                    <select class="form-control" name="nationality" value="<%=retrivedNationality %>">
                        <option value="sinhala">Sinhala</option>
                        <option value="tamil">Tamil</option>
                        <option value="english">English</option>
                    </select>
                </div>
                <br><br>

                <button type="submit" class="btn btn-primary">Update</button>
            </form>

        </div>

    </body>
</html>
