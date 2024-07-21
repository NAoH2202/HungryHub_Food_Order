<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.VoucherModel" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HungryHub - Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets\images\favicon.png">

        <!-- plugin css -->
        <link href="assets\libs\jquery-vectormap\jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
        <link href="assets\css\app.min.css" rel="stylesheet" type="text/css">
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <style>
            .content-page
            {
                width:100%;
                padding-left: 80px;
                padding-top: 40px;
            }
            .input
            {
                margin-top: 20px;
            }
            .input__input
            {
                padding: 10px 20px;
                background: white;
                width: 400px;
                margin-top: 10px;
                border-radius: 10px;
            }
            .input__input input
            {
                outline: none;
                border: none;
                width: 100%;
            }
            #submitAdd
            {
                margin-top:40px;
                padding: 10px 20px;
                margin-left:150px
                    ;
                background: #33cc00
                    ;
                color: white;
                border-radius: 8px;
            }
        </style>
    </head>

    <body>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Begin page -->
            <div id="wrapper">

                <!-- Topbar Start -->
                <div class="navbar-custom">
                    <ul class="list-unstyled topnav-menu float-right mb-0">

                        <li class="d-none d-sm-block">
                            <form class="app-search">
                                <div class="app-search-box">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search...">
                                        <div class="input-group-append">
                                            <button class="btn" type="submit">
                                                <i class="fe-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </li>

                     

                        <li class="dropdown notification-list">
                            <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="assets\images\users\avatar.png" alt="" height="50">
                                <span class="pro-user-name ml-1">
                                    My Account <i class="mdi mdi-chevron-down"></i> 
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0 text-white">
                                        Welcome, Admin!
                                    </h5>
                                </div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-user"></i>
                                    <span>My Account</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-settings"></i>
                                    <span>Settings</span>
                                </a>

                                <!-- item-->                           

                                <div class="dropdown-divider"></div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="fe-log-out"></i>
                                    <span>Logout</span>
                                </a>

                            </div>
                        </li>
                    </ul>

                    <!-- LOGO -->
                    <div class="logo-box">
                        <a href="http://localhost:8080/HurryHub/admin?action=home" class="logo text-center">
                            <span class="logo-lg">
                                <img src="assets\images\logo_web.png" alt="" height="55">ADMIN
                                
                                <!-- <span class="logo-lg-text-light">Upvex</span> -->
                            </span>
                            <span class="logo-sm">
                                <!-- <span class="logo-sm-text-dark">X</span> -->
                                <img src="assets\images\logo_web.png" alt="" height="28">
                            </span>
                        </a>
                    </div>

                    <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
                        <li>
                            <button class="button-menu-mobile waves-effect waves-light">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </li>

                      

                        <li class="dropdown dropdown-mega d-none d-lg-block">

                        </li>
                    </ul>
                </div>
                <!-- end Topbar -->

                <!-- ========== Left Sidebar Start ========== -->
                <div class="left-side-menu">

                    <div class="slimscroll-menu">

                        <!--- Sidemenu -->
                        <div id="sidebar-menu">

                            <ul class="metismenu" id="side-menu">
                                <li class="menu-title">Navigation</li>
                                <li>
                                    <a href="http://localhost:8080/HurryHub/statistic">
                                        <i class="fa-solid fa-chart-pie"></i>
                                        <span></span>
                                        <span> Statistics </span>
                                    </a>                              
                                </li>               
                                <li>
                                    <a href="javascript: void(0);">
                                        <i class="fa-solid fa-user"></i>
                                        <span> User </span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li>
                                            <a href="http://localhost:8080/HurryHub/account">List</a>
                                        </li>
                                       
                                        <li>
                                            <a href="http://localhost:8080/HurryHub//account-request">Request Member</a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="http://localhost:8080/HurryHub/comment">
                                        <i class="fa-solid fa-comments"></i>
                                        <span> Comment </span>

                                    </a>
                                </li>

                                <li>
                                    <a href="http://localhost:8080/HurryHub/voucher">
                                        <i class="fa-solid fa-ticket"></i>
                                        <span class="badge badge-danger float-right">New</span>
                                        <span> Voucher </span>
                                    </a>
                                </li>





                        </div>
                        <!-- End Sidebar -->

                        <div class="clearfix"></div>

                    </div>
                    <!-- Sidebar -left -->

                </div>
                <!-- Left Sidebar End -->

                <!-- ============================================================== -->
                <!-- Start Page Content here -->
                <!-- ============================================================== -->
                <%
                    String formattedDate = "";
                       String formattedDate2 = "";
                    
                    VoucherModel valid = (VoucherModel) request.getAttribute("current");
                    if (valid != null) {
                        Date validFrom = valid.getValid_from();
                        
                        if (validFrom != null) {
                            out.println("Valid From (Scriptlet): " + validFrom);
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                            formattedDate = dateFormat.format(validFrom);
                        } else {
                            out.println("Valid From not found");
                        }

                        Date validTo = valid.getValid_to();
                         if (validTo != null) {
                            out.println("Valid From (Scriptlet): " + validTo);
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                            formattedDate2 = dateFormat.format(validTo);
                        } else {
                            out.println("Valid From not found");
                        }
                    }
                %>
                <div class="content-page">
                    <h1>${requestScope.message}</h1>
                    <a href="voucher"><div class="backbtn">< Back to voucher list<div></a>
                                <form action="voucher" method="POST">
                                    <input name="action" type="hidden" value="${param.action}">
                                    <c:if test="${param.action != 'add'}"><div class="input">
                                            <input  name="id" value="${requestScope.current.voucher_id}"  class="id" type="hidden"/>

                                        </div></c:if>
                                        <div class="input"> 
                                            <div class="input__header">Code:</div>
                                            <div class="input__input">
                                                <input name="code" value="${requestScope.current.code}" required class="id" type="text"/>
                                        </div>
                                    </div>
                                    <div class="input"> 
                                        <div class="input__header">Discount percentage:</div>
                                        <div class="input__input">
                                            <input name="percentage" value="${requestScope.current.discount_percentage}" required class="id" type="number"/>
                                        </div>
                                    </div>
                                    <div class="input"> 
                                        <div class="input__header">Valid from:</div>
                                        <div class="input__input">
                                            <input name="from" required class="id" value="<%= formattedDate%>" type="datetime-local"/>
                                        </div>
                                    </div>
                                    <div class="input"> 
                                        <div class="input__header">Valid to:</div>
                                        <div class="input__input">
                                            <input name="to" required class="id" value="<%= formattedDate2%>" type="datetime-local"/>
                                        </div>
                                    </div>
                                    <c:if test="${param.action == 'add'}"> <input type="submit" id="submitAdd" value="Add"></c:if>
                                    <c:if test="${param.action == 'edit'}"> <input type="submit" id="submitAdd" value="Save changes"></c:if>

                                    </div>
                                </form>

                            </div> <!-- content -->




                            <!-- ============================================================== -->
                            <!-- Start Page Content here -->
                            <!-- ============================================================== -->




                            <!-- Footer Start -->
                            <footer class="footer">
                                <div class="container-fluid">
                                    <div class="row">                          
                                        <div class="col-md-6">
                                            <div class="text-md-right footer-links d-none d-sm-block">
                                                <a href="javascript:void(0);">About Us</a>
                                                <a href="javascript:void(0);">Help</a>
                                                <a href="javascript:void(0);">Contact Us</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </footer>
                            <!-- end Footer -->

                        </div>

                        <!-- ============================================================== -->
                        <!-- End Page content -->
                        <!-- ============================================================== -->


                </div>
                <!-- END wrapper -->


                <!-- Right bar overlay-->
                <div class="rightbar-overlay"></div>



                <!-- Third Party js-->
                <script src="assets\libs\peity\jquery.peity.min.js"></script>
                <script src="assets\libs\apexcharts\apexcharts.min.js"></script>
                <script src="assets\libs\jquery-vectormap\jquery-jvectormap-1.2.2.min.js"></script>
                <script src="assets\libs\jquery-vectormap\jquery-jvectormap-us-merc-en.js"></script>

                <!-- Dashboard init -->
                <script src="assets\js\pages\dashboard-1.init.js"></script>
                <!-- Vendor js -->
                <script src="assets\js\vendor.min.js"></script>

                <!-- App js -->
                <script src="assets\js\app.min.js"></script>

                </body>
                </html>