<%-- 
    Document   : test2
    Created on : Jun 26, 2024, 10:51:50 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Order Status</title>
    <style>
        .button-group {
            margin-top: 50px;
            text-align: center;
        }
        .button-group button {
            margin: 10px;
            padding: 15px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Update Order Status</h1>
    <div class="button-group">
        <button onclick="updateOrderStatus('Processing')">Processing</button>
        <button onclick="updateOrderStatus('Shipped')">Shipped</button>
        <button onclick="updateOrderStatus('Delivered')">Delivered</button>
        <button onclick="updateOrderStatus('Cancelled')">Cancelled</button>
    </div>
    <script>
        function updateOrderStatus(status) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "OrderUpdateServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("orderId=123&status=" + status);
        }
    </script>
</body>
</html>
