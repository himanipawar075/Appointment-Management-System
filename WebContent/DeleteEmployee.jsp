<%@page import="java.sql.*" %>
  <%@page import="com.r3sys.db.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try
	{
		String id = request.getParameter("id");
		Connection con = ConnectDb.dbCon();
		PreparedStatement ps=con.prepareStatement("delete from employee where id=?");
		ps.setInt(1, Integer.parseInt(id));
		int i = ps.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("ViewEmployees.jsp");		
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
		%>

</body>
</html>