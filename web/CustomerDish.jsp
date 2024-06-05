<%@page import="model.Account"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                width: 100%;
            }

            #container {
                /*                background-color: #ffffcc;*/
                background-color: #dddddd;
                display: flex;
                justify-content: center;
                align-content: flex-start;
                width: 100%;
                height: 100%;
            }

            #content {
                display: flex;
                justify-content: center;
                width: 100%;
            }

            #card {
                background-color: white;
                margin: 50px 20px 0 10px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 30%;
                height: 600px;
                margin-left: 20px;
                padding: 20px;
                border-radius: 40px;
            }

            #dish {
                margin: 50px 10px 0 0;
                background-color: white;
                flex-direction: column;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                padding: 40px;
                /*                border-radius: 40px;*/
                overflow-y: auto;
                max-height: 1000px;
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

            #cardContent {
                margin-bottom: 20px;


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
        </style>
    </head>
    <body>
        <%int id = Integer.parseInt(request.getParameter("id"));
            DishManager dm = new DishManager();
            Dish dish = dm.getDishById(id);
        %>
        <header class="header_section" style="background-color: black">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container">
                    <a class="navbar-brand" href="index.jsp">
                        <span>HungryHub</span>
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="menu.jsp">Menu</a>
                            </li>
                            <li class="nav-item">
                                <%
                                    Account acc = (Account) session.getAttribute("account");
                                    String url, name;
                                    if (acc == null) {
                                        url = "about.jsp";
                                        name = "about";
                                    } else {
                                        url = "Order.jsp";
                                        name = acc.getName() + "'s Order";
                                    }
                                %>
                                <a class="nav-link" href="<%=url%>"><%=name%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="book.jsp">Book Table</a>
                            </li>
                        </ul>
                        <div class="user_option">
                            <a href="" class="user_link">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </a>
                            <a class="cart_link" href="#">
                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                <g>
                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                </g>
                                </g>
                                <g>
                                <g>
                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                </g>
                                </g>
                                <g>
                                <g>
                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.184,1.024-51.712,26.112-50.688,55.296c1.024,28.16,24.576,50.688,52.736,50.688h1.024C194.56,443.838,216.064,419.262,215.04,389.55z" />
                                </g>
                                </g>
                                </svg>
                            </a>
                            <form class="form-inline">
                                <div class="form-group">
                                    <form class="form-inline" action="search.jsp">
                                        <input type="text" name="nameMovie" placeholder="Search...">
                                        <button style="background-color: #ff9900;"><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </form>
                            <a href="login.jsp" class="order_online">
                                Login
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <div id="container">
            <a href="index.jsp" style="height: 20px;display: block;margin: 10px ">BACK</a>
            <div id="content">
                <div id="dish">
                    <div style="display: flex;">
                        <img class="pic" src="<%=dish.getPicture()%>">
                        <div id="mota">
                            <h1 id="dishName"><%=dish.getName()%></h1>
                            <p>Description: <%=dish.getDescription()%></p>
                            <p>Price: <%=dish.getPrice()%></p>
                            <div>
                                <label for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" min="1" max="100">
                                <br><br>
                                <input type="button" value="Add to cart" id="addToCartButton">
                            </div>
                        </div>
                    </div>
                    <div>
                        <h2>COMMENT</h2>
                        <!-- Additional Dishes -->
                        <div class="commentDish">
                            <a href="#">
                                <img src="images/buncha.jpg" alt="Dish 1">
                                <div>
                                    <h3>Dish 1 Name</h3>
                                    <p>Description: Delicious dish 1 description.</p>
                                    <p>Price: $10.00</p>
                                </div>
                            </a>
                        </div>
                        <div class="commentDish">
                            <a href="#">
                                <img src="images/chethai.jpg"  alt="Dish 2">
                                <div>
                                    <h3>Dish 2 Name</h3>
                                    <p>Description: Delicious dish 2 description.</p>
                                    <p>Price: $12.00</p>
                                </div>
                            </a>
                        </div>
                        <div class="commentDish">
                            <a href="#">
                                <img src="images/goicuon.jpg"  alt="Dish 3">
                                <div>
                                    <h3>Dish 3 Name</h3>
                                    <p>Description: Delicious dish 3 description.</p>
                                    <p>Price: $15.00</p>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>
                <div id="card">
                    <h2>CARD</h2>
                    <div id="cardContent"></div>
                    <form action="OrderServlet" method="post" id="orderForm" >
                        <input type="hidden" id="dishId" name="dishId" value="<%=id%>" style=" border-radius: 10px 15px 20px 25px; border: 3px solid black;">
                        <input type="hidden" id="dishQuantity" name="dishQuantity">
                        <input type="submit" value="Order">
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.getElementById('addToCartButton').addEventListener('click', function () {
                var dishId = '<%=id%>';
                var dishName = '<%=dish.getName()%>';
                var quantityValue = document.getElementById('quantity').value;

                // Check if the quantity input is empty or not a number
                if (quantityValue === '' || isNaN(quantityValue) || parseInt(quantityValue) <= 0) {
                    alert('Please enter a valid quantity');
                    return;
                }

                var quantity = parseInt(quantityValue);

                var cartItem = {
                    dishId: dishId,
                    dishName: dishName,
                    dishImage: "<%=dish.getPicture()%>",
                    quantity: quantity
                };

                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                var itemExists = false;

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
                var cartContent = document.getElementById('cardContent');
                cartContent.innerHTML = '';

                var cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart.forEach(function (item) {
                    var newItem = document.createElement('div');
                    newItem.style.display = "flex";
                    newItem.style.alignItems = "center";
                    newItem.style.marginBottom = "10px";
                    newItem.style.border = "2px solid black";
                    newItem.style.borderRadius = "10px";
                    newItem.style.padding = "10px";

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

                    cartContent.appendChild(newItem);
                });
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

                localStorage.removeItem('cart');
            });
        </script>



    </body>
</html>
