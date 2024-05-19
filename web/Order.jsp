<%-- 
    Document   : Order.jsp
    Created on : May 19, 2024, 11:05:11 AM
    Author     : lenovo
--%>

<%@page import="model.Order"%>
<%@page import="model.OrderManager"%>
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
            String name = acc.getName();
            if (acc == null) {
        %><h1>Hello World!</h1>
        <%
        } else {
        %><h1>Hello <%=name%></h1>
        <%}
            OrderManager om = new OrderManager();
            for (Order od : om.getList()) {

            %>
            <a href="Chat.jsp?idO=<%=od.getOrder_id()%>"><%=od.getOrder_id()%></a><br>
        <%
            }
        %>

    </body>
</html>
