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
            DishManager em = new DishManager();
            Dish dish = em.getDishById(id);
            int accountId = dish.getAccount().getAccount_id(); 
          
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
                            }
                        %>
                        <div class="comments-section">
                            <h2>Comments</h2>
                            <!-- Comments will go here -->
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
        </div>

        <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->

        <!-- jQuery -->
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
