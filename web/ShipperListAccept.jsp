<%@page import="model.Account"%>
<%@page import="model.OrderManager"%>
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
            background-color: #007bff; /* Blue background for View details button */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            text-align: center;
        }
        .actions input[type="submit"]:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .actions input[type="submit"]:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
    </style>
</head>
<jsp:include page="path/shipperheader.jsp"/>
<body>
    
 <div>
            <!-- Include header -->
            
            <!-- End header section -->
        </div>
<div class="container1">
    <div class="order-info">
        <h1 style="font-size: 36px; line-height: 42px; text-align: center;">Order to Accepted</h1>
        <%-- Retrieve the list of orders from the DAO --%>
        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
             if (acc.isActive_status()== false) {
                        response.sendRedirect("ShipperPage");
                        return;
                    }
            int currentshipperid=acc.getAccount_id();
            ArrayList<Order> orderList = OrderDao.getAllOrders();
            request.setAttribute("orderList", orderList);
            
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
              <c:forEach var="order" items="${orderList}">
    <%-- Retrieve the order using the order_id from OrderItem --%>
    
    <%-- Display only orders with status 'OntheWay' and matching shipper_id --%>
    <c:if test="${order.order_status eq 'OntheWay' && order.shipper.account_id eq sessionScope.account.account_id}">
        <%-- Check if current order ID is different from previous --%>
        <c:if test="${not empty currentOrderId && !currentOrderId.equals(order.getOrder_id())}">
            <%-- Output row with aggregated data for previous order --%>
            <tr>
                <td>${currentOrderId}</td>
                <td>${order.customer.name}</td>
                <td>${order.customer.phoneNumber}</td>
                <td>${order.diner.address}</td>
                <td>${order.customer.address}</td>
                <td>
                    <form action="OrderItemServlet" method="GET">
                        <input type="hidden" name="command" value="ViewDetail">
                        <input type="hidden" name="orderId" value="${currentOrderId}">
                        <input type="submit" value="View details">
                    </form>
                </td>
            </tr>
        </c:if>
        <c:set var="currentOrderId" value="${order.getOrder_id()}" />
    </c:if>
</c:forEach>

            </tbody>
        </table>
        
    </div>
</div>
</body>
</html>
