<%@page import="java.sql.*"%>
<%@page import="com.r3sys.db.*" %>
<%@page import="com.r3sys.services.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<html>
<head>
<title>APPOINTMENT MANAGER Admin Panel an Admin Panel Category Flat Bootstrap Responsive Website Template | Tables :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
<body class="cbp-spmenu-push">
<div class="main-content">
    <!--left-fixed -navigation-->
    <div class=" sidebar" role="navigation">
        <div class="navbar-collapse">
            <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="AddEmployee.html"><i class="fa fa-check-square-o nav_icon"></i>Add Employee</a>
                    </li>
                    <li>
                        <a href="ViewEmployees.jsp"><i class="fa fa-table nav_icon"></i>View Employees</a>
                    </li>
                    <li>
                        <a href="ViewUsers.jsp"><i class="fa fa-cogs nav_icon"></i>View Users</a>
                    </li>
                    <li>
                        <a href="Admin.html"><i class="fa fa-home nav_icon"></i>LOGOUT</a>
                    </li>
                    
                </ul>
                <div class="clearfix"> </div>
                <!-- //sidebar-collapse -->
            </nav>
        </div>
    </div>
    <!--left-fixed -navigation-->
    <!-- header-starts -->
    <div class="sticky-header header-section ">
        <div class="header-left">
            <!--toggle button start-->
            <button id="showLeftPush"><i class="fa fa-bars"></i></button>
            <!--toggle button end-->
            <!--logo -->
            <div class="logo">
                <a href="index.html">
                    <h1>APPOINTMENT MANAGER</h1>
                    <span>AdminPanel</span>
                </a>
            </div>
            <!--//logo-->
            <div class="clearfix"> </div>
        </div>
        <div class="header-right">
            <div class="profile_details_left"><!--notifications of menu start -->
                <div class="clearfix"> </div>
            </div>
            <!--notification menu end -->
            <div class="profile_details">     
                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <div class="profile_img">    
                                <span class="prfil-img"><img src="images/bank.png" alt=""> </span> 
                                <div class="user-name">
                                    <p>Welcome</p>
                                    <span>Administrator</span>
                                </div>
                                <i class="fa fa-angle-down lnr"></i>
                                <i class="fa fa-angle-up lnr"></i>
                                <div class="clearfix"></div>    
                            </div>    
                        </a>
                        <ul class="dropdown-menu drp-mnu">
                            <li> <a href="index.html"><i class="fa fa-sign-out"></i> Logout</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clearfix"> </div>    
        </div>
        <div class="clearfix"> </div>    
    </div>
    <!-- //header-ends -->
    <!-- main content start-->
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <h3 class="title1">APPOINTMENT MANAGER</h3>
                <div class="bs-example widget-shadow" data-example-id="hoverable-table"> 
                    <h4> EMPLOYEES DETAILS</h4>
                    <table class="table">
                        <thead>
                            <tr>
						            <th>ID</th>
						            <th> NAME</th>
						            <th>DESIGNATION</th>
						            <th>DEPARTMENT</th>
						            <th>CONTACT</th>
						            <th>EMAIL</th>
						            <th>ACTION</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
				            try {
				                Connection con = ConnectDb.dbCon();
				                PreparedStatement ps = con.prepareStatement("select * from employee");
				                ResultSet rs = ps.executeQuery();
				                while (rs.next()) {
				        %>
				        <tr>
				            <td><%= rs.getInt("id") %></td>
				            <td><%= rs.getString("name") %></td>
				            <td><%= rs.getString("designation") %></td>
				            <td><%= rs.getString("department") %></td>
				            <td><%= rs.getString("contact") %></td>
				            <td><%= rs.getString("email") %></td>
				            <td><a class="delete-btn" href="DeleteEmployee.jsp?id=<%= rs.getInt(1) %>">Delete</a></td> 
				        </tr>
				        <%
				                }
				            } catch (Exception e) {
				                e.printStackTrace();
				            }
				        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <div class="footer">
        <h4>&copy; 2024 APPOINTMENT MANAGER.  </h4>
    </div>
    <!--//footer-->
</div>
<!-- Classie -->
<script src="js/classie.js"></script>
<script>
    var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
        showLeftPush = document.getElementById( 'showLeftPush' ),
        body = document.body;
    
    showLeftPush.onclick = function() {
        classie.toggle( this, 'active' );
        classie.toggle( body, 'cbp-spmenu-push-toright' );
        classie.toggle( menuLeft, 'cbp-spmenu-open' );
        disableOther( 'showLeftPush' );
    };
    
    function disableOther( button ) {
        if( button !== 'showLeftPush' ) {
            classie.toggle( showLeftPush, 'disabled' );
        }
    }
</script>
<!--scrolling js-->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"> </script>
</body>
</html>
