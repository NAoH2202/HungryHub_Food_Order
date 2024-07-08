<%-- 
    Document   : test
    Created on : Jun 26, 2024, 10:32:04 PM
    Author     : lenovo
--%>

<%@page import="java.util.List"%>
<!-- chooseChat.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.AccountDao, model.Account, model.AccountManager" %>
<%
    if (session == null || session.getAttribute("account") == null) {
        response.sendRedirect("LoginServlet");
        return;
    }
    Account acc= (Account) session.getAttribute("account");
    AccountManager am = new AccountManager();
    List<Account> accounts = am.getAllAccountsExcept(acc.getAccount_id());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Choose User to Chat</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #chatContainer {
            width: 90%;
            max-width: 600px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
        }
        #header {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 1.2em;
        }
        #userList {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #userList li {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }
        #userList li a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        #userList li a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div id="chatContainer">
    <div id="header">Choose a user to chat with</div>
    <ul id="userList">
        <% for (Account account : accounts) { %>
            <li><a href="testPage2?recipient=<%= account.getUsername() %>&recipientId=<%= account.getAccount_id()%>"><%= account.getUsername() %></a></li>
        <% } %>
    </ul>
</div>
</body>
</html>




