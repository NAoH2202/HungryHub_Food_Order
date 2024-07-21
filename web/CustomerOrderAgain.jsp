<%-- 
    Document   : CustomerOrderAgain
    Created on : Jul 15, 2024, 7:57:46 PM
    Author     : lenovo
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderItemManager, model.OrderItem, model.OrderItemDao"%>
<%@page import="model.OrderManager, model.Order, model.OrderDao"%>
<%@page import="model.Account, model.AccountManager, model.AccountDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Đơn Hàng Thức Ăn</title>
        <style>
            .body_local {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }
            .container_local2 {
                max-width: 800px;
                margin: auto;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .order-info {
                margin: 20px 0;
            }
            .order-info h2 {
                color: #555;
            }
            .order-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
            }
            .item_container{
                display: flex;
                justify-content: space-between;
                width: 100%;
                border-bottom: 1px solid #eaeaea;
            }
            .order-item img {
                width: 100px;
                height: 100px;
                border-radius: 8px;
                margin-right: 20px;
            }
            .item-details {
                flex-grow: 1;
            }
            .item-name {
                font-weight: bold;
                color: #333;
                font-size: 1.2em;
            }
            .item-description {
                color: #777;
                margin: 5px 0;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 500px; /* Bạn có thể điều chỉnh giá trị này */
            }
            .item-price {
                color: #d9534f;
                font-weight: bold;
            }
            .total-price {
                font-size: 1.5em;
                color: #d9534f;
                text-align: right;
                margin-top: 20px;
            }
            .button {
                display: inline-block;
                height: 45px;
                margin: 20px 0;
                padding: 10px 20px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                text-align: center;
            }
            .button:hover {
                background-color: #4cae4c;
            }
        </style>
    </head>
    <body>
        <jsp:include page="path/header.jsp"/>
        <%
            String id = request.getParameter("id");
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            if (id == null) {
                response.sendRedirect("CustomerOrderPage");
                return;
            }
            OrderManager om = new OrderManager();
            Order currentOrder = om.getOderById(Integer.parseInt(id));
            OrderItemManager oIm = new OrderItemManager();
            ArrayList<OrderItem> oiList = oIm.getOderItemByOrderId(currentOrder.getOrder_id());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        %>
        <div class="body_local">
            <div class="container_local2">
                <h1>Chi Tiết Đơn Hàng</h1>
                <div class="order-info">
                    <h2>Thông Tin Đơn Hàng</h2>
                    <p>Mã Đơn Hàng: <strong>#<%= currentOrder.getOrder_id()%></strong></p>
                    <p>Ngày Đặt: <strong><%= currentOrder.getCreated_at().format(formatter)%></strong></p>
                    <p>Trạng Thái Thanh Toán: <strong><%= currentOrder.isPayment_status() ? "Đã thanh toán" : "Chưa thanh toán"%></strong></p>
                </div>

                <div class="order-info">
                    <h2>Danh Sách Món Ăn</h2>
                    <%
                        for (OrderItem orderItem : oiList) {
                    %>
                    <div class="item_container">
                        <div class="order-item">
                            <img src="<%= orderItem.getDishPicture()%>" alt="Pizza Margherita">
                            <div class="item-details">
                                <div class="item-name"><%= orderItem.getDishName()%></div>
                                <div class="item-description">Mô tả: <%= orderItem.getDishDescription()%></div>
                                <div class="item-price">Giá: <%= orderItem.getDishPrice()%> VNĐ</div>
                                <div class="item-quantity">Số lượng: <%= orderItem.getQuantity()%></div>
                            </div>
                        </div>
                        <div style="display: flex;align-content: center;">
                            <button class="button" style="background-color: #DD0000"> Xóa </button>
                        </div>
                    </div>
                    <%
                        }%>
                </div>

                <div class="total-price">
                    Tổng Cộng: <strong><%= currentOrder.getTotal_priceString()%></strong>
                </div>
                <div style="display: flex; justify-content: space-between">
                    <a href="CustomerOrderPage" class="button" >Quay Lại Trang Chính</a>
                    <a href="#" class="button" style="background-color: #0033CC">Đặt hàng</a>
                </div>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>


