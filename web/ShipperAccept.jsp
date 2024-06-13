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
            }
            #map {
                height: 100%;
            }
            .container {
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
            .header {
                display: flex;
                align-items: center;
                padding: 40px;
                background-color: #8bc34a;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                position: relative;
            }
            .header img {
                height: 50px;
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
                background-color: #d4edda; /* Màu nền xanh nhạt */
                border-color: #c3e6cb;
                padding: 10px;
                margin-bottom: 20px; /* Để tách thông báo và phần thông tin đơn hàng */
                border: 1px solid transparent;
                border-radius: 4px;
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
            .message-complete {
                color: #155724;
                background-color: #d4edda;
                border-color: #c3e6cb;
                padding: 10px;
                margin-top: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
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

        <script>
            function showCompleteMessage() {
                var messageBox = document.createElement('div');
                messageBox.className = 'message message-success';
                messageBox.innerHTML = 'Order completed successfully!';
                document.body.appendChild(messageBox);
            }
        </script>

    </head>
    <body>
        <div class="header">
           <a href="ShipperPage" style="text-decoration: none; color: #ff6347; font-family: 'Roboto', sans-serif; font-size: 20px; font-weight: bold;">
    HungryHub</a>
            <a href="AccountPage" class="order_online" style="position: absolute; top: 30px; right: 20px; font-size: 40px;">
                <i class="fas fa-user"></i>
            </a>
        </div>
        <div class="container">
            <div class="order-info">
                <h1 style="font-size: 36px; line-height: 42px;">Order Information</h1>
                <%
                    ArrayList<OrderItem> orderItemList = (ArrayList<OrderItem>) request.getAttribute("orderItemList");
                    if (orderItemList == null || orderItemList.isEmpty()) {
                %>
                <div class="message message-error">Order not found or empty.</div>
                <%
                } else {
                  %>
                <div class="message message-success">Accept successfully!!!</div>
                 <%   OrderItem orderItem = orderItemList.get(0);
                    double total = 0.0;
                    for (OrderItem item : orderItemList) {
                        total += item.getDish().getPrice() * item.getQuantity();
                    }
                %>
                <div>
                    <p><strong>Order ID:</strong> <%= orderItem.getOrder().getOrder_id()%></p>
                    <p><strong>Name Customer:</strong> <%= orderItem.getOrder().getCustomer().getName()%></p>
                    <p><strong>Phone Number:</strong> <%= orderItem.getOrder().getCustomer().getPhoneNumber()%></p>
                    <p><strong>Address:</strong> <%= orderItem.getOrder().getCustomer().getAddress()%></p>
                    <p><strong>Status Order:</strong> <%= orderItem.getOrder().getOrder_status()%></p>
                    <p><strong>Total:</strong> <%= total%></p>
                </div>
                <%
                    }
                %>

                <div class="accept-button-container">
                    <input type="submit" id="completeButton" value="Complete" onclick="completeOrder()">
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
                    <h2>Chat</h2>
                    <div id="chat-box"></div>
                    <form id="chat-form" method="post" action="sendMessage">
                        <input type="text" name="message" placeholder="Type a message...">
                        <button type="submit">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
