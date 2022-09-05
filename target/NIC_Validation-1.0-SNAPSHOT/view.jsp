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
        
        <style>
            h1{
                text-align: center;
                color: blue;
            }

            .view-container{
                border: 2px solid cyan;
                border-radius: 20px;
                margin: 30px;
                padding: 30px;
                display: block;
            }

        </style>

        <%
            ResultSet resultSet = null;
            Connection con = null;
            ArrayList<User> userArr = new ArrayList<User>();

            try {
                con = DBconnection.createConnection();
                System.out.println("Succecssfully connected from view.jsp");

                Statement stmt = con.createStatement();

                String sql = "SELECT * FROM nic_register.users";
                resultSet = stmt.executeQuery(sql);
                
                while(resultSet.next()){
                    User u = new User();
                    u.setId(resultSet.getString("id"));
                    u.setFullname(resultSet.getString("fullname"));
                    u.setNic(resultSet.getString("nic"));
                    u.setAddress(resultSet.getString("address"));
                    u.setNationality(resultSet.getString("nationality"));
    
                    userArr.add(u);
                    System.out.println("Added to the list successfully");
                }  

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            finally {
                con.close();
            }
        %>
    </head>


    <body>
        <h1>Users Details</h1>

        <div class="view-container">
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
                        System.out.println("userArr data " + userArr.get(1).getFullname());
                        System.out.println("userArr size " + userArr.size());
                        
                        for(int i=0; i<userArr.size(); i++){
                            System.out.println(userArr.get(i).getFullname());
                    %>
                    <tr>
                        <td><%= userArr.get(i).getId() %></td>
                        <td><%= userArr.get(i).getFullname() %></td>
                        <td><%= userArr.get(i).getNic() %></td>
                        <td><%= userArr.get(i).getAddress() %></td>
                        <td><%= userArr.get(i).getNationality() %></td>

                        <td><a class="btn btn-info" href="editUser.jsp?id=<%= userArr.get(i).getId() %>">Edit</a>&nbsp;&nbsp; <a class="btn btn-danger" href="deleteUser?id=<%= userArr.get(i).getId() %>" >Delete</a></td>

                    </tr>
                    <%
                        }
                    %>
                </tbody>


            </table>
        </div>

    </body>
</html>
