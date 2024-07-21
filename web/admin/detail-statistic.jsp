<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

        <div class="content-page">
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Upvex</a></li>
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Statistics</a></li>
                                        <li class="breadcrumb-item active">Statistics</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Statistics</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="fromDate" class="col-md-3 col-form-label">From Date</label>
                                            <div class="col-md-9">
                                                <input class="form-control" type="date" value="2024-01-01" id="fromDate">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label for="toDate" class="col-md-3 col-form-label">To Date</label>
                                            <div class="col-md-9">
                                                <input class="form-control" type="date" value="2024-01-01" id="toDate">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->


                    <!-- end row -->



                    <!-- end row -->


                    <!-- end row -->


                    <div class="col-xl-12">
                        <div class="card-box" dir="ltr" style="position: relative;">

                            <h4 class="header-title mb-1">Statistics</h4>
                            <div class="resize-triggers"><div class="expand-trigger">

                            </div>
                                <div class="contract-trigger">

                                </div>

                                <div >
                                    <h1>Revenue</h1>
                                    <canvas id="revenueChart"></canvas>
                                </div>
                                <div >
                                    <h1>Orders</h1>
                                    <canvas id="orderChart"></canvas>
                                </div>
                                </div>
                            </div>

                        </div> <!-- end card-box-->
                    </div>

                </div> <!-- container -->

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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Dashboard init -->
    <script src="assets\js\pages\dashboard-1.init.js"></script>
    <!-- Vendor js -->
    <script src="assets\js\vendor.min.js"></script>

    <!-- App js -->
    <script src="assets\js\app.min.js"></script>
<script>
    var ctx = document.getElementById('revenueChart').getContext('2d');
    var ctx2 = document.getElementById('orderChart').getContext('2d');
    var dailyLabels = ['0'];
    var dailyData = ['0'];
    var dailyData2 = ['0'];

    <c:forEach var="dailyRevenue" items="${data}">
        dailyLabels.push('${dailyRevenue.key}');
        dailyData.push('${dailyRevenue.value.TotalRevenue}');
        dailyData2.push('${dailyRevenue.value.TotalOrders}');
    </c:forEach>

    var revenueChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dailyLabels,
            datasets: [{
                label: 'Doanh thu (₫)',
                data: dailyData,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString() + ' ₫';
                        }
                    }
                }
            }
        }
    });

    var orderChart = new Chart(ctx2, {
        type: 'line',
        data: {
            labels: dailyLabels,
            datasets: [{
                label: 'Số đơn hàng',
                data: dailyData2,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                fill: false
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString();
                        }
                    }
                }
            }
        }
    });
</script>
<script>
    $(document).ready(function() {
        $('#fromDate').change(function() {
            var fromDate = $('#fromDate').val();
            var toDate = $('#toDate').val();
            window.location.href = 'http://localhost:8080/HurryHub/detail-statistic?resturantId=' + '${DinersID}' + '&fromDate=' + fromDate + '&toDate=' + toDate;
        });

        $('#toDate').change(function() {
            var fromDate = $('#fromDate').val();
            var toDate = $('#toDate').val();
            window.location.href = 'http://localhost:8080/HurryHub/detail-statistic?resturantId=' + '${DinersID}' + '&fromDate=' + fromDate + '&toDate=' + toDate;
        });
    });
</script>
</body>
</html>