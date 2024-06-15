<%-- 
    Document   : complete
    Created on : Jun 13, 2024, 10:43:46 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getAttribute("message") != null) {
                String mess = (String) request.getAttribute("message");
        %>
        <h1><%=mess%></h1>
        <%
        } else {
        %>
        <h1>Hello World!</h1>
        <%}%>
    </body>
</html>
