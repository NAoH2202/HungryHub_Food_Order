<%-- 
Document   : Diner
Created on : May 28, 2024, 1:33:13 AM
Author     : MSIGAMING
--%>

<%@page import="model.Like"%>
<%@page import="model.LikeManager"%>
<%@page import="model.Comment"%>
<%@page import="model.CommentManager"%>
<%@page import="model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <title> HungryHub </title>

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

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .back-link {
                display: block;
                margin-left: 10px;
                height: 20px;
                text-decoration: none;
                color: #000;
            }

            .restaurant {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            .restaurant-detail {
                display: flex;
                align-items: center;
                max-width: 1300px;
                width: 100%;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }

            .restaurant-img {
                max-width: 400px;
                height: auto;
                margin-right: 20px;
            }

            .restaurant-info {
                max-width: 500px;
            }

            .restaurant-name, .restaurant-address, .restaurant-rating, .restaurant-opening-time {
                margin: 10px 0;
            }

            #container {
                display: flex;
                justify-content: center;
            }

            #content {
                display: flex;
                max-width: 1300px;
                width: 100%;
                justify-content: space-between;
                padding-bottom: 20px
            }
            #cart {
                background-color: white;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 30%;
                height: 600px;
                margin-left: 20px;
                padding: 20px;
                position: -webkit-sticky; /* For Safari */
                position: sticky;
                top: 10px;
                margin-bottom: 50px;
            }

            #dish {
                margin-top: 0px;
                margin-bottom: 50px;
                background-color: white;
                width: 70%;
                padding: 40px;
                /*border-radius: 10px;*/
                height: auto;
            }

            .dish-detail {
                display: flex;
                margin: 20px;
            }

            .dish-img {
                width: 80px;
                height: 80px;
            }

            .dish-description {
                max-width: 600px;
                display: flex
            }

            .quantity-container {
                margin: 10px 0;
            }

            .btn2 {
                display: inline-block;
                /*padding: 10px 20px;*/
                background-color: #ff9900;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 50%;
            }

            .btn:hover {
                background-color: #ffc107;
            }

            .comments-section {
                margin-top: 20px;
            }
            #cartOrder{
                padding: 10px 20px;
                border-radius: 5px;
            }
            #addToCartButton{
                height: 30px;
                width: 30px;
                text-align: center;
            }
            /*comment*/
            .comment {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .comment-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .username {
                font-weight: bold;
                color: #333;
            }

            .time {
                color: #999;
            }

            .comment-body {
                margin-bottom: 10px;
            }

            .comment-body p {
                margin: 0;
            }

            .comment-footer {
                display: flex;
                align-items: center;
                justify-content: flex-start;
            }

            .rating {
                color: #f39c12;
                font-size: 1.2em;
            }

            .btn {
                margin-left: 10px;
                background-color: #3498db;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 5px 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            #cartContent {
                margin-bottom: 20px;
                overflow-y: auto;
                height: 420px;
            }

            .btn:hover {
                background-color: #2980b9;
            }
            .liked{
                margin-left: 10px;
                background-color: #2980b9;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 5px 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
        </style>
    </head>

    <body>
        <div>
            <!-- header section strats -->
            <jsp:include page="path/header.jsp"/>
            <!-- end header section -->
        </div>
        <%
            int id;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            } else {
                response.sendRedirect("HomePage");
                return;
            }
            AccountManager am = new AccountManager();
            Account diner = am.getAccountById(id);

        %>
        <div style="background-color: #dddddd">
            <a href="index.jsp" class="back-link">BACK</a>
            <div class="restaurant">
                <section class="restaurant-detail">
                    <img src="https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lsv21q8k90uxa6@resize_ss640x400!@crop_w640_h400_cT" class="restaurant-img" alt="Restaurant Image"/>
                    <div class="restaurant-info">
                        <h1 class="restaurant-name"><%=diner.getName()%></h1>
                        <h3 class="restaurant-address"><%=diner.getAddress()%></h3>
                        <h4 class="restaurant-rating">Rating</h4>
                        <h5 class="restaurant-opening-time">Opening Time</h5>
                    </div>     
                </section>
            </div>

            <div id="container">
                <div id="content">
                    <div id="dish" >
                        <%
                            DishManager dm = new DishManager();
                            ArrayList<Dish> listDish = dm.getDishByDinerId(id);
                            for (Dish d : listDish) {
                        %>
                        <div class="dish-detail">
                            <img class="dish-img col-md-2" src="<%=d.getPicture()%>" alt="Dish Image">
                            <div class="dish-description col-md-10">
                                <div class="col-md-9">
                                    <h3 id="dishName"><a href="CustomerDishPage?id=<%=d.getDish_id()%>" style="color: black"><%=d.getName()%></a></h3>
                                    <p>Price: <span id="dishPrice"><%=d.getPrice()%> VNĐ</span></p>
                                </div>

                                <div class="col-md-3" style="align-content: center">
                                    <input type="number" id="quantity" name="quantity" min="1" max="100">
                                    <button id="addToCartButton" class="btn2">+</button>
                                </div>
                            </div>
                        </div>
                        <%
                            }%>
                        <div class="comments-section">
                            <h2>Comments</h2>
                            <%
                                ArrayList<Like> likeList = new ArrayList<Like>();
                                Boolean check = false;
                                LikeManager lm = new LikeManager();
                                if (session.getAttribute("account") != null) {
                                    // Lấy accountId của người dùng từ session
                                    Account account = (Account) session.getAttribute("account");
                                    likeList = lm.getLikesByAccountId(account.getAccount_id());
                                }
                                CommentManager cm = new CommentManager();
                                for (Comment comment : cm.getList()) {
                                    if (comment.getDiner() != null && comment.getDiner().getAccount_id() == id) {
                                        for (Like l : likeList) {
                                            if (l.getComment().getCommentId() == comment.getCommentId()) {
                                                check = true;
                                            };
                                        }
                            %>
                            <div class="comment">
                                <div class="comment-header">
                                    <span class="username"><%=comment.getAccount().getName()%></span>
                                    <span class="time"><%=comment.getCreated_at()%></span>
                                </div>
                                <div class="comment-body">
                                    <p><%=comment.getContent()%></p>
                                </div>
                                <div class="comment-footer">
                                    <div class="rating" data-rating="<%=comment.getRating()%>"></div>
                                    <%
                                        if (check) {
                                    %>
                                    <button class="like-btn liked" data-liked="true" disabled>Liked</button>
                                    <%
                                        } else {%>
                                    <button class="btn like-btn" data-liked="false">Like</button>
                                    <%
                                        }%>
                                    <button class="btn rep-btn">Rep</button>
                                </div>
                            </div>
                            <%                                    }
                                }%>
                        </div>

                    </div>
                    <div id="cart" style="background-color: #fff;">
                        <h2>Cart</h2>
                        <div id="cartContent"></div>
                        <form action="OrderServlet" method="post">
                            <button type="submit" class="btn2" id="cartOrder">Order</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer section -->
        <jsp:include page="path/footer.jsp"/>
        <!-- footer section -->

        <!--like-->
        <!--rating-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const ratings = document.querySelectorAll('.rating');

                ratings.forEach(rating => {
                    const ratingValue = parseInt(rating.getAttribute('data-rating'), 10);
                    let stars = '';

                    for (let i = 1; i <= 5; i++) {
                        if (i <= ratingValue) {
                            stars += '<span>★</span>'; // Sao đầy
                        } else {
                            stars += '<span>☆</span>'; // Sao trống
                        }
                    }

                    rating.innerHTML = stars;
                });
            });
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
