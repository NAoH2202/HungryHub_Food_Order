<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<!DOCTYPE html>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="assets\css\bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets\css\icons.min.css" rel="stylesheet" type="text/css">
        <link href="assets\css\app.min.css" rel="stylesheet" type="text/css">
        <style>
            .ban{
                color: white;
                background-color: red;
            }
            .content-page {
                min-height: 100vh;
            }
            .table-container {
                max-height: 70vh; 
                overflow-y: scroll;
            }

        </style>

    </head>

    <body>

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
                                        <a href="http://localhost:8080/HurryHub/account">Create Member</a>
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

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        <div class="card-box">
                            <h4 class="header-title">USERS</h4>

                            <div class="table-container">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>username</th>
                                                <th>password</th>
                                                <th>name</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th>address</th>   
                                                <th>Date of Birth</th>
                                                <th>Role</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAcc}" var="a">
                                                <c:if test="${a.active_status == false}">
                                                    <tr>
                                                    <td>${a.getAccount_id()}</td>
                                                    <td>${a.getUsername()}</td>
                                                    <td>${a.getPassword()}</td>
                                                    <td>${a.getName()}</td>
                                                    <td>${a.getEmail()}</td>
                                                    <td>${a.getPhoneNumber()}</td>
                                                    <td>${a.getAddress()}</td>
                                                    <td>${a.getDate_of_birth()}</td>                                                      
                                                    <td>${a.getRole()}</td>
                                                    <td> <td>
                                                        <form action="account-request" method="POST">
                                                        <input type="hidden" value="accept" name="action"> 
                                                         <input type="hidden" value="${a.getAccount_id()}" name="id">   


                                                           <button class="ban" type="submit">Accept</button>

                                                        </form>
                                                    </td></td>
                                                </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div> 


                    </div> <!-- container -->

                </div> <!-- content -->

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

        <!-- Right Sidebar -->
       
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- Vendor js -->
        <script src="assets\js\vendor.min.js"></script>

        <!-- App js -->
        <script src="assets\js\app.min.js"></script>

    </body>
</html>