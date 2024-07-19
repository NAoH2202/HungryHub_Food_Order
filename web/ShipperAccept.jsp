<%@page import="model.Chat"%>
<%@page import="model.ChatManager"%>
<%@page import="model.Account"%>
<%@page import="model.OrderManager"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>View Order</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="css/chatStyle.css">
        <style>
            body, html {
                height: 100%;
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f0f8ff;
                display: flex;
                flex-direction: column;
                overflow: hidden;
                overflow-y: auto;
            }
            #map {
                height: 100%;
            }
            .container1 {
                display: flex;
                padding: 20px;
                box-sizing: border-box;
            }
            .order-info {
                /*flex: 3;*/
                padding: 20px;
                box-sizing: border-box;
                background-color: #ffffff;
                width: 65%; /*them*/
                overflow-y: auto;
                display: flex;
                flex-direction: column;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .sidebar {
                /*flex: 1;*/
                display: flex;
                width: 35%; /*them*/
                height: 900px; /*them*/
                flex-direction: column;
                background-color: #fff;
                border-left: 1px solid #ccc;
                border-radius: 10px;
                margin-left: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .map, .chat {
                padding: 20px;
                box-sizing: border-box;
                border-bottom: 1px solid #ccc;
                height: 50%;
            }
            .map {
                flex: 1;
            }
            .chat {
                padding: 0;
                flex: 1;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
            }
            h1, h2 {
                margin-top: 0;
                color: #333;
                font-weight: normal;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            table th, table td {
                padding: 12px;
                border: 1px solid #ccc;
                text-align: left;
            }
            table th {
                background-color: #8bc34a;
                color: #fff;
            }
            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            /*            #chat-box {
                            height: calc(70% - 40px);
                            overflow-y: auto;
                            border: 1px solid #ccc;
                            padding: 10px;
                            border-radius: 10px;
                            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
                        }
                        #chat-form {
                            display: flex;
                            margin-top: 10px;
                        }
                        #chat-form input[type="text"] {
                            flex: 1;
                            padding: 10px;
                            border: 1px solid #ccc;
                            border-radius: 4px 0 0 4px;
                            box-sizing: border-box;
                        }
                        #chat-form button {
                            padding: 10px;
                            border: 1px solid #007bff;
                            background-color: #007bff;
                            color: #fff;
                            border-radius: 0 4px 4px 0;
                            cursor: pointer;
                            transition: background-color 0.3s;
                        }
                        #chat-form button:hover {
                            background-color: #0056b3;
                        }*/
            .header {
                display: flex;
                align-items: center;
                padding: 15px;
                background-color: #8bc34a;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                position: relative;
            }
            .header a {
                text-decoration: none;
                color: #000;
                font-family: 'Brush Script MT', sans-serif;
                font-size: 50px;
            }
            .header .order_online {
                position: absolute;
                top: 30px;
                right: 20px;
                font-size: 40px;
                color: white;
            }
            .message {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
            }
            .message-success {
                color: #155724;
                background-color: #d4edda;
                border-color: #c3e6cb;
            }
            .message-error {
                color: #721c24;
                background-color: #f8d7da;
                border-color: #f5c6cb;
            }
            .accept-button-container {
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
                gap: 0.5cm;
            }
            .accept-button-container input[type="submit"] {
                padding: 15px 30px;
                font-size: 16px;
                background-color: #8bc34a;
                color: #fff;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .accept-button-container input[type="submit"]:hover {
                background-color: #7cb342;
            }
            .accept-button-container input[type="submitCancel"]:hover {
                background-color: #dc3545;
            }
            .accept-button-container input[type="submitCancel"] {
                height: 60px;
                width: 130px;
                padding: 15px 30px;
                font-size: 16px;
                background-color: #e66365;
                color: #fff;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .popup, .popupcancel {
                
                height: 350px;
                background-color: #ffffff;
                border-radius: 6px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0.1);
                text-align: center;
                padding: 20px;
                visibility: hidden;
                transition: transform 0.4s, top 0.4s;
                z-index: 9999;
                width: 300px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .popup.open-popup, .popupcancel.open-popupcancel {
                visibility: visible;
                transform: translate(-50%, -50%) scale(1);
            }
            .popup h2, .popupcancel h2 {
                margin-top: 0;
                color: #333;
            }
            .popup p, .popupcancel p {
                color: #333;
            }
            .popup button, .popupcancel button {
                width: 80%;
                padding: 10px 0;
                color: #fff;
                border: 0;
                outline: none;
                font-size: 18px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .popup button.ok {
                background: #45a049;
                margin-top: 20px;
            }
            .popup button.close {
                height: 50px;
                width: 210px;
                background: #c3e6cb;
                margin-top: 20px;
                 margin-right:  24px;
            }
            .popupcancel button.ok {
                background: #dc3545;
                margin-top: 20px;
            }
            .popupcancel button.close {
                 height: 50px;
                width: 210px;
                background: #f8d7da;
                color: #333;
                margin-top: 20px;
                 margin-right:  24px;
            }
            .popupcancel button.close:hover {
                background: #f5c6cb;
            }
            .back-button {
                margin-top: 5px;
                margin-bottom: 5px;
                text-align: left;
                padding-left: 0.5cm;
            }



            .back-link i {
                margin-right: 5px;
                color: #555; /* Màu mũi tên xám */
                font-size: 20px;
                display: inline-block;
                transform: scaleX(1.75);/* Độ dài và kích thước của mũi tên */
            }

        </style>
    </head>
    <body>
        <jsp:include page="path/shipperheader.jsp"/>
        <div class="back-button">
            <a href="ShipperListAcceptPage" class="back-link">
                <i class="fas fa-arrow-left"></i>
            </a>
        </div>
        <div class="container1">
            <div class="order-info">
                <h1>Order Information</h1>
                  <%
                    // Retrieve the first order item to access customer details
                    OrderItem orderItem = null;
                    ArrayList<OrderItem> orderItemList = null;
                    OrderManager om = new OrderManager();
                     
                    int total = 0;
                    if (request.getAttribute("orderItemList") != null) {
                        orderItemList = (ArrayList<OrderItem>) request.getAttribute("orderItemList");
                        orderItem = orderItemList.get(0);
                        for (OrderItem item : orderItemList) {
                            total += item.getDish().getPrice() * item.getQuantity();
                        }
                    }
                    if (orderItem != null) {
                    Order order = om.getOderById(orderItem.getOrder_id());
                %>
                <div>
                    <p><strong>Order ID:</strong><%= orderItem.getOrder_id()%></p>
                    <p><strong>Name Customer:</strong> <%= order.getCustomer().getName()%></p>
                    <p><strong>Phone Number:</strong> <%= order.getCustomer().getPhoneNumber()%></p>
                    <p><strong>Diner address:</strong> <%= order.getDiner().getAddress()%></p>
                    <p><strong>Customer address:</strong> <%= order.getCustomer().getAddress()%></p>

                </div>
              
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Name of Dish</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderItem" items="${orderItemList}">
                                <tr>
                                    <td>${orderItem.dish.name}</td>
                                    <td>${orderItem.quantity}</td>
                                    <td>${orderItem.dish.price * orderItem.quantity}₫</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="2" style="text-align: right;"><strong>Total:</strong></td>
                                <td><%= total%>₫</td>
                            </tr>
                        </tbody>
                    </table>


                <div class="accept-button-container">
                    <input type="submit" onclick="openPopup()" value="Complete">
                    <div class="popup">
                       
                        <h2>Complete</h2>
                        <p>Your Order Completed</p>
                        <form id="completeForm" action="OrderItemServlet" method="GET">
                            <input type="hidden" name="command" value="Complete">
                            <input type="hidden" name="orderId" value="<%=order.getOrder_id()%>">
                            <button class="ok complete" type="submit" onclick="submitFormAndRedirect()">OK</button>
                            <button class="close" type="button" onclick="closePopup()">Close</button>
                        </form>
                    </div>   

                    <input type="submitCancel" onclick="openPopupCancel()" value="Cancel">
                    <div class="popupcancel">
                        
                        <h2>CANCEL</h2>
                        <p>Are You Sure !!!</p>
                        <form id="cancelForm" action="OrderItemServlet" method="GET">
                            <input type="hidden" name="command" value="Canceled">
                            <input type="hidden" name="orderId" value="<%=order.getOrder_id()%>">
                            <textarea name="cancelReason" placeholder="Enter reason for cancellation" required></textarea>
                            <button class="ok cancel" type="submit" onclick="submitFormCancel()">OK</button>
                            <button class="close" type="button" onclick="closePopupCancel()">Close</button>
                        </form>
                    </div>   
                </div>

                <%
                    }
                %>
            </div>
              </div>

            <div class="sidebar">
                <div class="map">
                    <h2>Map</h2>
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.3088216083095!2d108.21228731533485!3d16.06030858888254!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218d5c026f0b9%3A0x3a9c61e77580055e!2sFPT%20University%20Da%20Nang!5e0!3m2!1sen!2s!4v1614121511140!5m2!1sen!2s"
                        width="100%" 
                        height="80%" 
                        style="border:0;" 
                        allowfullscreen="" 
                        loading="lazy">
                    </iframe>
                </div>
                <div class="chat">
                    <%
                        if (session == null || session.getAttribute("account") == null) {
                            response.sendRedirect("LoginServlet");
                            return;
                        }
                        Account account = (Account) session.getAttribute("account");
                        String currentUser = account.getName();
                        int currentUserId = account.getAccount_id(); // Assuming userId is stored in session
                        String recipient = (String) request.getAttribute("recipient");
//                        if (request.getAttribute("recipientId") == null) {
//                            response.sendRedirect("testPage");
//                            return;
//                        }
                        int recipientId = (int) request.getAttribute("recipientId"); // Assuming recipientId is stored in session

                        ChatManager cm = new ChatManager();
                        ArrayList<Chat> chatHistory = cm.getChatHistory(currentUserId, recipientId);
                    %>
                    <div id="header">Chat with <%= recipient%></div>
                    <div id="chatBox">
                    </div>
                    <div id="inputContainer">
                        <input type="text" id="message" placeholder="Type a message...">
                        <button id="sendButton" onclick="sendMessage()">Send</button>
                    </div>
                </div>
            </div>
      

        <script>
            let websocket;
            function connect() {
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
                const messageObj = {recipient: "<%=recipientId%>", message: message};
                websocket.send(JSON.stringify(messageObj));
                document.getElementById("message").value = "";
            }
            window.onload = function () {
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
                connect();
            };

        </script>

        <script>
            function openPopup() {
                var popup = document.querySelector('.popup');
                popup.classList.add('open-popup');
            }

            function closePopup() {
                var popup = document.querySelector('.popup');
                popup.classList.remove('open-popup');
            }

            function submitFormAndRedirect() {
                document.getElementById("completeForm").submit();
            }

            function openPopupCancel() {
                var popupcancel = document.querySelector('.popupcancel');
                popupcancel.classList.add('open-popupcancel');
            }

            function closePopupCancel() {
                var popupcancel = document.querySelector('.popupcancel');
                popupcancel.classList.remove('open-popupcancel');
            }

            function submitFormCancel() {
            var cancelReason = document.getElementById("cancelReason").value.trim();
            if (cancelReason === "") {
                alert("Please enter a reason for cancellation.");
                return;
            }
            document.getElementById("cancelForm").submit();
        }
        </script>
    </body>
</html>