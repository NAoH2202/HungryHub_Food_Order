<%@page import="model.OrderDao"%>
<%@page import="model.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #DDDDDD;
            margin: 0;
            padding: 20px;
        }

        .container1 {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table th {
            background-color: #f8f8f8;
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
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
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .actions input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .header {
            display: flex;
            align-items: center;
            padding: 40px;
            background-color: #8bc34a;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            
        }

        .header img {
            height: 50px;
        }
    </style>
</head>
<body>
      <jsp:include page="path/shipperheader.jsp"/>
    <div class="container1">
        <h1>History</h1>
        <%
            // Retrieve the list of order items from the DAO
            List<Order> orderList = OrderDao.getAllOrders();
            request.setAttribute("orderList", orderList);
        %>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Address of Customer</th>
                    <th>Dish</th>
                    <th>Address of Dinner</th>
                    <th>Status Order</th>
                    <th>Reason</th>
                     
                     
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderList}">
                       <c:if test="${order.order_status eq 'Completed' or order.order_status eq 'canceled' && order.shipper.account_id eq sessionScope.account.account_id}">
            <tr>
              <td>${order.order_id}</td>
              <td>${order.customer.name}</td>
              <td>${order.customer.address}</td>
              <td>${order.diner.name}</td>
              <td>${order.diner.address}</td>
              <td>${order.order_status}</td>
              <td>${order.reason}</td>
               
               
              
            </tr>
          </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
