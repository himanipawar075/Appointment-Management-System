package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.r3sys.db.ConnectDb;
import com.r3sys.db.Employee;
import com.r3sys.db.User;

/**
 * Servlet implementation class EmployeeChangePassword
 */
public class EmployeeChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeChangePassword() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        

        // Debugging: Print parameters
        
        try {
        	String email = request.getParameter("email");
            String password = request.getParameter("password");
            String npassword = request.getParameter("npassword");
            
            Connection con = ConnectDb.dbCon();
            PreparedStatement ps = con.prepareStatement("update employee set password = ? where email = ? and password = ?");
            ps.setString(1, npassword);
            ps.setString(2, email);
            ps.setString(3, password);

            int i = ps.executeUpdate();

            if (i > 0) {
            	email=Employee.getEmail();
                response.sendRedirect("EmployeeLogin.html");
            } else {
                response.sendRedirect("index.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Optionally redirect to an error page
        }
    }
}
