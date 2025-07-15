package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.ConnectDb;
import com.r3sys.db.GetterSetterEmail;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegister() {
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
			int id = 0;
			String name = request.getParameter("name");
			String designation = request.getParameter("designation");
			String department = request.getParameter("department");
			String companyName = request.getParameter("companyName");
			String contact = request.getParameter("contact");
			String address = request.getParameter("address");
			String email= request.getParameter("email");
			String password = request.getParameter("password");
			
			Connection con = ConnectDb.dbCon();
			
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, designation);
			ps.setString(4, department);
			ps.setString(5, companyName);
			ps.setString(6, contact);
			ps.setString(7, address);
			ps.setString(8, email);
			ps.setString(9, password);
		
		    int i=ps.executeUpdate();
		    if(i>0)
		    {
		    	GetterSetterEmail.setEmail(email);
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


