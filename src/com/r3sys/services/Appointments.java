package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.r3sys.db.ConnectDb;
import com.r3sys.db.User; // Ensure you import the User class if needed

public class Appointments extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Appointments() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        /*if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.html");
            return;
        }*/
        try {
            //User user = (User) session.getAttribute("user");
            String id = request.getParameter("id");
            String empId = request.getParameter("empId");
            String userId = User.getId();
            String name = User.getName();
            String designation = User.getDesignation();
            String department = User.getDepartment();
            String companyName = User.getCompanyName();
            String contact = User.getContact();
            String address = User.getAddress();
       
            String purpose = request.getParameter("purpose");
            String description = request.getParameter("description");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String email = request.getParameter("email");
            String status = "Pending";

            Connection con = ConnectDb.dbCon();
            String sql = "INSERT INTO appointment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, empId);
            ps.setString(3, userId);
            ps.setString(4, name);
            ps.setString(5, designation);
            ps.setString(6, department);
            ps.setString(7, companyName);
            ps.setString(8, contact);
            ps.setString(9, address);
            ps.setString(10, purpose);
            ps.setString(11, description);
            ps.setString(12, date);
            ps.setString(13, time);
            ps.setString(14, email);
            ps.setString(15, status);
            int i = ps.executeUpdate();
            if (i > 0) {
                userId = User.getId();
                name = User.getName();
                designation = User.getDesignation();
                department = User.getDepartment();
                companyName = User.getCompanyName();
                contact = User.getContact();
                address = User.getAddress();
                response.sendRedirect("UserDashboard.html");
            } else {
                response.sendRedirect("index.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
