<%-- 
    Document   : test2
    Created on : Jun 26, 2024, 10:51:50 PM
    Author     : lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession, java.util.List" %>
<%@ page import="model.ChatDao, model.Chat, model.ChatManager" %>
<%
    if (session == null || session.getAttribute("account") == null) {
        response.sendRedirect("LoginServlet");
        return;
    }
    Account account = (Account) session.getAttribute("account");
    String currentUser = account.getName();
    Integer currentUserId = account.getAccount_id(); // Assuming userId is stored in session
    String recipient = (String)request.getAttribute("recipient");
    if (request.getParameter("recipientId") == null) {
        response.sendRedirect("testPage");
        return;
    }
    int recipientId = (int) request.getAttribute("recipientId"); // Assuming recipientId is stored in session

    ChatManager cm = new ChatManager();
    ArrayList<Chat> chatHistory = cm.getChatHistory(currentUserId, recipientId);
%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chat with <%= recipient%></title>
        <style>
/*            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }*/
            #chatContainer {
                width: 90%;
                max-width: 600px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }
            #header {
                background-color: #4CAF50;
                color: white;
                padding: 15px;
                text-align: center;
                font-size: 1.2em;
            }
            #chatBox {
                height: 400px;
                overflow-y: auto;
                padding: 15px;
                background-color: #f9f9f9;
                border-bottom: 1px solid #ccc;
            }
            .message {
                display: flex;
                margin-bottom: 10px;
                padding: 10px;
                border-radius: 10px;
                max-width: 70%;
            }
            .message.sent {
                margin-left: auto;
                background-color: #dcf8c6;
            }
            .message.received {
                margin-right: auto;
                background-color: #fff;
                border: 1px solid #ccc;
            }
            #inputContainer {
                display: flex;
                padding: 10px;
                background-color: #fff;
            }
            #message {
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 20px;
                margin-right: 10px;
            }
            #sendButton {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }
            #sendButton:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            let websocket;
            function connect() {
                websocket = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/chat");
                websocket.onopen = function () {
                    console.log("Connected to the WebSocket server");
                };
                websocket.onmessage = function (event) {
                    try {
                        const messageData = JSON.parse(event.data);
                        const messageElement = document.createElement("div");
                        messageElement.classList.add("message");
                        messageElement.classList.add(messageData.type === "sent" ? "sent" : "received");
                        if (messageData.type === "received") {
                            messageElement.innerText = messageData.sender + ": " + messageData.message;
                        }else{
                            messageElement.innerText = messageData.recipient + ": " + messageData.message;
                        }
                        document.getElementById("chatBox").appendChild(messageElement);
                        document.getElementById("chatBox").scrollTop = document.getElementById("chatBox").scrollHeight;
                    } catch (e) {
                        console.error("Error parsing JSON:", e);
                    }
                };
                websocket.onerror = function (error) {
                    console.error("WebSocket Error:", error);
                };
                websocket.onclose = function () {
                    console.log("WebSocket connection closed");
                    location.reload();
                };
            }
            function sendMessage() {
                const message = document.getElementById("message").value;
                const messageObj = {recipient: "<%=recipientId%>", message: message};
                websocket.send(JSON.stringify(messageObj));
                document.getElementById("message").value = "";
            }
            window.onload = function () {
                console.log(<%=currentUserId%>);
                console.log(<%=recipientId%>);
                const chatBox = document.getElementById("chatBox");
                var messageElement2 = null;
                var message = null;
            <% for (Chat chat : chatHistory) {
            %>
                messageElement2 = document.createElement("div");
                messageElement2.classList.add("message");
            <%   if (chat.getSender().getAccount_id() == currentUserId) {
            %>
                messageElement2.classList.add("sent");
            <%} else {%>
                messageElement2.classList.add("received");
            <% }%>
                message = '<%=chat.getMessage()%>';
                messageElement2.innerText = "<%= chat.getSender().getAccount_id() == currentUserId ? currentUser : recipient%>" + ": " + message;
                chatBox.appendChild(messageElement2);
                chatBox.scrollTop = chatBox.scrollHeight;
            <% }%>
                connect();
            };

        </script>
    </head>
    <body>
        <div id="chatContainer">
            <div id="header">Chat with <%= recipient%></div>
            <div id="chatBox">
            </div>
            <div id="inputContainer">
                <input type="text" id="message" placeholder="Type a message...">
                <button id="sendButton" onclick="sendMessage()">Send</button>
            </div>
        </div>
    </body>
</html>

