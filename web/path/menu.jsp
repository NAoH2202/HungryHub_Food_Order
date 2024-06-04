<%@page import="java.util.ArrayList"%>
<%@page import="model.AccountManager"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mx-auto">
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Trang Chủ<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="menu.jsp">Cộng Đồng</a>
        </li>
        <li class="nav-item">
            <%
                Account acc = (Account) session.getAttribute("account");
                String url, urlacc, name;
                if (acc == null) {
                    url = "about.jsp";
                    urlacc = "";
                    name = "about";
                } else {
                    url = "CustomerOrderPage";
                    urlacc = "AccountPage";
                    name = acc.getName() + "'s Order";
                }
            %>
            <a class="nav-link" href="<%=url%>"><%=name%></a>
        </li>
    </ul>
    <div class="user_option">
        <a href="<%=urlacc%>" class="user_link">
            <i class="fa fa-user" aria-hidden="true"></i>
        </a>
        <a href="#" class="user_link">
            <i class="fa fa-bell"></i>
        </a>
        <%
            if (acc == null) {
        %>
        <a href="LoginServlet" class="order_online">
            Login
        </a>
        <%
        } else {
        %>
        <a href="LogOutServlet" class="order_online">
            Logout
        </a>
        <%
            }
        %>
    </div>
</div>