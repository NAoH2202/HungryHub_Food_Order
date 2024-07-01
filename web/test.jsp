<%-- 
    Document   : test
    Created on : Jun 26, 2024, 10:32:04 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Tracking</title>
    <script>
        var socket;
        function connectWebSocket() {
            socket = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/endpoint");

            socket.onmessage = function(event) {
                var log = document.getElementById("log");
                log.innerHTML += event.data + "<br>";
            };

            socket.onopen = function() {
                console.log("Connected to WebSocket server");
            };

            socket.onclose = function() {
                console.log("Disconnected from WebSocket server");
            };
        }

        window.onload = connectWebSocket;
    </script>
    <style>
        #log {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            max-height: 200px;
            overflow-y: scroll;
        }
    </style>
</head>
<body>
    <h1>Order Tracking</h1>
    <div id="log"></div>
</body>
</html>


