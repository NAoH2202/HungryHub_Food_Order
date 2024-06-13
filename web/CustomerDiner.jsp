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
                position: -webkit-sticky;
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
                width: 100%;
                margin-top: 20px;
            }
            #cartOrder{
                margin-bottom: 20px;
                overflow-y: auto;
                height: 420px;
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
                width: 65px;
                height: 35px;
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
                width: 65px;
                height: 35px;
                background-color: #2980b9;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 5px 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            /*comment reply*/
            .reply-input{
                margin-bottom: 10px;
                display: flex;
                flex-direction: column;
            }
            .reply-comment {
                width: 100%;
                max-width: 750px;
                height: 100px;
                padding: 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                resize: vertical;
                margin-bottom: 5px;
                align-self: flex-end;
            }

            .submit-reply-btn {
                padding: 8px 15px;
                font-size: 11px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                align-self: flex-end;
            }

            .submit-reply-btn:hover {
                background-color: #0056b3;
            }

            .submit-reply-btn:active {
                background-color: #004494;
            }
        </style>
    </head>

    <body>
        <div>
            <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
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
                    <div id="dish">
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
                                    <input type="number" id="quantity_<%=d.getDish_id()%>" name="quantity" min="1" max="100">
                                    <button class="btn2" onclick="addToCart('<%=d.getDish_id()%>', '<%=d.getName()%>', '<%=d.getPicture()%>', <%=d.getPrice()%>)">+</button>
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
                                    <button class="like-btn btn" data-like-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>" data-liked="false">Like</button>
                                    <%
                                        }%>
                                    <button class="btn rep-btn" data-rep-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>">Rep</button>
                                </div>
                            </div>
                            <div data-rep-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>"></div>

                            <%                                    }
                                }%>
                        </div>

                    </div>
                    <div id="cart" style="background-color: #fff;">
                        <h2>Cart</h2>
                        <div id="cartContent"></div>
                        <form action="OrderServlet" method="post" id="orderForm">
                            <input type="hidden" id="dishId" name="dishId" value="<%=id%>">
                            <input type="hidden" id="dishQuantity" name="dishQuantity">
                            <input type="hidden" id="totalCost" name="totalCost">
                            <input type="submit" value="Order">                        
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer section -->
        <jsp:include page="path/footer.jsp"/>
        <!-- footer section -->

        <!--like-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            $('.like-btn').click(function () {
                                                var commentId = $(this).data('comment-id');
                                                $.ajax({
                                                    type: 'POST',
                                                    url: 'CommentServlet',
                                                    data: {action: 'like', commentId: commentId},
                                                    success: function (response) {
                                                        if (response.status === 'liked') {
                                                            $('button[data-like-comment-id="' + commentId + '"]').removeClass('btn').addClass('liked').prop('disabled', true).text('Liked');
                                                        }
                                                        else{
                                                            alert(response.message);
                                                        }
                                                    }
                                                });
                                            });

                                            $(document).on('click', '.rep-btn, .rm-rep-btn', function () {
                                                var commentId = $(this).data('comment-id');
                                                var action = $(this).hasClass('rep-btn') ? 'reply' : 'rm-reply';
                                                $.ajax({
                                                    type: 'POST',
                                                    url: 'CommentServlet',
                                                    data: {action: action, commentId: commentId},
                                                    success: function (response) {
                                                        if (response.status === 'reply') {
                                                            var replyInput = '<div class="reply-input"><textarea class="reply-comment" placeholder="Nhập suy nghĩ của bạn..." ></textarea><button class="submit-reply-btn">Submit</button></div>';
                                                            $('button[data-rep-comment-id="' + commentId + '"]').removeClass('rep-btn').addClass('rm-rep-btn');
                                                            $('div[data-rep-comment-id="' + commentId + '"]').append(replyInput);
                                                        } else if (response.status === 'rm-reply') {
                                                            $('button[data-rep-comment-id="' + commentId + '"]').removeClass('rm-rep-btn').addClass('rep-btn');
                                                            $('div[data-rep-comment-id="' + commentId + '"]').find('.reply-input').remove();
                                                        }else{
                                                            alert(response.message);
                                                        }
                                                    }
                                                });
                                            });

                                            $(document).on('click', '.submit-reply-btn', function () {
                                                var replyContent = $(this).siblings('.reply-comment').val();
                                                var commentId = $(this).closest('.comment-footer').find('.rep-btn').data('comment-id');
                                                var dataToSend = {
                                                    commentId: commentId,
                                                    replyContent: replyContent
                                                };
                                                // Gửi dữ liệu đến RepCommentServlet bằng AJAX
                                                $.ajax({
                                                    type: 'POST',
                                                    url: 'RepCommentServlet', // Điều chỉnh đường dẫn tới Servlet của bạn
                                                    data: dataToSend,
                                                    success: function (response) {
                                                        if (response.status === "success") {
                                                            
                                                        } else {
                                                            // Hiển thị thông báo lỗi nếu status không phải là success
                                                            alert(response.message);
                                                        }
                                                    },
                                                    error: function (xhr, status, error) {
                                                        alert("An error occurred: " + error);
                                                    }
                                                });
                                            });
                                        });
        </script>
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
        <!-- Your other JavaScript imports here -->
        <script>
            var cart = JSON.parse(localStorage.getItem('cart')) || [];

            function addToCart(id, name, image, price) {
                var quantity = parseInt(document.getElementById('quantity_' + id).value);
                if (quantity > 0) {
                    var existingDish = cart.find(dish => dish.id === id);
                    if (existingDish) {
                        existingDish.quantity += quantity;
                    } else {
                        var dish = {
                            id: id,
                            name: name,
                            image: image,
                            price: price,
                            quantity: quantity
                        };
                        cart.push(dish);
                    }
                    updateCart();
                } else {
                    alert("Please enter a valid quantity");
                }
            }

            function updateCart() {
                var cartContent = document.getElementById('cartContent');
                cartContent.innerHTML = '';

                var total = 0;

                // Xóa các phần tử ẩn cũ trong biểu mẫu orderForm trước khi thêm phần tử mới
                var orderForm = document.getElementById('orderForm');
                var hiddenInputs = orderForm.querySelectorAll('input[type="hidden"]');
                hiddenInputs.forEach(function (input) {
                    orderForm.removeChild(input);
                });

                cart.forEach(function (dish, index) {
                    var dishElement = document.createElement('div');
                    dishElement.classList.add('cart-item');
                    dishElement.style.display = "flex";
                    dishElement.style.alignItems = "center";
                    dishElement.style.marginBottom = "10px";
                    dishElement.style.border = "2px solid black";
                    dishElement.style.borderRadius = "10px";
                    dishElement.style.padding = "10px";

                    var dishImage = document.createElement('img');
                    dishImage.src = dish.image;
                    dishImage.alt = dish.name;
                    dishImage.style.width = "50px";
                    dishImage.style.height = "50px";
                    dishImage.style.objectFit = "cover";
                    dishImage.style.marginRight = "10px";
                    dishImage.style.borderRadius = "5px";
                    dishElement.appendChild(dishImage);

                    var dishInfo = document.createElement('div');
                    dishInfo.style.flex = "1";
                    dishInfo.textContent = dish.name + " - " + dish.price + " x " + dish.quantity;
                    dishElement.appendChild(dishInfo);

                    var deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Delete';
                    deleteButton.style.marginLeft = '10px';
                    deleteButton.style.backgroundColor = '#ff9900';
                    deleteButton.style.color = 'white';
                    deleteButton.style.border = 'none';
                    deleteButton.style.padding = '5px 10px';
                    deleteButton.style.borderRadius = '5px';
                    deleteButton.addEventListener('click', function () {
                        deleteCartItem(index);
                    });
                    dishElement.appendChild(deleteButton);

                    cartContent.appendChild(dishElement);

                    total += dish.price * dish.quantity;

                    // Thêm các phần tử input ẩn chứa thông tin món ăn vào biểu mẫu orderForm
                    var inputId = document.createElement('input');
                    inputId.type = 'hidden';
                    inputId.name = 'dishId' + index;
                    inputId.value = dish.id;
                    orderForm.appendChild(inputId);

                    var inputName = document.createElement('input');
                    inputName.type = 'hidden';
                    inputName.name = 'dishName' + index;
                    inputName.value = dish.name;
                    orderForm.appendChild(inputName);

                    var inputQuantity = document.createElement('input');
                    inputQuantity.type = 'hidden';
                    inputQuantity.name = 'dishQuantity' + index;
                    inputQuantity.value = dish.quantity;
                    orderForm.appendChild(inputQuantity);
                });

                var totalElement = document.createElement('div');
                totalElement.innerHTML = "<h3>Total: " + total + " VNĐ</h3>";
                cartContent.appendChild(totalElement);

                // Update the localStorage with the new cart data
                localStorage.setItem('cart', JSON.stringify(cart));
            }

            function deleteCartItem(index) {
                cart.splice(index, 1);
                updateCart();
            }

            window.onload = function () {
                updateCart();
            };

            document.getElementById('orderForm').addEventListener('submit', function (event) {
                if (cart.length === 0) {
                    alert('Please add the dish to the cart first');
                    event.preventDefault();
                    return;
                }

                var totalCost = 0;
                cart.forEach(function (item) {
                    totalCost += item.price * item.quantity;
                });

                var inputTotalCost = document.createElement('input');
                inputTotalCost.type = 'hidden';
                inputTotalCost.name = 'totalCost';
                inputTotalCost.value = totalCost;
                document.getElementById('orderForm').appendChild(inputTotalCost);

                // Clear the cart but do not reload the page
                localStorage.removeItem('cart');
            });
        </script>

    </body>
</html>
