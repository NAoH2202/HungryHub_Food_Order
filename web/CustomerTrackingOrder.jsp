<%@page import="model.Chat"%>
<%@page import="model.ChatManager"%>
<%@page import="model.Account"%>
<%@page import="model.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderItemManager"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Order"%>
<%@page import="model.OrderManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getParameter("id") == null) {
        response.sendRedirect("CustomerOrderPage");
        return;
    }
    int id = Integer.parseInt(request.getParameter("id"));
    OrderManager om = new OrderManager();
    OrderItemManager oIm = new OrderItemManager();
    Order currentOrder = om.getOderById(id);
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    ArrayList<OrderItem> oiList = oIm.getOderItemByOrderId(id);
    int Price = oIm.getTotalPrice(oiList);
    if (session == null || session.getAttribute("account") == null) {
        response.sendRedirect("LoginServlet");
        return;
    }
    Account account = (Account) session.getAttribute("account");
    String currentUser = account.getName();
    int currentUserId = account.getAccount_id(); // Assuming userId is stored in session
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/chatStyle.css">
        <style>
            @media (max-width: 768px) {
                .order-tracker {
                    width: 95%;
                    padding: 10px;
                }
                .circle {
                    width: 30px;
                    height: 30px;
                    font-size: 16px;
                    margin-right: 15px;
                }

                .label {
                    font-size: 16px;
                }

                .time {
                    font-size: 12px;
                }

                .step:before {
                    left: 15px;
                }
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            header {
                background-color: #4CAF50;
                color: white;
                padding: 20px 0;
            }

            main {
                flex: 1;
                justify-content: center;
                align-items: stretch;
                padding: 20px;
            }

            .order-tracker {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                background-color: #33CC00;
                min-height: 500px;
                border-radius: 10px 0 0 10px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                max-width: 500px;
                padding: 20px;
            }

            .tracker-header, .tracker-footer {
                text-align: center;
                padding: 10px 0;
            }

            .tracker-header {
                font-size: 20px;
                color: white;
                font-weight: bold;
                margin: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .tracker-header img {
                width: 50px;
                height: 50px;
                margin-right: 10px;
            }

            .tracker-footer {
                color: white;
                margin: 20px;
                font-size: 14px;
                color: #555;
            }

            .step {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                width: 100%;
                position: relative;
                transition: all 0.5s ease-in-out; /* Thêm transition để chuyển đổi mượt mà */
            }

            .step .circle {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #bbb;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                margin-right: 20px;
                position: relative;
                z-index: 1;
                transition: all 0.5s ease-in-out; /* Thêm transition để chuyển đổi mượt mà */
            }

            .step.active .circle {
                background-color: #4CAF50; /* Màu cho trạng thái hoạt động */
                box-shadow: 0 0 15px rgba(76, 175, 80, 0.6); /* Hiệu ứng phát sáng */
            }

            .step.active .label {
                font-weight: bold;
                color: black;
            }

            .step .label {
                color: white;
                font-size: 18px;
                flex: 1;
                transition: color 0.5s ease-in-out; /* Thêm transition để chuyển đổi mượt mà */
            }

            .step .time {
                color: white;
                font-size: 14px;
                color: #666;
            }

            .step:before {
                content: '';
                position: absolute;
                width: 2px;
                height: calc(100% + 20px);
                background-color: #bbb;
                top: -20px;
                left: 20px;
                z-index: 0;
                transition: background-color 0.5s ease-in-out; /* Thêm transition để chuyển đổi mượt mà */
            }

            .step.active:before {
                background-color: #4CAF50; /* Màu cho trạng thái hoạt động */
            }

            .step:first-child:before {
                height: 50%;
                top: 50%;
            }

            .step.active .circle::after {
                content: '';
                position: absolute;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                background-color: rgba(76, 175, 80, 0.3);
                animation: pulse 1.5s infinite;
                z-index: -1;
            }

            /* Hiệu ứng nhấp nháy cho trạng thái hiện tại */
            @keyframes pulse {
                0% {
                    transform: scale(1);
                    opacity: 1;
                }
                50% {
                    transform: scale(1.2);
                    opacity: 0.6;
                }
                100% {
                    transform: scale(1);
                    opacity: 1;
                }
            }


            .step:last-child {
                margin-bottom: 0;
            }

            .circle {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #bbb;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                margin-right: 20px;
                position: relative;
                z-index: 1;
            }

            .step.active .circle {
                background-color: #4CAF50;
            }

            .label {
                color: white;
                font-size: 18px;
                flex: 1;
            }

            .time {
                color: white;
                font-size: 14px;
                color: #666;
            }

            .step:before {
                content: '';
                position: absolute;
                width: 2px;
                height: calc(100% + 20px);
                background-color: #bbb;
                top: -20px;
                left: 20px;
                z-index: 0;
            }

            .step.active:before {
                background-color: #4CAF50;
            }

            .step:first-child:before {
                height: 50%;
                top: 50%;
            }

            .order-infor {
                background-color: white;
                border-radius: 0 10px 10px 0;
                min-height: 500px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                max-width: 500px;
                text-align: left;
            }
            .order-infor, .order-tracker{
                flex: 1;
            }

            .order-infor h2 {
                text-align: center;
                margin: 27px;
                color: #333;
                font-size: 2em;
            }

            .order-item {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 10px;
            }

            .item-details {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .item-details span {
                display: block;
                color: #555;
                font-size: 0.9em;
            }

            .item-image {
                width: 70px;
                height: 70px;
                border-radius: 5px;
                margin-right: 10px;
                object-fit: cover;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            }

            .item-total {
                text-align: right;
                font-weight: bold;
                color: #222;
            }

            .order-summary {
                text-align: right;
                font-size: 1.1em;
                font-weight: bold;
                color: #222;
            }

            .order-infor button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
            }

            .back_list{
                display: flex;
                justify-content: center;
            }

            .back_list button:hover {
                background-color: #45a049;
            }

            footer {
                background-color: #4CAF50;
                color: white;
                text-align: center;
                padding: 10px 0;
            }
            .tracker{
                width: 90%;
                margin: 20px;
            }
            .order-summary-top {
                text-align: left;
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 1px solid #ddd;
            }

            .order-summary p {
                font-size: 16px;
                color: #333;
                margin: 5px 0;
            }
            #chatContainer {
                width: 25%;
                max-width: 600px;
                max-height: 400px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                border-radius: 10px;

            }
        </style>
    </head>
    <body style="background-color: #dddddd;">
        <jsp:include page="path/header.jsp"/>
        <main style="display: flex;">
            <div class="order-tracker">
                <div class="tracker-header">
                    <img src="images/tick-icon.png" alt="Tick"> Cảm ơn bạn đã đặt hàng!
                </div>
                <div class="tracker">
                    <div class="step <%=currentOrder.getOrder_status().equals("Checking") || currentOrder.getOrder_status().equals("Preparing") || currentOrder.getOrder_status().equals("Ready") || currentOrder.getOrder_status().equals("OntheWay") || currentOrder.getOrder_status().equals("Completed") ? "active" : ""%>">
                        <div class="circle">1</div>
                        <div class="label">Đang kiểm tra</div>
                    </div>
                    <div class="step <%=currentOrder.getOrder_status().equals("Preparing") || currentOrder.getOrder_status().equals("Ready") || currentOrder.getOrder_status().equals("OntheWay") || currentOrder.getOrder_status().equals("Completed") ? "active" : ""%>">
                        <div class="circle">2</div>
                        <div class="label">Đang chuẩn bị</div>
                    </div>
                    <div class="step <%=currentOrder.getOrder_status().equals("Ready") || currentOrder.getOrder_status().equals("OntheWay") || currentOrder.getOrder_status().equals("Completed") ? "active" : ""%>">
                        <div class="circle">3</div>
                        <div class="label">Sẵn sàng giao</div>
                    </div>
                    <div class="step <%=currentOrder.getOrder_status().equals("OntheWay") || currentOrder.getOrder_status().equals("Completed") ? "active" : ""%>">
                        <div class="circle">4</div>
                        <div class="label">Đang giao hàng</div>
                    </div>
                    <div class="step <%=currentOrder.getOrder_status().equals("Completed") ? "active" : ""%>">
                        <div class="circle">5</div>
                        <div class="label">Đã giao hàng</div>
                    </div>
                </div>
                <div class="tracker-footer">
                    Xin lưu ý rằng thời gian giao hàng có thể thay đổi tùy thuộc vào điều kiện thực tế.
                </div>
            </div>

            <div class="order-infor">
                <h2>Thông tin Đơn hàng</h2>
                <div class="order-summary-top">
                    <p>Tên cửa hàng: <%=currentOrder.getDiner().getName()%></p>
                    <p>Ngày đặt hàng: <%=currentOrder.getCreated_at().format(formatter)%></p>
                    <p>Trạng thái: Đã thanh toán</p>
                </div>
                <%
                    for (OrderItem oi : oiList) {

                %>
                <div class="order-item">
                    <div class="item-details">
                        <img src="<%=oi.getDishPicture()%>" class="item-image">
                        <span class="item-name">Tên món ăn: <%= oi.getDishName()%></span>
                        <span class="item-quantity">Số lượng: <%=oi.getQuantity()%></span>
                        <span class="item-price">Giá: <%=oi.getDishPrice()%>₫</span>
                    </div>
                    <div class="item-total">
                        <span>Tổng cộng: <%=oi.getPrice()%>₫</span>
                    </div>
                </div>
                <%
                    }%>
                <div class="order-summary">
                    <span>Tổng đơn hàng: <%=Price%>₫</span>
                </div>
                <div class="back_list">
                    <button onclick="window.location.href = 'CustomerOrderPage'">Trở về danh sách đơn hàng</button>
                </div>
            </div>
            <%    if (currentOrder.getOrder_status().equalsIgnoreCase("OntheWay")) {
                    String recipient = (String) request.getParameter("recipient");
                    if (request.getParameter("recipientId") == null) {
                        response.sendRedirect("CustomerOrderPage");
                        return;
                    }
                    int recipientId = Integer.parseInt(request.getParameter("recipientId")); // Assuming recipientId is stored in session

                    ChatManager cm = new ChatManager();
                    ArrayList<Chat> chatHistory = cm.getChatHistory(currentUserId, recipientId);%>
            <script>
                let websocket;

                function connect2() {
                    websocket = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/chat");
                    websocket.onopen = function () {
                        console.log("Connected to the WebSocket server");
                    };
                    websocket.onmessage = function (event) {
                        try {
                            const messageData = JSON.parse(event.data);
                            const messageElement = document.createElement("div");
                            if (messageData.type === "received") {
                                if (messageData.recipient === '<%=recipientId%>') {
                                    messageElement.classList.add("message");
                                    messageElement.classList.add("received");
                                    messageElement.innerText = '<%= recipient%>' + ": " + messageData.message;
                                }
                            } else {
                                messageElement.classList.add("message");
                                messageElement.classList.add("sent");
                                messageElement.innerText = '<%=currentUser%>' + ": " + messageData.message;
                            }
                            document.getElementById("chatBox").appendChild(messageElement);
                            document.getElementById("chatBox").scrollTop = document.getElementById("chatBox").scrollHeight;
                        } catch (e) {
                            console.error("Error parsing JSON:", e);
                        }
                    };
                    websocket.onerror = function (error) {
                        console.error("WebSocket Error:", error);
                    };
                    websocket.onclose = function () {
                        console.log("WebSocket connection closed");
                        location.reload();
                    };
                }

                function sendMessage() {
                    const message = document.getElementById("message").value;
                    if (websocket && websocket.readyState === WebSocket.OPEN) {
                        const messageObj = {recipient: "<%=recipientId%>", message: message};
                        websocket.send(JSON.stringify(messageObj));
                        document.getElementById("message").value = "";
                    } else {
                        console.error("WebSocket is not connected or not open");
                    }
                }


                function load() {
                    console.log(<%=currentUserId%>);
                    console.log(<%=recipientId%>);
                    const chatBox = document.getElementById("chatBox");
                    var messageElement2 = null;
                    var message = null;
                <% for (Chat chat : chatHistory) {
                %>
                    messageElement2 = document.createElement("div");
                    messageElement2.classList.add("message");
                <%   if (chat.getSender().getAccount_id() == currentUserId) {
                %>
                    messageElement2.classList.add("sent");
                <%} else {%>
                    messageElement2.classList.add("received");
                <% }%>
                    message = '<%=chat.getMessage()%>';
                    messageElement2.innerText = "<%= chat.getSender().getAccount_id() == currentUserId ? currentUser : recipient%>" + ": " + message;
                    chatBox.appendChild(messageElement2);
                    chatBox.scrollTop = chatBox.scrollHeight;
                <% }%>
                }
                ;

            </script>
            <div id="chatContainer">
                <div id="header">Chat with <%= recipient%></div>
                <div id="chatBox" style="height: 70%">
                </div>
                <div id="inputContainer">
                    <input type="text" id="message" placeholder="Type a message...">
                    <button id="sendButton" onclick="sendMessage()">Send</button>
                </div>
            </div>
            <%}%>
        </main>
        <jsp:include page="path/footer.jsp"/>
        <script type="text/javascript">
            var ws;
            window.onload = function () {
                connect();
                connect2();
                load();
            };
            function connect() {
                ws = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/orderStatus");

                ws.onopen = function () {
                    console.log("Connected to WebSocket");
                };

                ws.onmessage = function (event) {
                    let message = JSON.parse(event.data);
                    // In ra thông tin về status, shipperId và shipperName trong console

                    console.log("Status:", message.status);
                    console.log("Shipper ID:", message.shipperId);
                    console.log("Shipper Name:", message.shipperName);
                    if (message.status === 'OntheWay') {
                        setTimeout(function () {
                            submitForm(<%= id%>, message.shipperId, message.shipperName);
                        }, 5000);
                    } else
                    if (message.status === 'Completed') {
                        setTimeout(function () {
                            window.location.href = 'CustomerTrackingOrder?id=<%= id%>';
                        }, 5000);
                    } else {
                        updateTracker(message.status);
                    }

                };

                ws.onclose = function () {
                    console.log("Disconnected from WebSocket");
                };
            }

            function submitForm(orderId, recipientId, recipientName) {
                // Tạo một form động
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = 'CustomerTrackingOrder';

                // Tạo các input ẩn và thêm chúng vào form
                var inputOrderId = document.createElement('input');
                inputOrderId.type = 'hidden';
                inputOrderId.name = 'id';
                inputOrderId.value = orderId;
                form.appendChild(inputOrderId);

                var inputRecipientId = document.createElement('input');
                inputRecipientId.type = 'hidden';
                inputRecipientId.name = 'recipientId';
                inputRecipientId.value = recipientId;
                form.appendChild(inputRecipientId);

                var inputRecipientName = document.createElement('input');
                inputRecipientName.type = 'hidden';
                inputRecipientName.name = 'recipient';
                inputRecipientName.value = recipientName;
                form.appendChild(inputRecipientName);

                // Thêm form vào body và submit
                document.body.appendChild(form);
                form.submit();
            }

            function updateTracker(status) {
                var steps = document.querySelectorAll('.step');
                steps.forEach(function (step) {
                    step.classList.remove('active');
                });

                if (status === 'Checking') {
                    steps[0].classList.add('active');
                } else if (status === 'Preparing') {
                    steps[0].classList.add('active');
                    steps[1].classList.add('active');
                } else if (status === 'Ready') {
                    steps[0].classList.add('active');
                    steps[1].classList.add('active');
                    steps[2].classList.add('active');
                } else if (status === 'OntheWay') {
                    steps[0].classList.add('active');
                    steps[1].classList.add('active');
                    steps[2].classList.add('active');
                    steps[3].classList.add('active');
                } else if (status === 'Completed') {
                    steps[0].classList.add('active');
                    steps[1].classList.add('active');
                    steps[2].classList.add('active');
                    steps[3].classList.add('active');
                    steps[4].classList.add('active');
                }
            }

        </script>
    </body>
</html>
