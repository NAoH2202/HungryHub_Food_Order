<%@page import="model.OrderItemDao"%>
<%@page import="model.OrderDao"%>
<%@page import="java.util.List"%>
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
            overflow-y: auto;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
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
            background-color: #f2f2f2;
        }
        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
        }
        .actions form {
            display: inline-block;
        }
        .actions input[type="submit"] {
            height: 40px;
            width: 150px;
            padding: 10px 20px;
            background-color: #45a049;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }
        .actions input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            background-color: #8bc34a;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header a {
            text-decoration: none;
            color: #000;
            font-family: 'Brush Script MT', sans-serif;
            font-size: 32px;
        }
        .header .order_online {
            font-size: 40px;
            color: white;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="ShipperPage">HungryHub</a>
    <a href="ShipperAccountPage" class="order_online"><i class="fas fa-user"></i></a>
</div>
<div class="container">
    <div class="order-info">
        <h1 style="font-size: 36px; line-height: 42px; text-align: center;">Order to Accepted</h1>
        <%-- Retrieve the list of orders from the DAO --%>
        <%
            ArrayList<OrderItem> orderItemList = OrderItemDao.getAllOrderItems();
            request.setAttribute("orderItemList", orderItemList);
        %>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Name Customer</th>
                    <th>Phone Number</th>
                    <th>Diner Address</th>
                    <th>Customer Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%-- Loop through each order item --%>
                <c:forEach var="orderItem" items="${orderItemList}">
                    <%-- Display only orders with status 'OntheWay' --%>
                    <c:if test="${orderItem.order.order_status eq 'OntheWay'}">
                        <%-- Check if current order ID is different from previous --%>
                        <c:if test="${not empty currentOrderId && !currentOrderId.equals(orderItem.order.order_id)}">
                            <%-- Output row with aggregated data for previous order --%>
                            <tr>
                                <td>${currentOrderId}</td>
                                <td>${orderItem.order.customer.name}</td>
                                <td>${orderItem.order.customer.phoneNumber}</td>
                                <td>${orderItem.order.diner.address}</td>
                                <td>${orderItem.order.customer.address}</td>
                                <td>
                                    <form action="OrderItemServlet" method="GET">
                                        <input type="hidden" name="command" value="ViewDetail">
                                        <input type="hidden" name="orderId" value="${currentOrderId}">
                                        <input type="submit" value="View details">
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                        <c:set var="currentOrderId" value="${orderItem.order.order_id}" />
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
        <div class="actions">
            <a href="ShipperListOrderPage">
                <input type="submit" value="Back to List Order">
            </a>
        </div>
    </div>
</div>
</body>
</html>