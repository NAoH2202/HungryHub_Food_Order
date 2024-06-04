<%@page import="model.OrderItemDao"%>
<%@page import="model.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Order</title>
    <style>
        body {
            display: flex;
            flex-wrap: wrap;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .order-info, .map, .chat {
            box-sizing: border-box;
            padding: 20px;
            border: 1px solid #ccc;
        }
        .order-info {
            flex: 1 1 50%;
            height: 100vh;
        }
        .map, .chat {
            flex: 1 1 50%;
            height: 50vh;
        }
        .map {
            position: absolute;
            top: 0;
            right: 0;
            width: 25%;
        }
        .chat {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 25%;
        }
    </style>
</head>
<body>
    <div class="order-info">
        <h2>Order Information</h2>
        <ul>
            <%
            // Retrieve the list of order items from the DAO
            ArrayList<OrderItem> orderItemList = OrderItemDao.getAllOrderItems();
        %>
        <table>
            <thead>
                <tr>
                    <th>Order Item ID</th>
                    <th>Order ID</th>
                    <th>Dish ID</th>
                    <th>Quantity</th>
                    <th>Price</th>

                </tr>
            </thead>
            <tbody> 
                <c:forEach var="ode" items="${oderItem}">            
                    <tr>
                        <td>${orderItem.getOrder_item_id()} </td>
                        <td${orderItem.getOrder().getOrderId()}</td>
                        <td>${orderItem.getDish().getdish_id()}</td>
                        <td>${orderItem.getQuantity()}</td>
                        <td>${orderItem.getPrice()}</td>

                    </tr>
    <div class="map">
        <h2>Map</h2>
        <%-- Đặt mã HTML cho bản đồ ở đây --%>
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509789!2d144.95373631568275!3d-37.81720974276912!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xf577b9f0a42007c!2sVictoria%20Harbour%20Promenade!5e0!3m2!1sen!2sau!4v1614121511140!5m2!1sen!2sau" 
            width="100%" 
            height="100%" 
            style="border:0;" 
            allowfullscreen="" 
            loading="lazy">
        </iframe>
    </div>

    <div class="chat">
        <h2>Chat</h2>
        <%-- Đặt mã HTML cho chat ở đây --%>
        <div id="chat-box" style="height: calc(100% - 40px); overflow-y: auto; border: 1px solid #ccc; padding: 10px;">
            <%-- Giả sử chatMessages là một danh sách các tin nhắn chat --%>
            
        </div>
        <form id="chat-form" method="post" action="sendMessage">
            <input type="text" name="message" placeholder="Type a message..." style="width: 80%;">
            <button type="submit" style="width: 20%;">Send</button>
        </form>
    </div>
</body>
</html>