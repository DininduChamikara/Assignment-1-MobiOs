package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "validateNic", urlPatterns = {"/validateNic"})
public class validateNic extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nicNum = request.getParameter("nic");
        boolean validNic = false;
        boolean newId = false;

        int month[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        String sex;
        int year = 0;
        int y;  // variable to calculate the year
        int md = 0; // variable for calculate month and data
        int tempMd; // temporary do changes in variable md
        int mon = 0;  // variable for month
        int day;    // variable for date
        
        int currentYear = Calendar.getInstance().get(Calendar.YEAR); // to get current year
        int age;
        

        String birthdate;

        String errMsg = "";

        try {

            System.out.println(nicNum);

            if (nicNum.length() == 10 || nicNum.length() == 12) {
                validNic = true;
            } else {
                errMsg = "Invalid NIC number";
            }

            if (nicNum.length() == 12 && validNic == true) {
                newId = true;
            } else if (nicNum.length() == 10 && validNic == true) {
                newId = false;
            }

            if (newId == false && validNic == true) {

                y = Integer.parseInt(nicNum.toString().substring(0, 2));
                md = Integer.parseInt(nicNum.toString().substring(2, 5));

                year = 1900 + y;

            } else if (newId == true && validNic == true) {
                y = Integer.parseInt(nicNum.toString().substring(0, 4));
                md = Integer.parseInt(nicNum.toString().substring(4, 7));

                year = y;
            }

            if (md > 500) {
                md = md - 500;
                sex = "female";
            } else {
                sex = "male";
            }

            tempMd = md;
            // month
            for (int i = 0; i < 12; i++) {
                if (tempMd <= month[i]) {
                    mon = i + 1;
                    break;
                } else {
                    tempMd = tempMd - month[i];
                }
            }

            for (int i = 0; i < mon - 1; i++) {
                md = md - month[i];
            }
            day = md;

            birthdate = day + "/" + mon + "/" + year;
            age = currentYear - year;



            request.setAttribute("nicNumber", nicNum);
            request.setAttribute("birthdate", birthdate);
            request.setAttribute("age", age);
            request.setAttribute("sex", sex);
            request.setAttribute("errMsg", errMsg);
            
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

            

        } catch (Exception e) {
            System.out.println("The Error is : " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
