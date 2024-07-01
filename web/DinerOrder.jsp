<%-- 
    Document   : DinerOrder.jsp
    Created on : May 19, 2024, 11:05:11 AM
    Author     : lenovo
--%>

<%@page import="model.Order"%>
<%@page import="model.OrderManager"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Account"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Diner Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .showing-container {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin-left: 250px;
        }
        .item-status {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            flex-basis: 20%;
            transition: transform 0.3s ease;
        }
        .item-status:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        .contentBot .box {
            display: none;
        }
        .contentBot .box.active {
            display: block;
        }
    </style>
</head>
<body>
    <%
        Account acc = (Account) session.getAttribute("account");
        if (acc == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if (!"DinerManager".equals(acc.getRole())) {
            response.sendRedirect("not_authorized.jsp");
            return;
        }
        String name = acc.getName();
        int dinerId = acc.getAccount_id(); // Giả sử Account có phương thức getId()
    %>
    <div class="container">
        <h1 class="my-4"><%=name%>'s Diner Orders</h1>
        <section class="section-yellow" style="border-radius: 20px">
            <ul class="showing-container">
                <li class="item-status active-os" selected="1">
                    <div class="statusOrder">Checking</div>
                </li>
                <li class="item-status" selected="2">
                    <div class="statusOrder">Preparing</div>
                </li>
                <li class="item-status" selected="3">
                    <div class="statusOrder">OnTheWay</div>
                </li>
                <li class="item-status" selected="4">
                    <div class="statusOrder">Delivered</div>
                </li>
                <li class="item-status" selected="5">
                    <div class="statusOrder">Completed</div>
                </li>
                <li class="item-status" selected="6">
                    <div class="statusOrder">Canceled</div>
                </li>
            </ul>
        </section> 
        <div class="contentBot">
            <section class="section-white">
                <%
                    OrderManager om = new OrderManager();
                    List<Order> orders = om.getList();
                %>
                <div class="box active" content="1">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("Checking".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="box" content="2">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("Preparing".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="box" content="3">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("OnTheWay".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="box" content="4">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("Delivered".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="box" content="5">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("Completed".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="box" content="6">
                    <div>
                        <%
                            for (Order od : orders) {
                                if ("Canceled".equals(od.getOrder_status()) && od.getDiner().getAccount_id() == dinerId) {
                        %>
                        <div class="card mb-3">
                            <div class="card-header">
                                Order ID: <%=od.getOrder_id()%>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Customer: <%=od.getCustomer().getName()%></h5>
                                <p class="card-text">Total Price: <%=od.getTotal_price()%></p>
                                <p class="card-text">Items:</p>
                                <ul>
                                    <%
                                        for (OrderItem item : od.getOrderItems()) {
                                    %>
                                    <li><%=item.getDish().getName()%> - Quantity: <%=item.getQuantity()%>, Price: <%=item.getPrice()%></li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <a href="CustomerChatPage?idO=<%=od.getOrder_id()%>" class="btn btn-primary">Chat</a>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const items = document.querySelectorAll('.item-status');
        const boxes = document.querySelectorAll('.box');

        items.forEach(item => {
            item.addEventListener('click', function () {
                const selected = this.getAttribute('selected');
                
                items.forEach(i => i.classList.remove('active-os'));
                this.classList.add('active-os');

                boxes.forEach(box => {
                    if (box.getAttribute('content') === selected) {
                        box.classList.add('active');
                    } else {
                        box.classList.remove('active');
                    }
                });
            });
        });
    });
</script>
</html>
