<%-- 
    Document   : Order.jsp
    Created on : May 19, 2024, 11:05:11 AM
    Author     : lenovo
--%>

<%@page import="model.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderItemManager"%>
<%@page import="model.Order"%>
<%@page import="model.OrderManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #content{
                background-color: white;
                margin-top: 30px;
                margin-bottom: 30px;
                border-radius: 10px;
                min-width: 600px;
            }
            .section-yellow{
                display:flex;
                justify-content: center;
            }
            .section-white{
                min-height: 500px;
                padding: 30px;
            }
            .showing-container {
                display: inline-flex;
                justify-content: space-between;
                list-style: none;
                padding: 0;
            }
            .item-status {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin: 20px;
                width: 120px;
                padding: 20px;
                padding-left: 10px;
                padding-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                flex-basis: 20%;
                transition: transform 0.3s ease;
            }

            .item-status:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }
            .active-os {
                background-color: #ffeb3b;
                color: #333;
            }
            /* Định dạng cho toàn bộ thẻ order-summary */
            .order-summary {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 16px;
                background-color: #f9f9f9;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }

            /* Định dạng cho thẻ hiển thị thông tin đơn hàng đầu tiên */
            .order-item {
                display: flex;
                align-items: center;
                margin-bottom: 12px;
            }

            .product-image {
                width: 50px;
                height: 50px;
                margin-right: 12px;
                border-radius: 4px;
            }

            .product-info {
                flex: 1;
            }

            .product-name {
                font-size: 14px;
                font-weight: bold;
                margin: 0;
            }

            .product-quantity-price {
                font-size: 12px;
                color: #666;
                margin: 4px 0 0 0;
            }

            /* Định dạng cho thẻ hiển thị tổng số lượng và tổng tiền */
            .order-total {
                margin-bottom: 12px;
            }

            .order-total p {
                font-size: 14px;
                margin: 4px 0;
            }

            /* Định dạng cho thẻ chứa nút "Mua lại" */
            .order-actions {
                text-align: right;
            }

            .reorder-button {
                background-color: #28a745;
                color: white;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }

            .reorder-button:hover {
                background-color: #218838;
            }
            .noselect {
                -webkit-user-select: none; /* Chrome, Safari, Opera */
                -moz-user-select: none;    /* Firefox */
                -ms-user-select: none;     /* Internet Explorer/Edge */
                user-select: none;         /* Non-prefixed version, hiện tại là chuẩn */
            }
        </style>
    </head>
    <body style="background-color: #dddddd;">
        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            String name = acc.getName();
        %>
        <jsp:include page="path/header.jsp"/>
        <div class="container">
            <div id="content">
                <section class="section-yellow" style="border-radius: 20px">
                    <ul class="showing-container">
                        <li class="item-status available active-os" data-selected="1">
                            <div class="statusOrder noselect">Xác nhận</div>
                        </li>
                        <li class="item-status available" data-selected="2">
                            <div class="statusOrder noselect">Đang Nấu</div>
                        </li>
                        <li class="item-status available" data-selected="3">
                            <div class="statusOrder noselect">Sẵn sàng</div>
                        </li>
                        <li class="item-status available" data-selected="4">
                            <div class="statusOrder noselect">Đang giao</div>
                        </li>
                        <li class="item-status available" data-selected="5">
                            <div class="statusOrder noselect">Hoàn thành</div>
                        </li>
                        <li class="item-status available" data-selected="6">
                            <div class="statusOrder noselect">Đã hủy</div>
                        </li>
                    </ul>
                </section>
                <div class="contentBot">
                    <section class="section-white">
                        <div class="box" data-content="1">
                            <div class="row">
                                <%
                                    OrderManager om = new OrderManager();
                                    OrderItemManager oim = new OrderItemManager();
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("Checking")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <button class="reorder-button" onclick="window.location.href = 'CustomerTrackingOrder?id=<%=od.getOrder_id()%>'">Theo dõi</button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="box" data-content="2" style="display: none">
                            <div class="row">
                                <%
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("Preparing")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <button class="reorder-button" onclick="window.location.href = 'CustomerTrackingOrder?id=<%=od.getOrder_id()%>'">Theo dõi</button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="box" data-content="3" style="display: none">
                            <div class="row">
                                <%
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("Ready")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <button class="reorder-button" onclick="window.location.href = 'CustomerTrackingOrder?id=<%=od.getOrder_id()%>'">Theo dõi</button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="box" data-content="4" style="display: none">
                            <div class="row">
                                <%
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("OntheWay")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <form action="CustomerTrackingOrder" method="POST">
                                                <input type="hidden" name="id" value="<%=od.getOrder_id()%>" />
                                                <input type="hidden" name="recipientId" value="<%=od.getShipper().getAccount_id()%>" />
                                                <input type="hidden" name="recipient" value="<%=od.getShipper().getName()%>" />
                                                <button class="reorder-button" type="submit">Theo dõi</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="box" data-content="5" style="display: none">
                            <div class="row">
                                <%
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("Completed")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <button class="reorder-button">Mua lại</button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div class="box" data-content="6" style="display: none">
                            <div class="row">
                                <%
                                    for (Order od : om.getList()) {
                                        if (od.getOrder_status().equalsIgnoreCase("canceled")) {
                                            ArrayList<OrderItem> oiList = oim.getOderItemByOrderId(od.getOrder_id());
                                            if (oiList != null && !oiList.isEmpty()) {
                                                OrderItem odi = oiList.get(0);
                                                int totalQuantity = oiList.size();
                                                int totalPrice = oim.getTotalPrice(oiList);
                                %>
                                <div class="col-sm-12 col-md-4">
                                    <div class="order-summary">
                                        <div class="order-item">
                                            <img src="<%=odi.getDishPicture() != null ? odi.getDishPicture() : "default_image_path.jpg"%>" alt="Product Image" class="product-image">
                                            <div class="product-info">
                                                <a href="#"><p class="product-name"><%=odi.getDishName()%></p></a>
                                                <p class="product-quantity-price">Số lượng: <%=odi.getQuantity()%> | Giá: <%=odi.getPrice()%>₫</p>
                                            </div>
                                        </div>
                                        <div class="order-total">
                                            <p>Tổng số lượng món: <%=totalQuantity%></p>
                                            <p>Tổng tiền: <%=totalPrice%>₫</p>
                                        </div>
                                        <div class="order-actions">
                                            <button class="reorder-button">Mua lại</button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
        <script>
            var dayShowingItems = document.querySelectorAll('.item-status');
            dayShowingItems.forEach(function (item) {
                item.addEventListener('click', function () {
                    dayShowingItems.forEach(function (item) {
                        item.classList.remove('active-os');
                    });
                    this.classList.add('active-os');

                    var selected = this.dataset.selected;
                    var movieTimeLines = document.querySelectorAll('.box');

                    movieTimeLines.forEach(function (movieTimeLine) {
                        var content = movieTimeLine.dataset.content;
                        if (content === selected) {
                            movieTimeLine.style.display = 'block';
                        } else {
                            movieTimeLine.style.display = 'none';
                        }
                    });
                });
            });
        </script>
    </body>
</html>
