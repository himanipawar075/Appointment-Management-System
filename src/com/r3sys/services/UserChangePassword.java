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

/**
 * Servlet implementation class UserChangePassword
 */
public class UserChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserChangePassword() {
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
		try{
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String npassword=request.getParameter("npassword");
			
			Connection con=ConnectDb.dbCon();
			PreparedStatement ps=con.prepareStatement("update user set password=? where email=? and password=? ");
			ps.setString(1, npassword);
			ps.setString(2, email);
			ps.setString(3, password);
			
			int i=ps.executeUpdate();
			if(i>0){
				email=Employee.getEmail();
				response.sendRedirect("UserLogin.html");
				
			}else{
				response.sendRedirect("index.html");
				}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}
		
		
	}