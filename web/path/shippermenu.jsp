<%@page import="controller.AddToCartServlet"%>
<%@page import="model.CartItem"%>
<%@page import="model.CartItemManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AccountManager"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    /* CSS styles here */
</style>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mx-auto">
        <li class="nav-item active">
            <a class="nav-link" href="ShipperPage">Home Page<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="ShipperListOrderPage"> List Order</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="ShipperListAcceptPage">List of accepted orders</a>
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
                    url = "ShipperPage";
                    urlacc = "ShipperAccountPage";
                    name = acc.getName() + "'s Order";
                }
            %>
        </li>
    </ul>
    <div class="user_option">
        <a href="<%=urlacc%>" class="user_link">
            <i class="fa fa-user" aria-hidden="true"></i>
        </a>
        <a href="ShipperHistoryPage" class="user_link">
            <i class="fa fa-bell"></i>
        </a>
        <%
            if (acc == null) {
        %>
        <%
            } else {
        %>
        <div class="icon_container">
        </div>
        <div class="cart-menu" style="background-color: white; right: calc(5% - 60px);">
            <div class="cart-items">
                <div class="cart-item">
                </div>
            </div>
            <hr>
        </div>
        <%
            }
        %>
        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="<%=acc.getProfile_picture()%>" alt="">
        </div>
        <div class="user-settings" style="background-color: white; right: calc(5% - 60px);">
            <div class="profile-darkButton">
                <div class="user-profile" style="padding-bottom: 10px">
                    <img src="<%=acc.getProfile_picture()%>" alt="">
                    <div>
                        <p><%=acc.getName()%></p>
                        <a href="ShipperAccountPage" style="margin: 0px;">See my profile</a>
                    </div>
                </div>
            </div>
            <hr>
            <div class="user-profile" style="padding-bottom: 10px; padding-top: 10px">
                <img src="images/feedback.png" alt="">
                <div>
                    <p>feedback</p>
                    <a href="#" style="margin-left: 0px;">Hãy trút cơn giận của bạn lên chúng tôi</a>
                </div>
            </div>
            <div class="settings-links">
                <img src="images/help.png" alt="" class="settings-icon">
                <a href="#">Support <img src="images/arrow.png" alt=""></a>
            </div>
            <div class="settings-links">
                <img src="images/logout.png" alt="" class="settings-icon">
                <a href="LogOutServlet">Log out <img src="images/arrow.png" alt=""></a>
            </div>
        </div>
    </div>
</div>
<script src="js/function.js"></script>
