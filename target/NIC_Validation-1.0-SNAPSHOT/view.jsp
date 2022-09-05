<%-- 
    Document   : view
    Created on : 04-Sep-2022, 11:06:04
    Author     : acer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utilities.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <%
            ResultSet resultSet = null;
            Connection con = null;
            List<User> userDetails = null;
            ArrayList arrList = new ArrayList<User>();

            try {
                con = DBconnection.createConnection();
                System.out.println("Succecssfully connected from view.jsp");

                Statement stmt = con.createStatement();

                String sql = "SELECT * FROM nic_register.users";
                resultSet = stmt.executeQuery(sql);


            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>
    </head>


    <body>
        <h1>Users Details</h1>


        <a class="btn btn-primary" style="float:right" href="index.jsp">Add New User</a>
        <br>
        <br>
        <br>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>NIC</th>
                    <th>Address</th>
                    <th>Nationality</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <%
//                    while (resultSet.next()) {
                    while (resultSet.next()) {


                %>
                <tr>
                    <td><%=resultSet.getString("id")%></td>
                    <td><%=resultSet.getString("fullname")%></td>
                    <td><%=resultSet.getString("nic")%></td>
                    <td><%=resultSet.getString("address")%></td>
                    <td><%=resultSet.getString("nationality")%></td>

                    <td><a class="btn btn-info" href="editUser.jsp?id=<%=resultSet.getString("id")%>">Edit</a>&nbsp;&nbsp; <a class="btn btn-danger" href="deleteUser?id=<%=resultSet.getString("id")%>" >Delete</a></td>

                </tr>
                <%
                    }
                    con.close();
                %>
            </tbody>


        </table>

    </body>
</html>
