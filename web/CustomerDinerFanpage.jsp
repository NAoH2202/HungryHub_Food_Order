<%-- 
    Document   : CustomerDinerFanpage
    Created on : Jul 21, 2024, 5:10:55 PM
    Author     : lenovo
--%>

<%@page import="model.LikePost"%>
<%@page import="model.FoodAdDao"%>
<%@page import="model.LikePostManager"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.FoodAdManager"%>
<%@page import="model.FoodAd"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fanpage Cửa Hàng</title>
        <link href="css/fanpage.css" rel="stylesheet" />
        <style>
            .body_fanpage {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #dddddd;
                color: #343a40;
            }

            .header {
                display: flex;
                max-width: 1160px;
                margin: 0 auto;
                position: relative;
                background-size: cover;
                background-color: white;
                height: 318px;
                display: flex;
                flex-direction: column;
                align-items: center;

                border-radius: 10px;
                color: white;
                text-align: center;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header .avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 5px solid white;
                background-image: url('avatar.jpg');
                background-size: cover;
                background-position: center;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                margin-top: -100px;
            }
            .header .follow-btn {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 5px;
                margin-top: 10px;
                transition: background-color 0.3s ease;
            }
            .header .follow-btn:hover {
                background-color: #0056b3;
            }
            .content {
                display: flex;
                padding: 20px;
                max-width: 1200px;
                margin: 0 auto;
            }
            .left-content, .right-content {
                padding: 20px;
                border-radius: 5px;
                background-color: white;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .left-content {
                width: 30%;
                margin-right: 20px;
                display: flex;
                flex-direction: column;
                position: sticky;
                top: 10px;
                max-height: 650px;
            }
            .right-content {
                width: 70%;
                background-color: #f4f4f4;
            }
            .info h2, .posts h2 {
                margin-top: 0;
                text-align: center;
            }
            .info p, .post p {
                margin: 10px 0;
            }
            .buttons{
                display: flex;
                justify-content: space-around;
            }
            .buttons button {
                background-color: #28a745;
                border: none;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 5px;
                margin-right: 10px;
                transition: background-color 0.3s ease;

            }
            .buttons button:hover {
                background-color: #218838;
            }
            .posts {
                background-color: #f4f4f4;
            }
            .post img {
                width: 100%;
                border-radius: 5px;
                transition: transform 0.3s ease;
            }
            .post img:hover {
                transform: scale(1.05);
            }
            .restaurant-bg {
                width: 100%;
                height: 170px;

                object-fit: cover;
                top: -50px;

                border-radius: 10px 10px 0 0;
            }
        </style>
    </head>
    <body>
        <%
            if (request.getParameter("dinerId") == null) {
                response.sendRedirect("HomePage");
                return;
            }
            int dinerId = Integer.parseInt(request.getParameter("dinerId"));
            AccountManager am = new AccountManager();
            Account diner = am.getAccountById(dinerId);
        %>
        <jsp:include page="path/header.jsp"/>
        <div class="body_fanpage">
            <div class="header">
                <img src="<%= diner.getBackground_picture()%>" class="restaurant-bg" alt="Restaurant Image"/>
                <img src="<%= diner.getProfile_picture()%>" class="avatar" alt="Restaurant Image"/>=
                <button id="follow-btn" class="follow-btn">Follow</button>
            </div>
            <div class="content">
                <div class="left-content">
                    <h2 style="text-align: center">Thông Tin Cửa Hàng</h2>

                    <div class="info">
                        <p>Địa chỉ: <%= diner.getAddress()%>, <%= diner.getDistrict().getName() == null ? "Chưa cập nhật" : diner.getDistrict().getName()%> - <%= diner.getProvinces().getName() == null ? "Chưa cập nhật" : diner.getProvinces().getName()%></p>
                        <p>Giờ mở cửa: overtime</p>
                        <p>Số điện thoại: <%= diner.getPhoneNumber() == null ? "Chưa cập nhật" : diner.getPhoneNumber()%></p>
                        <p>email: <%= diner.getEmail()%></p>
                    </div>
                    <hr/>
                    <div class="buttons">
                        <button>Order</button>
                        <button>Voucher</button>
                    </div>
                    <hr/>
                    <div class="info">
                        <h2 style="text-align: center">Giới thiệu</h2>
                        <p><%=diner.getDetail()%></p>
                    </div>
                </div>
                <div class="right-content">
                    <div class="posts">
                        <h2>Bài Viết</h2>
                        <%

                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                            ArrayList<FoodAd> fa = new ArrayList<>();
                            FoodAdManager fam = new FoodAdManager();
                            LikePostManager lpm = new LikePostManager();
                            ArrayList<FoodAd> fas = FoodAdDao.getAllFoodAds();
                            ArrayList<LikePost> likeP = new ArrayList<>();
                            int accId = -1;
                            if (session.getAttribute("account") != null) {
                                // Lấy accountId của người dùng từ session
                                Account account = (Account) session.getAttribute("account");
                                likeP = lpm.getLikePostByAccountId(account.getAccount_id());
                                accId = account.getAccount_id();
                            }
                            if (fas != null) {
                                for (FoodAd foodAd : fas) {
                                    Boolean check = false;
                                    // Assume each FoodAd has a related Account object
                                    Account diner1 = foodAd.getDinner_manager();
                                    int countLike = lpm.CountLikeByPostId(foodAd.getAd_id());
                                    if (likeP != null) {
                                        for (LikePost lp : likeP) {
                                            if (lp.getPost().getAd_id() == foodAd.getAd_id()) {
                                                check = true;
                                                break;
                                            }
                                        }
                                    }
                                    if (foodAd.getDinner_manager().getAccount_id() == dinerId) {
                        %>

                        <div class="status-field-container write-post-container">
                            <div class="user-profile-box">
                                <div class="user-profile">
                                    <img src="<%=diner.getProfile_picture()%> "  alt="">
                                    <div>
                                        <p> <%= diner.getName()%></p>
                                        <small><%= foodAd.getCreated_at().format(formatter)%></small>
                                    </div>
                                </div>
                                <!--                        <div>
                                                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                                        </div>-->
                            </div>
                            <div class="status-field">
                                <p><%= foodAd.getContent()%> </p>
                                <img src="<%= foodAd.getImage_url()%>" class="food-ad-image">

                            </div>
                            <div class="post-reaction">
                                <div class="activity-icons">
                                    <div>
                                        <img src="images/like.png" alt=""
                                             data-post-id="<%= foodAd.getAd_id()%>"
                                             class="<%= check ? "unlike-btn" : "like-btn"%>"
                                             data-liked="<%= check ? "true" : "false"%>">
                                        <span class="like-count"><%= countLike%></span>
                                    </div>
                                </div>

                            </div>
                            <div class="post-profile-picture">
                                <a href="CustomerSocialDetailPage?ad_id=<%= foodAd.getAd_id()%>&check=false" class="btn-link">Xem thông tin chi tiết</a>
                            </div>

                        </div>
                        <%
                                    }
                                }
                            }%>  
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
        <script>
            document.getElementById('follow-btn').addEventListener('click', function () {
                var btn = this;
                var action = btn.classList.contains('followed') ? 'unfollow' : 'follow';
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/follow');
                xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        if (action === 'follow') {
                            btn.textContent = 'Followed';
                            btn.classList.add('followed');
                        } else {
                            btn.textContent = 'Follow';
                            btn.classList.remove('followed');
                        }
                    }
                };
                xhr.send(JSON.stringify({action: action}));
            });
        </script>
        
    </body>
</html>
