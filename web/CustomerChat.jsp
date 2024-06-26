<%-- 
    Document   : chat.jsp
    Created on : May 18, 2024, 10:50:07 PM
    Author     : lenovo
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String name = acc.getName();
            if (acc == null) {
        %><h1>Hello World!</h1>
        <%
        } else {
        %><h1>Hello <%=name%></h1>
        <%
            }

        %>
        <input id="textMessage" type="text" />
        <input onclick="sendMessage()" value="Send Message" type="button" /> <br/><br/>

        <textarea id="textAreaMessage" rows="10" cols="50"></textarea>

        <script type="text/javascript">
            var websocket = new WebSocket("ws://localhost:8080/HungryHub_OrderFood/ChatBoxSever");
            websocket.onopen = function (message) {
                processOpen(message);
            };
            websocket.onmessage = function (message) {
                processMessage(message);
            };
            websocket.onclose = function (message) {
                processClose(message);
            };
            websocket.onerror = function (message) {
                processError(message);
            };

            function processOpen(message) {
                textAreaMessage.value += "Server connect... \n";
            }
            function processMessage(message) {
                console.log(message);
                textAreaMessage.value += message.data + " \n";
            }
            function processClose(message) {
                textAreaMessage.value += "Server Disconnect... \n";
            }
            function processError(message) {
                textAreaMessage.value += "Error... " + message + " \n";
            }

            function sendMessage() {
                if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
                    websocket.send(textMessage.value);
                    textMessage.value = "";
                }
            }

        </script>
    </body>
</html>
