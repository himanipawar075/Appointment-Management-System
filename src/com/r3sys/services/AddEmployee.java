package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.ConnectDb;
//import com.r3sys.db.Employee;
import com.r3sys.db.Employee;

/**
 * Servlet implementation class AddEmployee
 */
public class AddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployee() {
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
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String designation = request.getParameter("designation");
			String department = request.getParameter("department");
			String contact = request.getParameter("contact");
			String email= request.getParameter("email");
			String password = request.getParameter("password");
			
			Connection con = ConnectDb.dbCon();
			
			PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,? )");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, designation);
			ps.setString(4, department);
			ps.setString(5, contact);
			ps.setString(6, email);
			ps.setString(7, password);
		
		    int i=ps.executeUpdate();
		    if(i>0)
		    {
		    	Employee.setEmail(email);
		    	response.sendRedirect("AddEmployee.html");
		    	
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


