　

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
        </style>
    </head>

    <body style="background-color: #dddddd">

        <jsp:include page="path/header.jsp"/>



        <div class="container_content">


            <!-- main-content------- -->

            <div class="content-area">
                <%
                     
                    if (request.getParameter("ad_id") == null || request.getParameter("check") == null) {
                        response.sendRedirect("CustomerSocialPage");
                        return;
                    }
                    String adId = request.getParameter("ad_id");
                    int adIdInt = Integer.parseInt(adId);
                    FoodAdManager fam = new FoodAdManager();
                    FoodAd foodAd = fam.getFoodAdById(adIdInt);
                    String check = request.getParameter("check");
                    String url;
                    if(check.equalsIgnoreCase("true"))
                    {
                     url = "CustomerSocialFollowPage";
                    }else{
                      url = "CustomerSocialPage";
                    }
                    
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
                        <!--                        <div>
                                                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                                </div>-->
                    </div>
                    <div class="status-field">
                        <p><%= foodAd.getContent()%> </p>
                        <img src="<%= foodAd.getImage_url()%>" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like.png" alt=""><%= countLike%></div>
                            <!--                            <div><img src="images/comments.png" alt="">52</div>
                                                        <div><img src="images/share.png" alt="">35</div>-->
                        </div>
                    </div>

                    <div class="post-profile-picture">
                        <a href="<%=url%>" >Trở về trang chủ</a>
                    </div>
                </div>
                <%
                    }
                    int id = Integer.parseInt(request.getParameter("ad_id"));

                %>  


                <div class="comments-section">
                    <h2>Comments</h2>
                    <div class="body_cmt">
                        <!-- Nút bấm để mở cửa sổ đánh giá -->
                        <button id="open-rating-btn">Nhập đánh giá ở đây</button>

                        <!-- Nền tối mờ -->
                        <div id="overlay"></div>

                        <!-- Cửa sổ đánh giá sao -->
                        <div class="modal_cmt" id="rating-modal">
                            <div class="container_cmt">
                                <div class="post">
                                    <div class="text">Cảm ơn vì đánh giá của bạn!</div>
                                </div>
                                <div class="star-widget">
                                    <input type="radio" name="rate" id="rate-5" value="5">
                                    <label for="rate-5" class="fas fa-star"></label>
                                    <input type="radio" name="rate" id="rate-4" value="4">
                                    <label for="rate-4" class="fas fa-star"></label>
                                    <input type="radio" name="rate" id="rate-3" value="3">
                                    <label for="rate-3" class="fas fa-star"></label>
                                    <input type="radio" name="rate" id="rate-2" value="2">
                                    <label for="rate-2" class="fas fa-star"></label>
                                    <input type="radio" name="rate" id="rate-1" value="1">
                                    <label for="rate-1" class="fas fa-star"></label>
                                    <form id="ratingForm" action="RateServlet" method="POST">
                                        <header></header>
                                        <input type="hidden" id="status" name="status" value="dish">
                                        <input type="hidden" id="dishId" name="dishId" value="<%=id%>">
                                        <div class="textarea">
                                            <textarea id="commentContent" name="comment"  cols="30" placeholder="Hãy mô tả trải nghiệm của bạn.."></textarea>
                                        </div>
                                        <div class="btn">
                                            <button id="submitRatingBtn" type="submit">Đăng</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%

                        ArrayList<Like> likeList = new ArrayList<Like>();
                        ArrayList<ReplyComment> rcList = new ArrayList<ReplyComment>();
                        LikeManager lm = new LikeManager();
                        ReplyCommentManager rcm = new ReplyCommentManager();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        int accId = -1;
                        if (session.getAttribute("account") != null) {
                            // Lấy accountId của người dùng từ session
                            Account account = (Account) session.getAttribute("account");
                            likeList = lm.getLikesByAccountId(account.getAccount_id());
                            accId = account.getAccount_id();
                        }
                        CommentManager cm = new CommentManager();
                        for (Comment comment : cm.getList()) {
                            Boolean check1 = false;
                            if (comment.getDish() != null && comment.getPost().getAd_id() == id) {
                                for (Like l : likeList) {
                                    if (l.getComment().getCommentId() == comment.getCommentId()) {
                                        check1 = true;
                                    };
                                }
                    %>
                    <div class="comment">
                        <div class="comment-header">
                            <div>
                                <span class="username"><%=comment.getAccount().getName()%></span>
                                <span class="time"><%=comment.getCreated_at().format(formatter)%></span>
                            </div>
                            <%
                                if (comment.getAccount().getAccount_id() == accId) {
                            %>
                            <div class="comment-options">
                                <button class="options-btn">⋮</button>
                                <div class="options-menu">
                                    <ul>
                                        <li class="edit-option"><button class="edit-comment-btn delete_btn" data-comment-id="<%=comment.getCommentId()%>">Chỉnh sửa</button>
                                        </li>
                                        <li class="delete-option">
                                            <form action="deleteCommentServlet" method="POST">
                                                <input type="hidden" name="status" value="dish">
                                                <input type="hidden" name="dishId" value="<%=id%>">
                                                <input type="hidden" name="commentID" value="<%=comment.getCommentId()%>">
                                                <button type="submit" value="" name="deleteBtn" class="delete_btn">Xóa</button>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div id="overlay2"></div>
                            <div class="commentBox" id="cmtId_<%=comment.getCommentId()%>">
                                <form action="editCommentServlet" method="post" onsubmit="return validateForm()">
                                    <input type="hidden" name="status" value="dish">
                                    <input type="hidden" name="dishId" value="<%=id%>">
                                    <input type="hidden" name="commentID" value="<%=comment.getCommentId()%>">
                                    <div class="stars">
                                        <input type="radio" name="rate" id="ed-rate-5-<%=comment.getCommentId()%>" value="5">
                                        <label for="ed-rate-5-<%=comment.getCommentId()%>" class="fas fa-star"></label>
                                        <input type="radio" name="rate" id="ed-rate-4-<%=comment.getCommentId()%>" value="4">
                                        <label for="ed-rate-4-<%=comment.getCommentId()%>" class="fas fa-star"></label>
                                        <input type="radio" name="rate" id="ed-rate-3-<%=comment.getCommentId()%>" value="3">
                                        <label for="ed-rate-3-<%=comment.getCommentId()%>" class="fas fa-star"></label>
                                        <input type="radio" name="rate" id="ed-rate-2-<%=comment.getCommentId()%>" value="2">
                                        <label for="ed-rate-2-<%=comment.getCommentId()%>" class="fas fa-star"></label>
                                        <input type="radio" name="rate" id="ed-rate-1-<%=comment.getCommentId()%>" value="1">
                                        <label for="ed-rate-1-<%=comment.getCommentId()%>" class="fas fa-star"></label>
                                    </div>
                                    <header></header>
                                    <textarea name="content" placeholder="Hãy mô tả trải nghiệm của bạn.."><%=comment.getContent()%></textarea><br>
                                    <button type="submit">Chỉnh sửa</button>
                                </form>
                            </div>
                            <%}%>
                        </div>
                        <div class="comment-body">
                            <p><%=comment.getContent()%></p>
                        </div>
                        <div class="comment-footer">
                            <div class="rating" data-rating="<%=comment.getRating()%>"></div>
                            <%
                                if (check1) {
                            %>
                            <button class="unlike-btn liked" data-like-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>" data-liked="true">Liked</button>
                            <%
                            } else {%>
                            <button class="like-btn btn" data-like-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>" data-liked="false">Like</button>
                            <%
                                }%>
                            <button class="btn rep-btn" data-rep-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>">Rep</button>
                        </div>
                    </div>
                    <div data-rep-comment-id="<%=comment.getCommentId()%>" data-comment-id="<%=comment.getCommentId()%>"></div>
                    <%
                        rcList = rcm.getReplyCommentByCommentId(comment.getCommentId());
                        for (ReplyComment rc : rcList) {
                    %>
                    <div class="replies">
                        <div class="reply-comment">
                            <div class="comment-header reply-header">
                                <div>
                                    <span class="username"><%=rc.getAccount().getName()%></span>
                                    <span class="time"><%=rc.getCreated_at().format(formatter)%></span>
                                </div>
                                <%
                                    if (rc.getAccount().getAccount_id() == accId) {
                                %>
                                <div class="comment-options">
                                    <button class="options-btn">⋮</button>
                                    <div class="options-menu">
                                        <ul>
                                            <li class="delete-option">
                                                <form action="deleteCommentServlet" method="POST">
                                                    <input type="hidden" name="status" value="reply">
                                                    <input type="hidden" name="dishId" value="<%=id%>">
                                                    <input type="hidden" name="replycommentID" value="<%=rc.getRepcommentId()%>">
                                                    <button type="submit" value="" name="deleteBtn" class="delete_btn">Xóa</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <%
                                    }%>
                            </div>
                            <div class="reply-body">
                                <p><%=rc.getContent()%></p>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }%>
                </div>
            </div>
        </div>
        <!-- footer section -->
        <jsp:include page="path/footer.jsp"/>
        <!-- Comment Script-->
        <script type="text/javascript">
            // Thiết lập biến JavaScript dựa trên trạng thái đăng nhập của người dùng
            var isLoggedIn = <%=request.getSession().getAttribute("account") != null%>;
        </script>
        <!--check submit form chinh sua -->
        <script>
            function validateForm() {
                // Lấy danh sách các radio button có name là 'rate'
                var rates = document.getElementsByName('rate');
                var rateSelected = false;

                // Kiểm tra nếu bất kỳ radio nào được chọn
                for (var i = 0; i < rates.length; i++) {
                    if (rates[i].checked) {
                        rateSelected = true;
                        break;
                    }
                }

                // Nếu không có radio nào được chọn, hiển thị cảnh báo và ngăn gửi form
                if (!rateSelected) {
                    alert("Vui lòng chọn đánh giá!");
                    return false;
                }

                // Nếu có rate được chọn, cho phép gửi form
                return true;
            }
        </script>
        <!--js nut 3 cham cua comment -->
        <script>
            document.querySelectorAll('.options-btn').forEach(button => {
                button.addEventListener('click', (e) => {
                    // Ẩn tất cả các menu khác
                    document.querySelectorAll('.options-menu').forEach(menu => {
                        menu.style.display = 'none';
                    });

                    // Hiển thị menu hiện tại
                    const menu = button.nextElementSibling;
                    if (menu.style.display === 'block') {
                        menu.style.display = 'none';
                    } else {
                        menu.style.display = 'block';
                    }
                });
            });

            // Đóng menu khi nhấn ra ngoài
            window.addEventListener('click', (e) => {
                if (!e.target.matches('.options-btn')) {
                    document.querySelectorAll('.options-menu').forEach(menu => {
                        menu.style.display = 'none';
                    });
                }
            });
        </script>
        <!-- hien form chinh sua -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const editButtons = document.querySelectorAll(".edit-comment-btn");
                const overlay = document.getElementById("overlay2");

                editButtons.forEach(function (button) {
                    button.addEventListener("click", function (e) {
                        e.stopPropagation(); // Ngăn chặn sự lan truyền sự kiện click lên cấp cha
                        const commentId = this.dataset.commentId;
                        const commentBox = document.getElementById("cmtId_" + commentId);
                        console.log("Comment ID:", commentId);  // Debug thông tin
                        console.log("Comment Box:", commentBox);
                        if (commentBox) {
                            commentBox.style.display = "flex";
                        } else {
                            console.warn(`No commentBox found for commentId: ${commentId}`);
                        }
                        overlay.style.display = "block";
                    });
                });

                overlay.addEventListener("click", function () {
                    const commentBoxes = document.querySelectorAll(".commentBox");
                    commentBoxes.forEach(function (box) {
                        box.style.display = "none";
                    });
                    overlay.style.display = "none";
                });
            });
        </script>
        <!-- hien thi nhap danh gia -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const openBtn = document.getElementById("open-rating-btn");
                const overlay = document.getElementById("overlay");
                const modal = document.getElementById("rating-modal");
                const closeModalBtns = document.querySelectorAll(".edit, .post button");
                const ratingForm = document.getElementById("ratingForm");
                const postBtn = document.querySelector(".star-widget .btn button");
                const post = document.querySelector(".post");
                const widget = document.querySelector(".star-widget");
                const editBtn = document.querySelector(".edit");

                // Mở cửa sổ đánh giá khi nhấn vào nút "Rate Us"
                openBtn.onclick = function () {
                    if (!isLoggedIn) {
                        alert("Vui lòng đăng nhập để thực hiện đánh giá.");
                        return;
                    }
                    overlay.style.display = "block";
                    modal.style.display = "block";
                    widget.style.display = "block";
                    post.style.display = "none";
                };

                // Đóng cửa sổ đánh giá khi nhấn vào nút "EDIT" hoặc nút "Post"
                closeModalBtns.forEach(btn => {
                    btn.onclick = function () {
                        overlay.style.display = "none";
                        modal.style.display = "none";
                    };
                });

                // Đóng cửa sổ đánh giá khi nhấn vào nền tối mờ
                overlay.onclick = function () {
                    overlay.style.display = "none";
                    modal.style.display = "none";
                };

                // Xử lý sự kiện khi nhấn nút "Post" trong form đánh giá
                postBtn.onclick = function (e) {
                    e.preventDefault();

                    const rating = document.querySelector('input[name="rate"]:checked') ? document.querySelector('input[name="rate"]:checked').value : null;
                    const comment = document.getElementById('commentContent').value;

                    // Kiểm tra nếu chưa chọn đánh giá sao hoặc chưa nhập bình luận
                    if (!rating) {
                        alert('Vui lòng chọn số sao để đánh giá.');
                        return;
                    }

                    if (!comment) {
                        alert('Vui lòng nhập bình luận.');
                        return;
                    }

                    const inputRating = document.createElement('input');
                    inputRating.type = 'hidden';
                    inputRating.name = 'rating';
                    inputRating.value = rating;
                    ratingForm.appendChild(inputRating);

                    ratingForm.submit();
                };

                // Xử lý sự kiện khi nhấn nút "EDIT" trong phần kết quả đánh giá
                if (editBtn) {
                    editBtn.onclick = function () {
                        widget.style.display = "block";
                        post.style.display = "none";
                    };
                }
            });
        </script>
        <!--like-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Hàm để cập nhật trạng thái của nút like/unlike
                function toggleLikeButton(button, liked) {
                    if (liked) {
                        button.removeClass('like-btn').addClass('unlike-btn');
                        button.removeClass('btn').addClass('liked').text('Liked');
                        button.attr('data-liked', 'true');
                    } else {
                        button.addClass('like-btn').removeClass('unlike-btn');
                        button.addClass('btn').removeClass('liked').text('Like');
                        button.attr('data-liked', 'false');
                    }
                }
                // Xử lý sự kiện nhấn nút like/unlike
                $(document).on('click', '.like-btn, .unlike-btn', function () {
                    var button = $(this);
                    var commentId = button.data('comment-id');
                    var isLiked = button.attr('data-liked') === 'true';
                    var action = isLiked ? 'unlike' : 'like';
                    console.log(commentId);
                    console.log(action);
                    $.ajax({
                        type: 'POST',
                        url: 'CommentServlet',
                        data: {action: action, commentId: commentId},
                        success: function (response) {
                            if (response.status === 'liked') {
                                toggleLikeButton(button, true);
                            } else if (response.status === 'unliked') {
                                toggleLikeButton(button, false);
                            } else {
                                alert(response.message);
                            }
                        }
                    });
                });
                $(document).on('click', '.rep-btn, .rm-rep-btn', function () {
                    var commentId = $(this).data('comment-id');
                    var action = $(this).hasClass('rep-btn') ? 'reply' : 'rm-reply';
                    $.ajax({
                        type: 'POST',
                        url: 'CommentServlet',
                        data: {action: action, commentId: commentId},
                        success: function (response) {
                            if (response.status === 'reply') {
                                var replyInput = '<div><form action="RepCommentServlet" class="reply-input" method="post"><input type="hidden" name="dishId" value="<%=id%>"><input type="hidden" name="status" value="dish"><input type="hidden" name="commentId" value="' + commentId + '"><textarea class="reply-comment" name="replyContent" placeholder="Nhập suy nghĩ của bạn..." ></textarea><button class="submit-reply-btn" type="submit">Submit</button></form></div>';
                                $('button[data-rep-comment-id="' + commentId + '"]').removeClass('rep-btn').addClass('rm-rep-btn');
                                $('div[data-rep-comment-id="' + commentId + '"]').append(replyInput);
                            } else if (response.status === 'rm-reply') {
                                $('button[data-rep-comment-id="' + commentId + '"]').removeClass('rm-rep-btn').addClass('rep-btn');
                                $('div[data-rep-comment-id="' + commentId + '"]').find('.reply-input').remove();
                            } else {
                                alert(response.message);
                            }
                        }
                    });
                });
            });
        </script>
        <!--rating-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const ratings = document.querySelectorAll('.rating');

                ratings.forEach(rating => {
                    const ratingValue = parseInt(rating.getAttribute('data-rating'), 10);
                    let stars = '';

                    for (let i = 1; i <= 5; i++) {
                        if (i <= ratingValue) {
                            stars += '<span>★</span>'; // Sao đầy
                        } else {
                            stars += '<span>☆</span>'; // Sao trống
                        }
                    }

                    rating.innerHTML = stars;
                });
            });
        </script>
        <script src="js/function.js"></script>
    </body>
</html>
