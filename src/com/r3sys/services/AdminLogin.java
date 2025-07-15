package com.r3sys.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.r3sys.db.ConnectDb;

/**
 * Servlet implementation class AdminLogin
 */

public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		
        String email = request.getParameter("email");
		String password = request.getParameter("password");

      
		if (email.equals("admin@gmail.com") && password.equals("admin")) {
		    response.sendRedirect("AdminDashboard.html");
		    return;
		}
            
        }
    

    // Ensure doGet is not used for login to prevent security issues
    //protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //  response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for login.");
    }
