　

<%@page import="model.ReplyCommentManager"%>
<%@page import="model.LikeManager"%>
<%@page import="model.ReplyComment"%>
<%@page import="model.Like"%>
<%@page import="model.Comment"%>
<%@page import="model.CommentManager"%>
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
                display: flex;
                width: 100%;
                justify-content: center;
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

            .write-post-container {
                color: #626262;
                background-color: var(--bg-color);
                width: 1000px;
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
                justify-content: center;
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

            /* Comment section styles */
            .comments-section {
                margin-top: 20px;
            }

            .comments-section h2 {
                margin-bottom: 10px;
                font-size: 16px;
                font-weight: bold;
            }

            .comment-box {
                display: flex;
                align-items: flex-start;
                margin-bottom: 10px;
                width: 100%;
            }

            .comment-box .user-avatar {
                margin-right: 10px;
            }

            .comment-box .user-avatar img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }

            .comment-box .comment-content {
                display: flex;
                flex-direction: column;
                flex: 1;
            }
            .comment-content {
                width: calc(100% - 60px); /* Adjust this value if needed */
                min-height: 100px; /* Adjust the height if needed */
                border: none;
                outline: none;
                padding: 5px;
                box-sizing: border-box;
            }

            .comment-box textarea {
                width: 900px;
                height: 70px;
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 10px;
                resize: none;
                box-sizing: border-box;
            }

            .submit-btn {
                margin-top: 10px;
                align-self: flex-end;
            }

            .submit-btn button {
                background-color: #4267B2;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }

            .submit-btn button:hover {
                background-color: #365899;
            }

            .existing-comments {
                margin-top: 20px;
            }

            .comment {
                display: flex;
                align-items: flex-start;
                margin-bottom: 10px;
            }

            .comment .user-avatar {
                margin-right: 10px;
            }

            .comment .user-avatar img {
                width: 30px;
                height: 30px;
                border-radius: 50%;
            }

            .comment .comment-text {
                background: #f0f2f5;
                padding: 10px;
                border-radius: 16px;
                max-width: 100%;
                word-wrap: break-word;
                flex: 1;
            }

            .comment .comment-text p {
                margin: 0;
            }

            .comment .comment-text strong {
                font-weight: bold;
            }
            .back-link {
                display: block;
                margin-left: 10px;
                height: 20px;
                text-decoration: none;
                color: #000;
            }
            .comment-container {
                position: relative;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 5px;
                width: 900px;
                height: 100px;
                box-sizing: border-box;
                overflow-x: hidden;
            }
            #submitRatingBtn {
                position: absolute;
                right: 10px; /* Adjust this value if needed */
                bottom: 10px; /* Adjust this value if needed */
                padding: 5px 10px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            #submitRatingBtn:hover {
                background-color: #0056b3;
            }
        </style>
    </head>

    <body style="background-color: #dddddd">

        <jsp:include page="path/header.jsp"/>


        <% 
            String check = request.getParameter("check");
                    String url;
                    if (check.equalsIgnoreCase("true")) {
                        url = "CustomerSocialFollowPage";
                    } else {
                        url = "CustomerSocialPage";
                    }
        %>
        <div class="container_content">
            <a href="<%= url %>" class="back-link">BACK</a>

            <!-- main-content------- -->

            <div class="content-area">
                <%
                    int id = Integer.parseInt(request.getParameter("ad_id"));
                    Account account = (Account) session.getAttribute("account");
                    if (request.getParameter("ad_id") == null || request.getParameter("check") == null) {
                        response.sendRedirect("CustomerSocialPage");
                        return;
                    }

                    String adId = request.getParameter("ad_id");

                    int adIdInt = Integer.parseInt(adId);
                    FoodAdManager fam = new FoodAdManager();
                    FoodAd foodAd = fam.getFoodAdById(adIdInt);
                    

                    if (foodAd != null) {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        Account diner = foodAd.getDinner_manager();
                        LikePostManager lpm = new LikePostManager();
                        int countLike = lpm.CountLikeByPostId(foodAd.getAd_id());

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

                    </div>
                    <div class="status-field">
                        <p><%= foodAd.getContent()%> </p>
                        <img src="<%= foodAd.getImage_url()%>" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like.png" alt=""><%= countLike%></div>

                        </div>
                    </div>
                    <div class="comments-section">

                        <h2>Comments</h2>
                        <div class="comment-box">
                            <div class="user-avatar">
                                <img src="<%=account.getProfile_picture()%>" alt="<%= account.getName()%>">
                            </div>
                            <form action="RateServlet" method="POST" onsubmit="updateHiddenTextarea()">
                                <input type="hidden" id="status" name="status" value="Post">
                                <input type="hidden" id="ad_id" name="ad_id" value="<%=id%>">
                                <input type="hidden" id="check" name="check" value="<%= check%>">
                                <div class="comment-container">
                                    <div class="comment-content" contenteditable="true" id="commentContent" placeholder="Hãy bình luận gì đó.."></div>
                                    <textarea id="hiddenComment" name="comment" style="display: none;"></textarea>
                                    <button id="submitRatingBtn" type="submit">Đăng</button>
                                </div>
                            </form>
                            <script>
                                function updateHiddenTextarea() {
                                    var commentContent = document.getElementById('commentContent').innerText;
                                    document.getElementById('hiddenComment').value = commentContent;
                                }
                            </script>
                        </div>


                        <!-- Existing comments -->
                        <div class="existing-comments">
                            <%

                                LikeManager lm = new LikeManager();
                                ReplyCommentManager rcm = new ReplyCommentManager();

                                int accId = -1;
                                if (session.getAttribute("account") != null) {
                                    // Lấy accountId của người dùng từ session

                                    accId = account.getAccount_id();
                                }
                                CommentManager cm = new CommentManager();
                                for (Comment comment : cm.getList()) {
                                    if (comment.getPost() != null && comment.getPost().getAd_id() == id) {


                            %>
                            <div class="comment">

                                <div class="user-avatar">
                                    <img src="<%= comment.getAccount().getProfile_picture()%>" >
                                </div>

                                <div class="comment-text">
                                    <p><strong><%= comment.getAccount().getName()%></strong></p>
                                    <p><strong></strong><%= comment.getContent()%></p>
                                </div>
                            </div>
                            <!-- Repeat for more comments -->
                            <% }
                                }%>
                        </div>
                    </div>

                    <div class="post-profile-picture">
                        <a href="<%=url%>" >Trở về trang chủ</a>
                    </div>
                </div>
                <%
                    }

                %>  



            </div>
        </div>
    </div>



</script>


<script src="js/function.js"></script>
</body>
</html>
