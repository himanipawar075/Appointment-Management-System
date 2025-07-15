<%@ page import="java.sql.*" %>
<%@ page import="com.r3sys.db.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Appointment Manager Employee Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
    <link href="css/slick.css" rel="stylesheet"> <!-- Add Slick CSS -->
    <link href="css/slick-theme.css" rel="stylesheet"> <!-- Add Slick Theme CSS -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/slick.min.js"></script> <!-- Add Slick JS -->
    <script src="js/bootstrap.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/scripts.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').slick({
                dots: true,
                infinite: true,
                speed: 500,
                fade: true,
                cssEase: 'linear'
            });
        });
    </script>
</head>
<body class="cbp-spmenu-push">
<div class="main-content">
    <!-- Left Fixed Navigation -->
    <div class="sidebar" role="navigation">
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
                        <a href="EmployeeLogin.html"></i>LOGOUT</a>
                    </li>
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
                    <h1>APPOINTMENT MANAGER</h1>
                    <span>Employee Panel</span>
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
                                <span class="prfil-img"><img src="images/bank.png" alt=""> </span>
                                <div class="user-name">
                                    <p>Back to Home</p>
                                    
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
    <div class="slider">
        <div><img src="images/slide1.jpg" alt="Slide 1"></div>
        <div><img src="images/slide2.jpg" alt="Slide 2"></div>
        <div><img src="images/slide3.jpg" alt="Slide 3"></div>
    </div>
    <!-- Main Content Section -->
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <h3 class="title1">APPOINTMENT MANAGER</h3>
                <div class="bs-example widget-shadow" data-example-id="hoverable-table">
                    <h4>PENDING APPOINTMENTS</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>EMPLOYEE_ID</th>
                                    <th>USER_ID</th>
                                    <th>NAME</th>
                                    <th>DESIGNATION</th>
                                    <th>DEPARTMENT</th>
                                    <th>COMPANY_NAME</th>
                                    <th>CONTACT</th>
                                    <th>ADDRESS</th>
                                    <th>PURPOSE</th>
                                    <th>DESCRIPTION</th>
                                    <th>DATE</th>
                                    <th>TIME</th>
                                    <th>EMAIL</th>
                                    <th>STATUS</th>
                                    <th>ACTION</th>
                                    <th>ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                try {
                                	int id= Employee.getEmpId();
                                    Connection con = ConnectDb.dbCon();
                                    PreparedStatement ps = con.prepareStatement("select * from appointment where empId=? and status=?");
                                    ps.setInt(1, id);
                                    ps.setString(2, "Pending");
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                    <tr>
                                        <td><%= rs.getInt("id") %></td>
                                        <td><%= rs.getString("empId") %></td>
                                        <td><%= rs.getString("userId") %></td>
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
                                        <td><a href="ApprovesUser.jsp?id=<%= rs.getInt("id") %>">Approve</a></td>
                                        <td><a href="DisapprovesUser.jsp?id=<%= rs.getInt("id") %>">Disapprove</a></td>
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
    <!-- Footer Section -->
    <div class="footer">
        <h4>&copy; 2024 APPOINTMENT MANAGER.</h4>
    </div>
</div>
<!-- Scrolling JS -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
