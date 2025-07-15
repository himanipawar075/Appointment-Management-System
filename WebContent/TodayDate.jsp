<%@ page import="java.time.*" %>
<%@page import="java.sql.*"%>
<%@page import="com.r3sys.db.*" %>
<%@page import="com.r3sys.services.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APPOINTMENT MANAGER Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<script src="js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!-- Classie -->
<script src="js/classie.js"></script>
</head>
<body class="cbp-spmenu-push">
<div class="main-content">
    <!--left-fixed -navigation-->
    <div class=" sidebar" role="navigation">
        <div class="navbar-collapse">
            <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="ViewPendingAppointments.jsp">View Pending Appointments</a>
                    </li>
                    <li>
                        <a href="ViewApprovedAppointments.jsp">View Approved Appointments</a>
                    </li>
                    <li>
                        <a href="ViewDisapprovedAppointments.jsp">View Disapproved Appointments</a>
                    </li>
                    <li>
                        <a href="TodayDate.jsp">View Today's Appointments</a>
                    </li>
                    <li>
                        <a href="ChangePasswordEmployee.html">Change Password</a>
                    </li>
                    <li>
                        <a href="EmployeeLogin.html">LOGOUT</a>
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
                    <span>Employee Panel</span>
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
    
    <!-- Slider Section -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="images/slide1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/slide2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/slide3.jpg" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- main content start-->
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <h3 class="title1">APPOINTMENT MANAGER</h3>
                <div class="bs-example widget-shadow" data-example-id="hoverable-table"> 
                    <h4>DISAPPROVED APPOINTMENTS</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Employee ID</th>
                                    <th>User Id</th>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Department</th>
                                    <th>Company</th>
                                    <th>Contact</th>
                                    <th>Address</th>
                                    <th>Purpose</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                try {
                                    int id = Employee.getEmpId();
                                    LocalDate today = LocalDate.now();
                                    Date sqlDate = Date.valueOf(today);
                                    Connection con = ConnectDb.dbCon();
                                    PreparedStatement ps = con.prepareStatement("select * from appointment where empId=? and date=?");
                                    ps.setInt(1, id);
                                    ps.setDate(2, sqlDate);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getInt("id") %></td>
                                    <td><%= rs.getInt("empId") %></td>
                                    <td><%= rs.getInt("userId") %></td>
                                    <td><%= rs.getString("name") %></td>
                                    <td><%= rs.getString("designation") %></td>
                                    <td><%= rs.getString("department") %></td>
                                    <td><%= rs.getString("companyName") %></td>
                                    <td><%= rs.getString("contact") %></td>
                                    <td><%= rs.getString("address") %></td>
                                    <td><%= rs.getString("purpose") %></td>
                                    <td><%= rs.getString("description") %></td>
                                    <td><%= rs.getString("date") %></td>
                                    <td><%= rs.getString("time") %></td>
                                    <td><%= rs.getString("email") %></td>
                                    <td><%= rs.getString("status") %></td>
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
