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

/**
 * Servlet implementation class EmployeeLogin
 */
public class EmployeeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLogin() {
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
			PreparedStatement ps=con.prepareStatement("select * from employee where email=? and password=? ");
			ps.setString(1, email);
			ps.setString(2, password);  
			ResultSet rs=ps.executeQuery(); 
			if(rs.next())
			{ 
				int id=rs.getInt(1);
				Employee.setEmpId(id);
				response.sendRedirect("EmployeeDashboard.html"); 
				
			}
			else
			{
				response.sendRedirect("index.html");
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	}


