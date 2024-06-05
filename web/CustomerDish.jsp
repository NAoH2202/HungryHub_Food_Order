<%-- 
    Document   : Dish
    Created on : May 19, 2024, 11:03:27 PM
    Author     : lenovo
--%>

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
                background-color: #ffffcc;
                margin: 100px 20px 0 10px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 20%;
                height: 500px;
                margin-left: 20px;
                padding: 20px;
            }
            #dish {
                margin: 100px 20px 0 0;
                background-color: #f9f6ec;
                flex-direction: column;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                padding: 40px;
            }
            .pic {
                width: 300px;
                height: 300px;
                object-fit: cover;
            }
            #mota {
                margin: 20px;
            }
        </style>
    </head>
    <body>
        <%int id = Integer.parseInt(request.getParameter("id"));
            DishManager dm = new DishManager();
            Dish dish = dm.getDishById(id);

        %>
        <!-- header section strats -->
        <header class="header_section" style="background-color: black">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="HomePage">
                        <span>
                            HungryHub
                        </span>
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav  mx-auto ">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="menu.jsp">Menu</a>
                            </li>
                            <li class="nav-item">
                                <%  Account acc = (Account) session.getAttribute("account");
                                    String url, name;
                                    if (acc == null) {
                                        url = "about.jsp";
                                        name = "about";
                                    } else {
                                        url = "CustomerOrderPage";
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
                            <form class="form-inline">
                                <div class="menu">
                                    <form action="SearchServlet" method="get">
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
                                <input type="button" value="Add to card" id="addToCardButton">
                            </div>
                        </div>
                    </div>
                    <div>
                        <h2>COMMENT</h2>
                    </div>
                </div>
                <div id="card">
                    <h2>CARD</h2>
                    <div id="cardContent"></div>
                    <form action="OrderServlet" method="post">
                        <input type="submit" value="Order">
                    </form>
                </div>
            </div>
        </div>
        <script>
            document.getElementById('addToCardButton').addEventListener('click', function () {
                // Lấy thông tin món ăn và số lượng
                var dishName = '<%=dish.getName()%>';
                var quantity = document.getElementById('quantity').value;

                // Kiểm tra số lượng hợp lệ
                if (quantity <= 0) {
                    alert('Please enter a valid quantity');
                    return;
                }

                // Tạo một phần tử mới để hiển thị món ăn và số lượng
                var cardContent = document.getElementById('cardContent');
                var newItem = document.createElement('div');
                newItem.textContent = dishName + ' - Quantity: ' + quantity;

                // Thêm phần tử mới vào card
                cardContent.appendChild(newItem);
            });
        </script>
    </body>
</html>
