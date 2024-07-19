<%@page import="model.Account"%>
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
            font-family: 'Roboto', sans-serif;
            background-color: #DDDDDD; /* Light gray background */
            color: #333; /* Default text color */
            margin: 0;
            padding: 0;
            position: relative;
            overflow-y: auto; /* Enable vertical scrolling */
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
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .actions input[type="submit"].accept {
            background-color: #28a745; /* Green background for Accept button */
        }

        .actions input[type="submit"].accept:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .actions input[type="submit"].view {
            background-color: #007bff; /* Blue background for View Info button */
        }

        .actions input[type="submit"].view:hover {
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
    <div class="container1">
        <h1>ORDER LIST</h1>
        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            if (!acc.isActive_status()) {
                response.sendRedirect("ShipperPage");
                return;
            }
            // Retrieve the list of order items from the DAO
            List<Order> orderList = OrderDao.getAllOrders();
            request.setAttribute("orderList", orderList);
        %>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Customer Address</th>
                    <th>Diner Name</th>
                    <th>Diner Address</th>
                    <th>Status Order</th>
                    <th>Payment</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orderList}">
                    <c:if test="${order.order_status eq 'Ready'}">
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${order.customer.name}</td>
                            <td>${order.customer.address}</td>
                            <td>${order.diner.name}</td>
                            <td>${order.diner.address}</td>
                            <td>${order.order_status}</td>
                            <td>${order.payment_method}</td>
                            <td class="actions">
                                
                                <form action="OrderItemServlet" method="GET">
                                    <input type="hidden" name="command" value="Accept">
                                    <input type="hidden" name="orderId" value="${order.order_id}">
                                    <input type="submit" value="Accept" class="accept"
                                           <c:if test="${order.order_status ne 'Ready'}">
                                               disabled
                                           </c:if>>
                                </form>
                                    <form action="OrderItemServlet" method="GET">
                                    <input type="hidden" name="command" value="ITEM">
                                    <input type="hidden" name="orderId" value="${order.order_id}">
                                    <input type="submit" value="View Info" class="view">
                                </form>
                                
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
