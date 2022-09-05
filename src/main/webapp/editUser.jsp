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

        <style>
            h1{
                text-align: center;
            }

            .invisibleNic{
                display: none;
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
                
                System.out.println("Id is ---- " + id);

            } catch (Exception e) {
                System.out.println("the error is " + e.getMessage());
            }

        %>
    </head>
    <body>
        <h1>Edit User</h1>

        <div class="register-container">

            <form action="editValidateNic?id=<%=id %>" method="post">
                <label for="nic">NIC Number</label>
                <br><input type="text" name="nic" placeholder="Enter NIC" value=<%=retrivedNic%> >

                <input type="submit" value="Try NIC">

            </form>

                <form class="edit-form" action="editUser?id=<%=id %>" method="post">
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
                    <br><input type="text" name="fullname" placeholder="Enter Full Name" value=<%=retrivedFullname%>><br>

                    <label for="address">Address</label>
                    <br><input type="text" name="address" placeholder="Enter Address" value=<%=retrivedAddress%>><br>

                    <label for="nationality">Nationality</label>
                    <br>
                    <select name="nationality" value=<%=retrivedNationality%>>
                        <option value="sinhala">Sinhala</option>
                        <option value="tamil">Tamil</option>
                        <option value="english">English</option>
                    </select><br><br><br>

                    <input type="submit" value="Update">
                </div>
            </form>

        </div>
    </body>
</html>
