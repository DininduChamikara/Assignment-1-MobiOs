
package Controller;

import Utilities.DBconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        
        
        String nicNumber = request.getParameter("invisibleNic");
        
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String nationality = request.getParameter("nationality");
        
        try{
            
            Connection con;
            con = DBconnection.createConnection();

            String sql = "INSERT INTO nic_register.users(nic, fullname, address, nationality) VALUES(?,?,?,?)";
             
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, nicNumber);
            ps.setString(2, fullname);
            ps.setString(3, address);
            ps.setString(4, nationality);
            
            ps.executeUpdate();
            
            RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
            rd.forward(request, response);
            
        }catch(Exception e){
            System.out.println("The Error is : " + e.getMessage());
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
