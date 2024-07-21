<%-- 
Document   : Diner
Created on : May 28, 2024, 1:33:13 AM
Author     : MSIGAMING
--%>

<%@page import="model.ReplyComment"%>
<%@page import="model.ReplyCommentManager"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Like"%>
<%@page import="model.LikeManager"%>
<%@page import="model.Comment"%>
<%@page import="model.CommentManager"%>
<%@page import="model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

        <title>Thông Tin Nhà Hàng</title>

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
        <link href="css/nutbacham.css" rel="stylesheet" />
        <link href="css/comment.css" rel="stylesheet" />
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .back-link {
                display: block;
                margin-left: 10px;
                height: 20px;
                text-decoration: none;
                color: #000;
            }

            .restaurant {
                width: 88%;
                max-width: 1300px;
                margin: 20px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                font-family: Arial, sans-serif;
            }

            .restaurant-bg {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .restaurant-detail {
                display: flex;
                align-items: center;
                padding: 20px;
                position: relative;
                margin-left: 50px;
                top: -140px;
            }

            .restaurant-img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                border: 5px solid #fff;
                object-fit: cover;
                margin-right: 20px;
            }

            .restaurant-info {
                display: flex;
                flex-direction: column;
                justify-content: center;
                position: relative;
                margin-left: 50px;
                top: 130px;
            }
            .restaurant-name {
                font-size: 2em;
                color: #333;
                margin-bottom: 10px;
            }
            .restaurant-description{
                margin-bottom: 20px;
                width: 900px;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 1.2em;
                color: #666;
            }
            .restaurant-address,
            .restaurant-rating,
            .restaurant-opening-time {
                font-size: 1.2em;
                color: #666;
                margin-bottom: 5px;
            }

            .restaurant-address::before {
                content: "📍 ";
            }
            .restaurant-rating::before {
                content: "⭐ ";
            }
            .restaurant-opening-time::before {
                content: "⏰ ";
            }

            .restaurant-rating {
                color: #FFD700; /* Gold color for rating */
            }

            .restaurant-opening-time {
                color: #008000; /* Green color for opening time */
            }

            #container {
                display: flex;
                justify-content: center;
            }

            #content {
                display: flex;
                max-width: 1300px;
                width: 100%;
                justify-content: space-between;
                padding-bottom: 20px
            }
            #cart {
                border-radius: 8px;
                background-color: white;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                width: 30%;
                height: 600px;
                margin-left: 20px;
                padding: 20px;
                position: -webkit-sticky;
                position: sticky;
                top: 10px;
                margin-bottom: 50px;
            }

            #dish {
                border-radius: 8px;
                margin-top: 0px;
                margin-bottom: 50px;
                background-color: white;
                width: 70%;
                padding: 40px;
                /*border-radius: 10px;*/
                height: auto;
            }

            .dish-detail {
                display: flex;
                margin: 20px;
            }

            .dish-img {
                width: 80px;
                height: 80px;
            }

            .dish-description {
                max-width: 600px;
                display: flex
            }

            .quantity-container {
                margin: 10px 0;
            }

            .btn2 {
                display: inline-block;
                width: 32px;
                height: 32px;
                margin-left: 10px;
                background-color: #ff9900;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 50%;
            }

            .btn:hover {
                background-color: #ffc107;
            }

            .comments-section {
                width: 100%;
                margin-top: 20px;
            }
            #cartOrder{
                margin-bottom: 20px;
                overflow-y: auto;
                height: 420px;
            }
            #addToCartButton{
                height: 30px;
                width: 30px;
                text-align: center;
            }
            /*comment*/
            .btn-diner {
                background-color: #ff6347;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 15px;
                width: 100%;
                font-size: 18px;
                font-weight: bold;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
                margin-bottom: 20px;
            }
            .btn-diner::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 200%;
                height: 200%;
                background-color: rgba(255, 255, 255, 0.3);
                transform: translate(-50%, -50%) rotate(45deg);
                transition: all 0.75s ease;
            }
            .btn-diner:hover::before {
                width: 0;
                height: 0;
            }
            .btn-diner:hover {
                background-color: #ff4500;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
                transform: translateY(-2px);
            }
            .back-arrow {
                font-size: 20px;
                cursor: pointer;
                color: black;
            }
            
            .back-arrow span:hover {
                color: blue;
            }

            .back-arrow span {
                margin-left: 8px;
            }
        </style>
    </head>

    <body>
        <div>
            <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
        </div>
        <%
            int id;
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            } else {
                response.sendRedirect("HomePage");
                return;
            }
            AccountManager am = new AccountManager();
            Account diner = am.getAccountById(id);
            CommentManager cm = new CommentManager();
        %>
        <div style="background-color: #dddddd">
            <a href="index.jsp" class="back-arrow">&#8592; <span>Quay lại</span></a>
            <div class="restaurant">
                <img src="<%= diner.getBackground_picture()%>" class="restaurant-bg" alt="Restaurant Image"/>
                <section class="restaurant-detail">
                    <img src="<%= diner.getProfile_picture()%>" class="restaurant-img" alt="Restaurant Image"/>
                    <div class="restaurant-info">
                        <div class="restaurant-name"><%=diner.getName()%></div>
                        <div class="restaurant-description"><%=diner.getDetail()%></div>
                        <div class="restaurant-address"><%=diner.getAddress()%> - <%= diner.getDistrict()!=null?diner.getDistrict().getName(): "Chưa thiết lập"%> - <%= diner.getProvinces()!=null? diner.getProvinces().getName(): "Chưa thiết lập"%></div>
                        <div class="restaurant-rating">Rating: <%=cm.ratingTotal(id)%> / 5★</div>
                        <div class="restaurant-opening-time">Opening Time: overtime</div>   
                    </div> 
                </section>
            </div>

            <div id="container">
                <div id="content">
                    <div id="dish">
                        <%
                            DishManager dm = new DishManager();
                            ArrayList<Dish> listDish = dm.getDishByDinerId(id);
                            for (Dish d : listDish) {
                        %>
                        <div class="dish-detail">
                            <img class="dish-img col-md-2" src="<%=d.getPicture()%>" alt="Dish Image">
                            <div class="dish-description col-md-10">
                                <div class="col-md-9">
                                    <h3 id="dishName"><a href="CustomerDishPage?id=<%=d.getDish_id()%>" style="color: black"><%=d.getName()%></a></h3>
                                    <p>Price: <span id="dishPrice"><%=d.getPrice()%>₫</span></p>
                                </div>

                                <div class="col-md-3" style="align-content: center">
                                    <input type="number" id="quantity_<%=d.getDish_id()%>" name="quantity" min="1" max="100">
                                    <button class="btn2" onclick="addToCart(<%=d.getDish_id()%>)"><i class="fa fa-cart-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        <%
                            }%>
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
                                                <input type="hidden" id="status" name="status" value="diner">
                                                <input type="hidden" id="dinerId" name="dinerId" value="<%=id%>">
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
                                Account account;
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                                int accId = -1;
                                if (session.getAttribute("account") != null) {
                                    // Lấy accountId của người dùng từ session
                                    account = (Account) session.getAttribute("account");
                                    likeList = lm.getLikesByAccountId(account.getAccount_id());
                                    accId = account.getAccount_id();
                                }
                                for (Comment comment : cm.getList()) {
                                    Boolean check = false;
                                    if (comment.getDiner() != null && comment.getDiner().getAccount_id() == id) {
                                        for (Like l : likeList) {
                                            if (l.getComment().getCommentId() == comment.getCommentId()) {
                                                check = true;
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
                                                        <input type="hidden" name="status" value="comment">
                                                        <input type="hidden" name="dinerId" value="<%=id%>">
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
                                            <input type="hidden" name="status" value="diner">
                                            <input type="hidden" name="dinerId" value="<%=id%>">
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
                                        if (check) {
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
                            <!-- Display reply comments -->
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
                                                            <input type="hidden" name="dinerId" value="<%=id%>">
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
                    <div id="cart" style="background-color: #fff;">
                        <h2></h2>
                        <div class="social-container">
                            <form action="CustomerDinerFanpagePage" method="Post">
                                <input type="hidden" name="dinerId" value="<%= id %>" >
                                <button type="submit" class="btn-diner">Trang cộng đồng</button>
                            </form>
                        </div>
                        <div class="voucher-container">
                            <form action="CustomerDinerVoucherPage" method="POST" >
                                <input type="hidden" name="check" value="false">
                                <input type="hidden" name="dinerId" value="<%= id %>" >
                                <button type="submit" class="btn-diner">Voucher của quán</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer section -->
        <jsp:include page="path/footer.jsp"/>
        <!-- footer section -->
        <!-- comment -->
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
                                var replyInput = '<div><form action="RepCommentServlet" class="reply-input" method="post"><input type="hidden" name="dinerId" value="<%=id%>"><input type="hidden" name="status" value="comment"><input type="hidden" name="commentId" value="' + commentId + '"><textarea class="reply-comment" name="replyContent" placeholder="Nhập suy nghĩ của bạn..." ></textarea><button class="submit-reply-btn" type="submit">Gửi</button></form></div>';
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
        <!--cart-->
        <script>
            function addToCart(dishId) {
                var quantity = document.getElementById('quantity_' + dishId).value;
                if (quantity.trim() === '') {
                    alert('Hãy nhập số lượng món.');
                    return; // Dừng hàm và không tiếp tục thực hiện AJAX request
                }
                $.ajax({
                    url: 'AddToCartServlet', // Đường dẫn đến Servlet
                    type: 'POST',
                    data: {
                        id: dishId,
                        quantity: quantity
                    },
                    success: function (response) {
                        if (response.status === 'notLoginYet') {
                            alert(response.message);
                        } else {
                            var notificationDot = document.querySelector('.notification-dot.cart');

                            if (!notificationDot) {
                                // Nếu chưa có notification-dot cart, thêm nó vào
                                var iconContainer = document.querySelector('.icon_container');
                                var notificationSpan = document.createElement('span');
                                notificationSpan.className = 'notification-dot cart';
                                iconContainer.appendChild(notificationSpan);
                            }
                            var cartItemsContainer = document.querySelector('.cart-items');
                            cartItemsContainer.innerHTML = '';
                            // Thêm nội dung mới vào cart-items
                            cartItemsContainer.insertAdjacentHTML('beforeend', response);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(error);
                    }
                });
            }
        </script>
        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- Your other JavaScript imports here -->
        <script>

        </script>

    </body>
</html>
