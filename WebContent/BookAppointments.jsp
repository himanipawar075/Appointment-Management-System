<%@page import="java.sql.*" %>
<%@page import="com.r3sys.db.*" %>

<!DOCTYPE HTML>
<html>
<head>
<title>APPOINTMENT BOOKING</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
<script> new WOW().init(); </script>
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
</head> 
<body class="cbp-spmenu-push">
    <div class="main-content">
        <div class=" sidebar" role="navigation">
            <div class="navbar-collapse">
                <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="ViewEmployeesForUser.jsp">View Employee</a>
                        </li>
                        <li>
                            <a href="BookAppointments.jsp">Book Appointment</a>
                        </li>
                        <li>
                            <a href="ViewAppointmentStatus.jsp">View Appointment Status</a>
                        </li>
                        <li>
                            <a href="TodayDateUser.jsp">View Today's Appointment</a>
                        </li>
                        <li>
                            <a href="ChangePasswordUser.html">Change Password</a>
                        </li>
                        <li>
                            <a href="UserDashboard.html">LOGOUT</a>
                        </li>
                    </ul>
                    <div class="clearfix"> </div>
                </nav>
            </div>
        </div>
        <div class="sticky-header header-section ">
            <div class="header-left">
                <button id="showLeftPush"><i class="fa fa-bars"></i></button>
                <div class="logo">
                    <a href="index.html">
                        <h1>APPOINTMENT MANAGER</h1>
                        <span>User Panel</span>
                    </a>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="header-right">
                <div class="profile_details_left"></div>
                <div class="profile_details">      
                    <ul>
                        <li class="dropdown profile_details_drop">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <div class="profile_img">  
                                    <span class="prfil-img"><img src="images/a.png" alt=""> </span> 
                                    <div class="user-name">
                                        <p>Welcome</p>
                                        <span>User</span>
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
        <div id="page-wrapper">
            <div class="main-page">
                <div class="forms">
                    <h3 class="title1">BOOK YOUR APPOINTMENTS</h3>
                    <div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
                        <div class="form-title">
                            <h4>Enter Following Details :</h4>
                        </div>
                        <div class="form-body">
                        <%
                            String userId = request.getParameter("userId");  // Retrieve userId from session or user object
                            String empId = request.getParameter("id"); 
                        %>
                            <form action="Appointments" method="post">  
                                <input type="hidden" name="userId" value="<%= userId %>"> 
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Employee Id</label> 
                                    <input type="text" name="empId" value="<%= empId %>" class="form-control" id="exampleInputEmail1" placeholder="Employee Id"> 
                                </div> 
                                <div class="form-group">
								    <label for="exampleInputName">Name</label>
								    <input type="text" name="name" class="form-control" id="exampleInputName" placeholder="Name">
								</div>
                                
                                
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Purpose</label> 
                                    <input type="text" name="purpose" class="form-control" id="exampleInputEmail1" placeholder="Purpose"> 
                                </div> 
                                
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Description</label> 
                                    <input type="text" name="description" class="form-control" id="exampleInputEmail1" placeholder="Description"> 
                                </div> 
                                
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Date</label> 
                                    <input type="text" name="date" class="form-control" id="exampleInputEmail1" placeholder="Date"> 
                                </div> 
                                
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Time</label> 
                                    <input type="text" name="time" class="form-control" id="exampleInputEmail1" placeholder="Time"> 
                                </div>
                                
                                <div class="form-group"> 
                                    <label for="exampleInputEmail1">Email</label> 
                                    <input type="text" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email"> 
                                </div>  
                                
                                <button type="submit" class="btn btn-default">Book Appointment</button> 
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
           <p>&copy; 2024 APPOINTMENT MANAGER</p>
        </div>
    </div>
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
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/bootstrap.js"> </script>
</body>
</html>
