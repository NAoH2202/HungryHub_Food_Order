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
            <a class="nav-link" href="CustomerSocialPage">Cộng Đồng</a>
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
        <div class="profile-image online" onclick="UserSettingToggle()">
                <img src="<%=acc.getProfile_picture()%>" alt="">
        </div>
        <div class="user-settings" style="background-color: white;right: calc(5% - 60px);">
            <div class="profile-darkButton">
            <div class="user-profile">
                <img src="<%=acc.getProfile_picture()%>" alt="">
                <div>
                    <p> <%=acc.getName()%></p>
                    <a href="#">See your profile</a>
                </div>
            </div>
            </div>
            <hr>
            <div class="user-profile">
                <img src="images/feedback.png" alt="">
                <div>
                    <p> Give Feedback</p>
                    <a href="#">Help us to improve</a>
                </div>
            </div>
            <hr>
            <div class="settings-links">
                <img src="images/setting.png" alt="" class="settings-icon">
                <a href="#">Settings & Privary <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/help.png" alt="" class="settings-icon">
                <a href="#">Help & Support <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/Display.png" alt="" class="settings-icon">
                <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/logout.png" alt="" class="settings-icon">
                <a href="LogOutServlet">Logout <img src="images/arrow.png" alt=""></a>
            </div>

        </div>
        <%
            }
        %>
    </div>
</div>
<script src="js/function.js"></script>