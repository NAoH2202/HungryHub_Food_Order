<%@page import="model.OrderManager"%>
<%@page import="model.OrderItemDao"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Order"%>
<%@page import="model.Dish"%>

<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>View Order</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body, html {
                height: 100%;
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #DDDDDD;
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
                height: 100%;
                padding: 20px;
                box-sizing: border-box;
            }
            .order-info {
                flex: 3;
                padding: 20px;
                box-sizing: border-box;
                background-color: #ffffff;
                overflow-y: auto;
                display: flex;
                flex-direction: column;
            }
            .table-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                flex-grow: 1;
                display: flex;
                flex-direction: column;
                position: relative;
            }
            .sidebar {
                flex: 1;
                display: flex;
                flex-direction: column;
                background-color: #fff;
                border-left: 1px solid #ccc;
                border-radius: 10px;
                margin-left: 20px;
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
                flex: 1;
            }
            h2 {
                margin-top: 0;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                border-radius: 10px;
                overflow: hidden;
            }
            table th, table td {
                padding: 12px;
                border: 1px solid #ccc;
                text-align: left;
            }
            table th {
                background-color: #8bc34a;
            }
            table tr:nth-child(even) {
                background-color: #ffffff;
            }
            #chat-box {
                height: calc(70% - 40px);
                overflow-y: auto;
                border: 1px solid #ccc;
                padding: 10px;
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
            }


            input[type="submit"]:hover {
                background-color: #45a049;
                color: red;
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

            }
            input[type="submit"] {
                padding: 15px 30px;
                font-size: 16px;
                background-color: #8bc34a;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #7cb342;
            }
            .popup, .popupcancel {
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
            .open-popup, .open-popupcancel {
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
            .popup button {
                background: #45a049;
                margin-top: 20px;
            }
        </style>
        <script>
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 8
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
        </script>
    </head>
    <body>
        <jsp:include page="path/shipperheader.jsp"/>
        <div class="container1">
            <div class="order-info">
                <h1 style="font-size: 36px; line-height: 42px;">Order Information</h1>
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
                            total += item.getPrice();
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
                                    <td>${orderItem.dishName}</td>
                                    <td>${orderItem.quantity}</td>
                                    <td>${orderItem.price}₫</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="2" style="text-align: right;"><strong>Total:</strong></td>
                                <td><%= total%>₫</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="accept-button-container">

                        <form action="OrderItemServlet" method="GET">
                            <input type="hidden" name="command" value="Accept">
                            <input type="hidden" name="orderId" value="<%= order.getOrder_id()%>">
                            <input type="submit" value="Accept" onclick="sendStatus('OntheWay')" 
                                   <%
                                       if (!"Ready".equals(order.getOrder_status())) {
                                   %>
                                   disabled style="opacity: 0.5; cursor: not-allowed;"
                                   <%
                                       }
                                   %>
                                   >
                        </form>

                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="sidebar">
                <div class="map">
                    <h2>Map</h2>
                    <%-- Đặt mã HTML cho bản đồ ở đây --%>
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
                    <h2>Chat</h2>

                </div>
            </div>
        </div>
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
                    ws.send(status);
                } else {
                    console.log("WebSocket is not connected.");
                }
            }

            window.onload = connect;
        </script>
    </body>
</html>
