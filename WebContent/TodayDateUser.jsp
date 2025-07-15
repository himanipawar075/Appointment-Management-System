<%@page import="java.sql.*" %>
<%@page import="com.r3sys.db.*" %>
<%@ page import="java.time.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment Manager User Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">
<div class="main-content">
    <!-- Left Fixed Navigation -->
    <div class="sidebar" role="navigation">
        <div class="navbar-collapse">
            <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                <ul class="nav" id="side-menu">
                    <li><a href="ViewEmployeesForUser.jsp">View Employee</a></li>
                    <li><a href="BookAppointments.jsp">Book Appointment</a></li>
                    <li><a href="ViewAppointmentStatus.jsp">View Appointment Status</a></li>
                    <li><a href="TodayDateUser.jsp">View Today's Appointment</a></li>
                    <li><a href="ChangePasswordUser.html">Change Password</a></li>
                    <li><a href="UserDashboard.html">LOGOUT</a></li>
                </ul>
                <div class="clearfix"></div>
            </nav>
        </div>
    </div>
    <!-- Header Section -->
    <div class="sticky-header header-section">
        <div class="header-left">
            <button id="showLeftPush"><i class="fa fa-bars"></i></button>
            <div class="logo">
                <a href="index.html">
                    <h1>Appointment Manager</h1>
                    <span>UserPanel</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="header-right">
            <div class="profile_details_left">
                <div class="clearfix"></div>
            </div>
            <div class="profile_details">
                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <div class="profile_img">
                                <div class="user-name">
                                    <p>Welcome</p>
                                </div>
                                <i class="fa fa-angle-down lnr"></i>
                                <i class="fa fa-angle-up lnr"></i>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu drp-mnu">
                            <li><a href="index.html"><i class="fa fa-sign-out"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
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
    <!-- Main Content Section -->
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <h3 class="title1">Appointment Manager</h3>
                <div class="bs-example widget-shadow" data-example-id="hoverable-table">
                    <h4>All Appointment Status</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <%
                                try {
                                    int id = User.getUserId();
                                    LocalDate today = LocalDate.now();
                                    Date sqlDate = Date.valueOf(today);
                                    Connection con = ConnectDb.dbCon();
                                    PreparedStatement ps = con.prepareStatement("select * from appointment where userId=? and date=?");
                                    ps.setInt(1, id);
                                    ps.setDate(2, sqlDate);
                                    ResultSet rs = ps.executeQuery();
                            %>
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
                            %>
                            </tbody>
                            <%
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <div class="footer">
        <h4>&copy; 2024 APPOINTMENT MANAGER.</h4>
    </div>
    <!--//footer-->
</div>
<!-- Classie -->
<script src="js/classie.js"></script>
<script>
    var menuLeft = document.getElementById('cbp-spmenu-s1'),
        showLeftPush = document.getElementById('showLeftPush'),
        body = document.body;

    showLeftPush.onclick = function () {
        classie.toggle(this, 'active');
        classie.toggle(body, 'cbp-spmenu-push-toright');
        classie.toggle(menuLeft, 'cbp-spmenu-open');
        disableOther('showLeftPush');
    };

    function disableOther(button) {
        if (button !== 'showLeftPush') {
            classie.toggle(showLeftPush, 'disabled');
        }
    }
</script>
<!--scrolling js-->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>
