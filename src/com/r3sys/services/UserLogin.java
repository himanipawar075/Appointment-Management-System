package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.ConnectDb;
import com.r3sys.db.Employee;
import com.r3sys.db.GetterSetterEmail;
import com.r3sys.db.User;

/**
 * Servlet implementation class UserLogin
 */
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try  
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Connection con = ConnectDb.dbCon();
			PreparedStatement ps=con.prepareStatement("select * from user where email=? and password=? ");
			ps.setString(1, email);
			ps.setString(2, password);  
			ResultSet rs=ps.executeQuery(); 
			if(rs.next())
			{ 
				int id=rs.getInt(1);
				User.setUserId(id);
				GetterSetterEmail.setEmail(email);
				GetterSetterEmail.setPassword(password);
				User.setId(rs.getString("id"));
				User.setName(rs.getString("name"));
				User.setDesignation(rs.getString("designation"));
				User.setDepartment(rs.getString("department"));
				User.setCompanyName(rs.getString("companyName"));
				User.setContact(rs.getString("contact"));
				User.setAddress(rs.getString("address"));
				
				
				response.sendRedirect("UserDashboard.html"); 
			
			}
			else
			{
				response.sendRedirect("error.html");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}


	}


