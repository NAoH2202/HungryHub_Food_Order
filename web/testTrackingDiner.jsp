<%-- 
    Document   : testTrackingDiner
    Created on : Jul 1, 2024, 11:49:24 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Status Control</title>
    <script type="text/javascript">
        var ws;

        function connect() {
            ws = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/orderStatus");

            ws.onopen = function() {
                console.log("Connected to WebSocket");
            };

            ws.onmessage = function(event) {
                console.log("Received message: " + event.data);
            };

            ws.onclose = function() {
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
</head>
<body>
    <h2>Update Order Status</h2>
    <button onclick="sendStatus('Preparing')">Preparing</button>
    <button onclick="sendStatus('Ready')">Ready</button>
    <button onclick="sendStatus('OntheWay')">On the Way</button>
    <button onclick="sendStatus('Completed')">Completed</button>
</body>
</html>
