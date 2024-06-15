<%@page import="model.Comment"%>
<%@page import="model.CommentManager"%>
<%@page import="model.LikeManager"%>
<%@page import="model.Like"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AccountManager"%>
<%@page import="model.OrderManager"%>
<%@page import="model.Order"%>
<%@page import="model.Account"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <style>
            *,
            *::before,
            *::after {
                box-sizing: border-box;
            }
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                width: 100%;
            }

            #container {
                /*background-color: #ffffcc;*/
                background-color: #dddddd;
                display: flex;
                justify-content: center;
                align-content: flex-start;
            }

            .back-link {
                display: block;
                margin-left: 10px;
                height: 20px;
                text-decoration: none;
                color: #000;
            }

            #content {
                display: flex;
                max-width: 1300px;
                width: 100%;
                justify-content: space-between;
            }

            #cart {
                background-color: white;
                margin: 50px 20px 0 10px;
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
                margin-top: 50px;
                margin-bottom: 50px;
                background-color: white;
                width: 70%;
                padding: 40px;
                /*border-radius: 10px;*/
                height: auto;
            }

            .pic {
                width: 300px;
                height: 300px;
                object-fit: cover;
            }

            #mota {
                margin: 20px;
            }

            h1 {
                font-size: 2rem;
                margin-bottom: 10px;
            }

            p {
                font-size: 1.2rem;
                margin-bottom: 20px;
            }

            label {
                display: inline-block;
                margin-right: 10px;
                font-size: 1.2rem;
            }

            input[type="number"] {
                width: 50px;
                height: 30px;
                font-size: 1.2rem;
            }

            #addToCartButton {
                background-color: #ff9900;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1.2rem;
                margin-top: 20px;
            }

            #card h2 {
                font-size: 2rem;
                margin-bottom: 20px;
            }

            #cartContent {
                margin-bottom: 20px;
                overflow-y: auto;
                height: 420px;
            }

            #orderForm input[type="submit"] {
                background-color: #ff9900;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1.2rem;
                margin-top: 20px;
            }

            .commentDish {
                display: flex; /* Sử dụng flexbox để căn chỉnh nội dung */
            }

            .commentDish a {
                display: flex; /* Sử dụng flexbox cho các liên kết */
                align-items: center; /* Căn dọc nội dung */
                text-decoration: none; /* Loại bỏ gạch chân */
            }

            .commentDish img {
                margin-right: 10px; /* Khoảng cách giữa ảnh và nội dung */
            }

            .commentDish div {
                flex: 1; /* Phần tử div lấp đầy không gian trống */
            }
            .commentDish {
                display: flex;
                margin-top: 20px;
                padding: 20px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                border-radius: 20px;
                background-color: #fff;
                flex-shrink: 0;
            }

            .commentDish img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin-right: 20px;
                border-radius: 10px;
            }

            .commentDish h3 {
                font-size: 1.5rem;
                margin-bottom: 10px;
            }

            .commentDish p {
                font-size: 1rem;
                margin-bottom: 10px;
            }
            .commentDish a {
                color: black; /* Đặt màu chữ là màu đen */
                text-decoration: none; /* Loại bỏ gạch chân mặc định */
            }

            .commentDish a:hover {
                text-decoration: underline; /* Gạch chân khi di chuột qua */
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
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            DishManager dm = new DishManager();
            Dish dish = dm.getDishById(id);
            int accountId = dish.getAccount().getAccount_id(); 
        %>

        <jsp:include page="path/header.jsp"/>
        <div id="container">
            <div id="content">
                <div id="dish">
                    <a href="CustomerDinerPage?id=<%=dish.getAccount().getAccount_id()%>" class="back-link">BACK</a>
                    <div style="display: flex;">
                        <img class="pic" src="<%=dish.getPicture()%>">
                        <div id="mota">
                            <h1 id="dishName"><%=dish.getName()%></h1>
                            <p>Description: <%=dish.getDescription()%></p>
                            <p>Price: <%=dish.getPrice()%> VNĐ</p>
                            <div>
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" max="100">
                                <br><br>
                                <input type="button" value="Add to cart" id="addToCartButton">
                            </div>
                        </div>
                    </div>
                    <!-- Additional Dishes -->
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
                                if (comment.getDish() != null && comment.getDish().getDish_id() == id) {
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
                <div id="cart">
                    <h2>Cart</h2>
                    <div id="cartContent"></div>
                    <form action="OrderServlet" method="post" id="orderForm">
                        <input type="hidden" id="dishId" name="dishId" value="<%=id%>">
                        <input type="hidden" id="dishQuantity" name="dishQuantity">
                        <input type="hidden" id="totalCost" name="totalCost">
                        <input type="hidden" id="accountId" name="accountId" value="<%=accountId%>">
                        <input type="submit" value="Order">
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
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
        <script>
            document.getElementById('addToCartButton').addEventListener('click', function () {
                var dishId = '<%=id%>';
                var dishName = '<%=dish.getName()%>';
                var dishPrice = parseFloat('<%=dish.getPrice()%>');
                var dishImage = '<%=dish.getPicture()%>'; // Thêm thuộc tính dishImage
                var quantityValue = document.getElementById('quantity').value;

                // Kiểm tra nếu giá trị nhập vào không hợp lệ
                if (quantityValue === '' || isNaN(quantityValue) || parseInt(quantityValue) <= 0) {
                    alert('Please enter a valid quantity');
                    return;
                }

                var quantity = parseInt(quantityValue);

                var cartItem = {
                    dishId: dishId,
                    dishName: dishName,
                    dishPrice: dishPrice,
                    dishImage: dishImage, // Thêm thuộc tính dishImage
                    quantity: quantity
                };

                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                var itemExists = false;

                // Kiểm tra xem món hàng đã tồn tại trong giỏ hàng chưa
                cart.forEach(function (item) {
                    if (item.dishId === dishId) {
                        item.quantity += cartItem.quantity;
                        itemExists = true;
                    }
                });

                if (!itemExists) {
                    cart.push(cartItem);
                }

                localStorage.setItem('cart', JSON.stringify(cart));
                displayCartItems();
            });

            function displayCartItems() {
                var cartContent = document.getElementById('cartContent');
                cartContent.innerHTML = '';

                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                var totalCost = 0;

                cart.forEach(function (item, index) {
                    var newItem = document.createElement('div');
                    newItem.style.display = "flex";
                    newItem.style.alignItems = "center";
                    newItem.style.marginBottom = "10px";
                    newItem.style.border = "2px solid black";
                    newItem.style.borderRadius = "10px";
                    newItem.style.padding = "10px";

                    // Hiển thị hình ảnh món hàng
                    var dishImage = document.createElement('img');
                    dishImage.src = item.dishImage;
                    dishImage.style.width = "50px";
                    dishImage.style.height = "50px";
                    dishImage.style.objectFit = "cover";
                    dishImage.style.marginRight = "10px";
                    dishImage.style.borderRadius = "5px";
                    newItem.appendChild(dishImage);

                    var dishDetails = document.createElement('div');
                    dishDetails.style.flex = "1";

                    var dishName = document.createElement('div');
                    dishName.textContent = item.dishName;
                    dishDetails.appendChild(dishName);

                    var quantity = document.createElement('div');
                    quantity.textContent = " - Quantity: " + item.quantity;
                    dishDetails.appendChild(quantity);

                    newItem.appendChild(dishDetails);

                    // Tính tổng giá tiền của mỗi món hàng và cập nhật vào biến totalCost
                    var itemCost = item.dishPrice * item.quantity;
                    totalCost += itemCost;

                    // Hiển thị giá tiền của mỗi món hàng
                    var cost = document.createElement('div');
                    cost.textContent = " - Cost: $" + itemCost.toFixed(2);
                    dishDetails.appendChild(cost);

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
                    newItem.appendChild(deleteButton);

                    cartContent.appendChild(newItem);
                });

                var totalElement = document.createElement('div');
                totalElement.textContent = "Total Cost: $" + totalCost.toFixed(2);
                cartContent.appendChild(totalElement);
            }

            function deleteCartItem(index) {
                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart.splice(index, 1);
                localStorage.setItem('cart', JSON.stringify(cart));
                displayCartItems();
            }

            window.onload = function () {
                displayCartItems();
            };

            document.getElementById('orderForm').addEventListener('submit', function (event) {
                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                if (cart.length === 0) {
                    alert('Please add the dish to the cart first');
                    event.preventDefault();
                    return;
                }

                var form = document.getElementById('orderForm');
                cart.forEach(function (item, index) {
                    var inputId = document.createElement('input');
                    inputId.type = 'hidden';
                    inputId.name = 'dishId' + index;
                    inputId.value = item.dishId;

                    var inputName = document.createElement('input');
                    inputName.type = 'hidden';
                    inputName.name = 'dishName' + index;
                    inputName.value = item.dishName;

                    var inputQuantity = document.createElement('input');
                    inputQuantity.type = 'hidden';
                    inputQuantity.name = 'dishQuantity' + index;
                    inputQuantity.value = item.quantity;

                    form.appendChild(inputId);
                    form.appendChild(inputName);
                    form.appendChild(inputQuantity);
                });

                var totalCost = 0;
                cart.forEach(function (item) {
                    totalCost += item.dishPrice * item.quantity;
                });

                document.getElementById('totalCost').value = totalCost.toFixed(2);
                localStorage.removeItem('cart');
            });

        </script>
    </body>
</html>
