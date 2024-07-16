<%-- 
    Document   : CustomerOrderAgain
    Created on : Jul 15, 2024, 7:57:46 PM
    Author     : lenovo
--%>
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
                border-bottom: 1px solid #eaeaea;
                padding: 10px 0;
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
            if(account == null){
                response.sendRedirect("LoginServlet");
                return;
            }
            if(id == null){
                response.sendRedirect("CustomerOrderPage");
                return;
            }
            OrderManager om = new OrderManager();
            Order currentOrder = om.getOderById(Integer.parseInt(id));
            OrderItemManager oIm = new OrderItemManager();
            ArrayList<OrderItem> oiList = oIm.getOderItemByOrderId(currentOrder.getOrder_id());
        %>
        <div class="body_local">
            <div class="container_local2">
                <h1>Chi Tiết Đơn Hàng</h1>
                <div class="order-info">
                    <h2>Thông Tin Đơn Hàng</h2>
                    <p>Mã Đơn Hàng: <strong>#123456</strong></p>
                    <p>Ngày Đặt: <strong>15/07/2024</strong></p>
                    <p>Trạng Thái Thanh Toán: <strong>Chưa thanh toán</strong></p>
                </div>

                <div class="order-info">
                    <h2>Danh Sách Món Ăn</h2>
                    <div class="order-item">
                        <img src="path/to/pizza.jpg" alt="Pizza Margherita">
                        <div class="item-details">
                            <div class="item-name">Pizza Margherita</div>
                            <div class="item-description">Mô tả: Bánh pizza với phô mai mozzarella và cà chua tươi. Một món ăn truyền thống Ý rất ngon và được ưa chuộng khắp thế giới.</div>
                            <div class="item-price">Giá: 150,000 VNĐ</div>
                            <div class="item-quantity">Số lượng: 2</div>
                        </div>
                    </div>
                    <div class="order-item">
                        <img src="path/to/salad.jpg" alt="Salad Caesar">
                        <div class="item-details">
                            <div class="item-name">Salad Caesar</div>
                            <div class="item-description">Mô tả: Salad với rau xà lách Romaine, phô mai Parmesan và sốt Caesar. Một lựa chọn tuyệt vời cho bữa ăn nhẹ.</div>
                            <div class="item-price">Giá: 80,000 VNĐ</div>
                            <div class="item-quantity">Số lượng: 1</div>
                        </div>
                    </div>
                </div>

                <div class="total-price">
                    Tổng Cộng: <strong>380,000 VNĐ</strong>
                </div>

                <a href="#" class="button">Quay Lại Trang Chính</a>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>


