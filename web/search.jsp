<%-- 
    Document   : index
    Created on : May 16, 2024, 6:59:27 AM
    Author     : PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.AccountManager"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">

        <title> Search Diner </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

    </head>

    <body>

        <div style="height: 473px ; padding: 0px">
            <div class="bg-box" style="width: 100%; height: 473px;object-fit: cover;">
                <img src="images/hero-bg-new.jpg" alt="">
            </div>
            <!-- header section strats -->
            <jsp:include page="path/header.jsp"/>
            <!-- end header section -->
            <!-- slider section -->
            <section class="slider_section" style="height: 400px ; padding: 0px; display: flex; align-content: center;justify-content: center">
                <div class="banner_main" style="display: flex;">
                    <!-- Another variation with a button -->
                    <form action="SearchServlet" method="Post" class="input-group" style="width: 600px; height: 50px">
                        <input type="text" class="form-control" name="search" placeholder="Tìm địa điểm, món ăn, địa chỉ,..." style="height: 50px">
                        <div class="input-group-append">
                            <button class="btn btn-secondary" type="submit" style="background-color: #ffffff; border-color:#ffffff ">
                                <i class="fa fa-search" style="color: #191919;"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </section>
            <!-- end slider section -->
        </div>  
        <section class="food_section layout_padding-bottom">
            <div style="margin: 50px">
                <div class="filters-content">
                    <div class="row" id="recomend">
                        <%
                            ArrayList<Account> listAcc = new ArrayList<>();
                            if (request.getSession().getAttribute("listDiner") != null) {
                                listAcc = (ArrayList<Account>) request.getSession().getAttribute("listDiner");
                            }
                            int i = 1;
                            for (Account ac : listAcc) {
                                if (i > 8)
                                    break;
                        %>
                        <div class="count col-sm-6 col-md-4 col-lg-3 all">
                            <div class="box">
                                <div>
                                    <div class="img-box">
                                        <img src="<%=ac.getProfile_picture()%>" alt="" style="object-fit: cover;">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                            <%=ac.getName()%>
                                        </h5>
                                        <p>
                                            <%=ac.getDetail()%>
                                        </p>
                                        <div class="options">
                                            <a href="CustomerDinerPage?id=<%=ac.getAccount_id()%>">
                                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                                <g>
                                                <g>
                                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                                      c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                                </g>
                                                </g>
                                                <g>
                                                <g>
                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                                      C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                                      c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                                      C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                                </g>
                                                </g>
                                                <g>
                                                <g>
                                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                                      c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                                </g>
                                                </g>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%i++;
                            }%>
                    </div>
                    <div class="btn-box">
                        <a id="loadMoreBtn">
                            <button onclick="loadMore()" style="border: none;background:none">Xem thêm</button>
                        </a>
                        <a id="hideLessBtn">
                            <button onclick="hideLess()" style="border: none;background:none">Ẩn bớt</button>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- footer section -->
        <footer class="footer_section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="" class="footer-logo">
                                Feane
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                            </p>
                            <div class="footer_social">
                                <a href="">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                                <a href="">
                                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <h4>
                            Opening Hours
                        </h4>
                        <p>
                            Everyday
                        </p>
                        <p>
                            10.00 Am -10.00 Pm
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://html.design/">Free Html Templates</a><br><br>
                        &copy; <span id="displayYear"></span> Distributed By
                        <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                    </p>
                </div>
            </div>
        </footer>
        <!-- footer section -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                var amount = document.getElementsByClassName("count").length;
                                var listLength = <%=listAcc.size()%>;
                                var loadMoreButton = document.getElementById("loadMoreBtn");
                                var hideLessButton = document.getElementById("hideLessBtn");
                                window.onload = function () {
                                    checkLoadMoreButton();
                                    hideLessButton.style.display = "none";
                                };
                                function checkLoadMoreButton() {
                                    amount = document.getElementsByClassName("count").length;
                                    if (listLength <= amount) {
                                        loadMoreButton.style.display = "none";
                                    } else {
                                        loadMoreButton.style.display = "block";
                                    }
                                    if (amount > 8) {
                                        hideLessButton.style.display = "block";
                                    } else {
                                        hideLessButton.style.display = "none";
                                    }
                                }
                                function hideLess() {
                                    var elements = document.getElementsByClassName("count");
                                    var numToHide = elements.length - 8; // Số phần tử cần ẩn bớt
                                    for (var i = 0; i < numToHide; i++) {
                                        elements[i].style.display = "none";
                                    }
                                    amount -= numToHide;
                                    // Ẩn cả nút ẩn bớt đi sau khi đã ẩn bớt các phần tử
                                    hideLessButton.style.display = "none";
                                    if (listLength <= amount) {
                                        loadMoreButton.style.display = "none";
                                    } else {
                                        loadMoreButton.style.display = "block";
                                    }
                                }
                                function loadMore() {
                                    $.ajax({
                                        url: "/HungryHub_OrderFood/LoadMoreDiners",
                                        type: "get",
                                        data: {
                                            countDiner: amount
                                        },
                                        success: function (data) {
                                            var row = document.getElementById("recomend");
                                            row.innerHTML += data;
                                            checkLoadMoreButton();
                                        },
                                        error: function (xhr) {
                                        }
                                    });
                                }
        </script>
        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- owl slider -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
        <!-- nice select -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->

    </body>

</html>
