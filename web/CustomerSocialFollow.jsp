　

<%@page import="model.LikePostManager"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.FoodAdDao"%>
<%@page import="model.FoodAdManager"%>
<%@page import="model.FoodAd"%>
<%@page import="model.AccountManager"%>
<%@page import="model.AccountDao"%>
<%@page import="model.Follower"%>
<%@page import="model.FollowerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">
        <title> HungryHub </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!--owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- nice select  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <style>
            * {
                padding: 0px;
                margin: 0px;
                box-sizing: border-box;
            }
            :root {
                --body-color: #efefef;
                --nav-color: #ff9900;
                --bg-color: #fff;
            }
            body {
                background: var(--body-color);
                transition: background 0.3s;
            }
            .container_content {
                display: flex;
                justify-content: space-between;
                padding: 13px 5%;
            }
            .left-sidebar {
                flex-basis: 25%;
                position: sticky;
                margin-top: 20px;
                background-color: white;
                border-radius: 4px;
                padding: 20px;
                top: 30px;
                margin-bottom: 75px;
                align-self: flex-start;
                min-height: 550px;
            }
            .right-sidebar {
                flex-basis: 25%;
                position: sticky;
                margin-top: 20px;
                top: 30px;
                margin-bottom: 75px;
                align-self: flex-start;
                background: var(--bg-color);
                border-radius: 4px;
                padding: 20px;
                color: #626262;
                min-height: 550px;
            }
            .content-area {
                flex-basis: 47%;
                position: sticky;
                top: 70px;
                align-self: flex-start;
            }
            .important-links a,
            .shortcut-links a {
                display: flex;
                align-items: center;
                text-decoration: none;
                margin-bottom: 30px;
                color: #626262;
                width: fit-content;
            }
            .important-links a img {
                width: 25px;
                margin-right: 15px;
            }
            .important-links a:last-child {
                color: #1876f2;
            }
            .important-links {
                border-bottom: 1px solid #ccc;
            }
            .heading-link {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 18px;
            }
            .right-sidebar {
                font-weight: 500;
                font-size: 16px;
            }
            .heading-link a {
                text-decoration: none;
                color: var(--nav-color);
                font-size: 13px;
            }
            .online-list {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            .online-list .online img {
                width: 50px;
                border-radius: 50%;
            }
            .online-list .online {
                width: 46px;
                border-radius: 50%;
                margin-right: 15px;
            }
            .online-list .online::after {
                top: unset;
                bottom: 5px;
            }
            .story-gallery {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            .story {
                flex-basis: 18%;
                padding-top: 32%;
                position: relative;
                border-radius: 10px;

            }
            .story img {
                position: absolute;
                top: 10px;
                left: 10px;
                width: 45px;
                border-radius: 50%;
                border: 5px solid var(--nav-color);

            }
            .story p {
                position: absolute;
                bottom: 10px;
                text-align: center;
                width: 100%;
                color: #c9c9c9;
                font-size: 18px;
            }
            .story.story1 {
                background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-1.png) no-repeat center center /cover;
            }
            .story.story2 {
                background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-2.png) no-repeat center center /cover;
            }
            .story.story3 {
                background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-3.png) no-repeat center center /cover;
            }
            .story.story4 {
                background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-4.png) no-repeat center center /cover;
            }
            .story.story5 {
                background: linear-gradient(transparent, rgba(0, 0, 0, 0.5)), url(images/status-5.png) no-repeat center center /cover;
            }
            .story.story1 img {
                top: unset;
                left: 50%;
                bottom: 40px;
                transform: translateX(-50%);
                border: 0;
                width: 35px;
            }
            .write-post-container {
                color: #626262;
                background-color: var(--bg-color);
                width: 100%;
                padding: 20px;
                border-radius: 6px;
            }
            .user-profile {
                display: flex;
                align-items: center;
            }
            .user-profile img {
                width: 45px;
                border-radius: 50%;
                margin-right: 10px;
            }
            .user-profile p {
                margin-bottom: -5px;
            }
            .user-profile small {
                font-size: 12px;
            }
            .post-upload-textarea {
                padding: 20px 0px 0px 55px;
            }
            .post-upload-textarea textarea {
                width: 100%;
                border: 1px;
                outline: none;
                border-bottom: 1px solid #ccc;
                background: transparent;
                resize: none;
            }
            .add-post-links {
                display: flex;
                justify-content: space-around;
                margin-top: 10px;
            }
            .add-post-links a {
                text-decoration: none;
                display: flex;
                align-items: center;
                color: #626262;
                font-size: 13px;
            }
            .add-post-links a img {
                width: 20px;
                margin-right: 13px;
            }
            .status-field-container {
                margin-top: 20px;
            }
            .status-field img {
                width: 100%;
                margin-top: 15px;
                border-radius: 6px;
            }
            .status-field p {
                font-size: 14px;
                margin: 20px 0px 5px 0px;
                text-transform: capitalize;
                color: #626262;
            }
            .status-field p a {
                color: var(--nav-color);
            }
            .activity-icons div {
                display: inline-flex;
                align-items: center;
                margin-right: 30px;
            }
            .activity-icons div img {
                width: 18px;
                margin-right: 10px;
            }
            .post-reaction {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 10px;
            }
            .post-profile-picture img {
                width: 20px;
                border-radius: 50%;
                margin-right: 4px;

            }
            .post-profile-picture {

                display: flex;
                align-items: center;
                justify-content:center;
            }
            .user-profile-box {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            button.btn-LoadMore {
                margin: 20px auto;
                display: flex;
                cursor: pointer;
                padding: 5px 10px;
                border: 1px solid #9a9a9a;
                color: #626262;
                background: transparent;
                border-radius: 4px;
            }
             .status-field .food-ad-image {
        max-width: 100%;  /* Giới hạn chiều rộng tối đa của ảnh */
        max-height: 200px;  /* Giới hạn chiều cao tối đa của ảnh */
        object-fit: cover;  /* Điều chỉnh ảnh để vừa với khung */
    }
        </style>
    </head>

    <body style="background-color: #dddddd">

        <jsp:include page="path/header.jsp"/>

        <div class="container_content">
            <div class="left-sidebar">
                <div class="important-links">
                    <a href="CustomerSocialPage"><img src="images/news.png" alt="">Dành cho bạn</a>
                    <a href="CustomerSocialFollowPage"><img src="images/friends.png" alt="">Đang theo dõi</a>

                </div>
            </div>

            <!-- main-content------- -->

            <div class="content-area">
                <%
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    ArrayList<FoodAd> fa = new ArrayList<>();
                    FoodAdManager fam = new FoodAdManager();
                    LikePostManager lpm = new LikePostManager();
                    ArrayList<FoodAd> fas = FoodAdDao.getAllFoodAds();
                     ArrayList<Follower> allFollower = FollowerDao.getAllFollowers();
                     ArrayList<Follower> followedDiner = new ArrayList<>();
                    if (fas != null ) {
                        for (FoodAd foodAd : fas) {
                            // Assume each FoodAd has a related Account object
                            Account diner = foodAd.getDinner_manager();
                            int countLike = lpm.CountLikeByPostId(foodAd.getAd_id());
                            
                             boolean isFollowed = false;
            for (Follower follower : allFollower) {
                if (diner.getAccount_id() == follower.getAccount().getAccount_id()) {
                    followedDiner.add(follower);
                    isFollowed = true;
                    break; // Nếu tìm thấy, thoát khỏi vòng lặp
                }}
                             


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
                            <div><img src="images/like.png" alt=""><%= countLike%></div>
                            <!--                            <div><img src="images/comments.png" alt="">52</div>
                                                        <div><img src="images/share.png" alt="">35</div>-->
                        </div>

                    </div>
                    <div class="post-profile-picture">
                          <a href="CustomerSocialDetailPage?ad_id=<%= foodAd.getAd_id() %>&check=true" class="btn-link">Xem thông tin chi tiết</a>
                    </div>

                </div>
                <% }
                            
                        %>  


                <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
            </div>

            <!-- sidebar------------ -->
            <div class="right-sidebar">
                <%
                    Account acc = (Account) session.getAttribute("account");
                    if (acc == null) {
                        response.sendRedirect("LoginServlet");
                        return;
                    }
                    ArrayList<Follower> allFollowers = FollowerDao.getAllFollowers();
                    AccountManager am = new AccountManager();
                    // Lọc danh sách các follower theo tài khoản hiện tại
                    ArrayList<Follower> followedDiners = new ArrayList<>();
                    for (Follower follower : allFollowers) {
                        if (follower.getAccount().getAccount_id() == acc.getAccount_id()) {
                            followedDiners.add(follower);
                        }
                    }

                %>
                <div class="heading-link">
                    <h4>Following</h4>
                </div>

                <% if (followedDiners != null && !followedDiners.isEmpty()) { %>
                <% for (Follower follower : followedDiners) {
                        Account diner = am.getAccountById(follower.getFollowerUser().getAccount_id());
                        if (diner != null) {
                %>
                <div class="online-list">
                    <div class="online">
                        <img src="<%= diner.getProfile_picture()%>" alt="Diner Image">
                    </div>
                    <span><%= diner.getName()%></span>
                </div>
                <%
                    }
                }
            }
        } else { %>
                <div class="heading-link">
                    <h4>You are not following any diners.</h4>
                </div>
                <% }%>
            </div>
        </div>
        <!-- footer section -->
        <jsp:include page="path/footer.jsp"/>
        <!-- footer section -->

        <script src="js/function.js"></script>
    </body>
</html>
