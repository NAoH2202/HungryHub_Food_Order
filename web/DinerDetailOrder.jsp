<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderItemManager, model.OrderItem"%>
<%@page import="model.OrderManager, model.Order"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>
    <link rel="stylesheet" href="path/to/bootstrap.css">
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
        .item_container {
            display: flex;
            justify-content: space-between;
            width: 100%;
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
            max-width: 500px;
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
        .button-cancel {
            background-color: #d9534f;
        }
        .button-cancel:hover {
            background-color: #c82333;
        }
           .accept-button {
          
               height: 45px;
            margin: 20px 0;
            margin-left:250px; 
            padding: 10px 20px;
                background-color: #007bff;
                color: white;
            }
            .accept-button:hover {
                background-color: #0056b3;
            }
            .cancel-button {
                height: 45px;
            margin: 20px 0;
            padding: 10px 20px;
                background-color: #dc3545;
                color: white;
            }
            .cancel-button:hover {
                background-color: #c82333;
            }
    </style>
</head>
<body>
    <jsp:include page="path/dinerheader.jsp"/>
    <%
        Account acc = (Account) session.getAttribute("account");
        if (acc == null) {
            response.sendRedirect("LoginServlet");
            return;
        }

        String orderId = request.getParameter("orderId");
        OrderManager om = new OrderManager();
        OrderItemManager oim = new OrderItemManager();
        Order order = om.getOderById(Integer.parseInt(orderId));

        if (order == null || order.getDiner().getAccount_id() != acc.getAccount_id()) {
            out.println("<h2>Đơn hàng không tồn tại hoặc bạn không có quyền truy cập!</h2>");
            return;
        }

        ArrayList<OrderItem> orderItems = oim.getOderItemByOrderId(order.getOrder_id());
        int totalPrice = oim.getTotalPrice(orderItems);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    %>
    <div class="body_local">
        <div class="container_local2">
            <h1>Chi Tiết Đơn Hàng - ID: <%= order.getOrder_id() %></h1>
            <div class="order-info">
                <h2>Thông Tin Đơn Hàng</h2>
                <p>Mã Đơn Hàng: <strong>#<%= order.getOrder_id() %></strong></p>
                <p>Ngày Đặt: <strong><%= order.getCreated_at().format(formatter) %></strong></p>
                <p>Trạng Thái Thanh Toán: <strong><%= order.isPayment_status() ? "Đã thanh toán" : "Chưa thanh toán" %></strong></p>
            </div>

            <div class="order-info">
                <h2>Danh Sách Món Ăn</h2>
                <%
                    for (OrderItem item : orderItems) {
                %>
                <div class="item_container">
                    <div class="order-item">
                        <img src="<%= item.getDishPicture() %>" alt="<%= item.getDishName() %>">
                        <div class="item-details">
                            <div class="item-name"><%= item.getDishName() %></div>
                            <div class="item-description">Mô tả: <%= item.getDishDescription() %></div>
                            <div class="item-price">Giá: <%= item.getDishPrice() %>₫</div>
                            <div class="item-quantity">Số lượng: <%= item.getQuantity() %></div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <div class="total-price">
                Tổng Cộng: <strong><%= order.getTotal_priceString() %>₫</strong>
            </div>
            <div style="display: flex; justify-content: space-between">
                <a href="DinerOrderPage" class="button">Quay Lại Danh Sách Đơn Hàng</a>
                <button class="accept-button" onclick="updateOrderStatus('<%=order.getOrder_id()%>', 'Ready');sendStatus('Ready')">Chấp nhận</button>
               <button class="cancel-button" onclick="updateOrderStatus('<%=order.getOrder_id()%>', 'Canceled')">Hủy bỏ</button>
            </div>
        </div>
    </div>
    <jsp:include page="path/footer.jsp"/>
            <script type="text/javascript">
            var ws;

            function connect() {
                ws = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/orderStatus");

                ws.onopen = function () {
                    console.log("Connected to WebSocket");
                };

                ws.onmessage = function (event) {
                    console.log("Received message: " + event.data);
                };

                ws.onclose = function () {
                    console.log("Disconnected from WebSocket");
                };
            }

            function sendStatus(status) {
                if (ws && ws.readyState === WebSocket.OPEN) {
                    const statusData = {
                        status: status,
                        shipperId: "1", // Ensure this variable is set correctly in your JSP
                        shipperName: "mnp" // Ensure this variable is set correctly in your JSP
                    };
                    ws.send(JSON.stringify(statusData));
                } else {
                    console.log("WebSocket is not connected.");
                }
            }


            window.onload = connect;
        </script>
        <script>
            function updateOrderStatus(orderId, newStatus) {
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = 'UpdateOrderStatusServlet';

                var inputOrderId = document.createElement('input');
                inputOrderId.type = 'hidden';
                inputOrderId.name = 'order_id';
                inputOrderId.value = orderId;
                form.appendChild(inputOrderId);

                var inputNewStatus = document.createElement('input');
                inputNewStatus.type = 'hidden';
                inputNewStatus.name = 'new_status';
                inputNewStatus.value = newStatus;
                form.appendChild(inputNewStatus);

                document.body.appendChild(form);
                form.submit();
            }

            document.querySelectorAll('.item-status').forEach(function (statusItem) {
                statusItem.addEventListener('click', function () {
                    var selected = statusItem.getAttribute('selected');
                    document.querySelectorAll('.item-status').forEach(function (item) {
                        item.classList.remove('active-os');
                    });
                    statusItem.classList.add('active-os');
                    document.querySelectorAll('.box').forEach(function (box) {
                        if (box.getAttribute('content') === selected) {
                            box.style.display = 'block';
                        } else {
                            box.style.display = 'none';
                        }
                    });
                });
            });
        </script>
</body>
</html>
