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
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            .restaurant-detail {
                display: flex;
                align-items: center;
                max-width: 1300px;
                width: 100%;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }

            .restaurant-img {
                max-width: 400px;
                height: auto;
                margin-right: 20px;
            }

            .restaurant-info {
                max-width: 500px;
            }

            .restaurant-name, .restaurant-address, .restaurant-rating, .restaurant-opening-time {
                margin: 10px 0;
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
                padding-bottom: 20px;
            }

            #dish {
                margin-top: 0px;
                margin-bottom: 50px;
                background-color: white;
                width: 100%;
                padding: 40px;
            }

            .dish-detail {
                display: flex;
                margin: 20px;
            }

            .dish-description {
                max-width: 600px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .quantity-container {
                margin: 10px 0;
            }

            .btn2 {
                display: inline-block;
                background-color: #ff9900;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 50%;
                padding: 8px 12px;
            }

            .btn2:hover {
                background-color: #ffc107;
            }

            .comments-section {
                margin-top: 20px;
            }
            .btn-add-dish {
                background-color: #ff6347;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 15px 550px;
                font-size: 18px;
                font-weight: bold;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
                margin-bottom: 20px;
            }
            .btn-add-dish::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 300%;
                height: 300%;
                background-color: rgba(255, 255, 255, 0.3);
                transform: translate(-50%, -50%) rotate(45deg);
                transition: all 0.75s ease;
            }
            .btn-add-dish:hover::before {
                width: 0;
                height: 0;
            }
            .btn-add-dish:hover {
                background-color: #ff4500;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
                transform: translateY(-2px);
            }
            .btn-voucher{
                background-color: #ff6347;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 15px 490px;
                font-size: 18px;
                font-weight: bold;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
                margin-bottom: 20px;
            }
            .btn-voucher::before{
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 300%;
                height: 300%;
                background-color: rgba(255, 255, 255, 0.3);
                transform: translate(-50%, -50%) rotate(45deg);
                transition: all 0.75s ease;
            }
            .btn-voucher:hover::before {
                width: 0;
                height: 0;
            }
            .btn-voucher:hover {
                background-color: #ff4500;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
                transform: translateY(-2px);
            }
            #content {
                max-width: 1300px;
                width: 100%;
                padding: 20px;
            }

            /* CSS cho các món ăn hiển thị */
            .dish-detail {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 20px 0;
                padding: 10px;
                border-bottom: 1px solid #ddd; /* Thêm đường viền giữa các món ăn */
            }

            .dish-img {
                width: 200px;
                height: 140px;
                margin-right: 20px;
            }

            .dish-description {
                flex: 1; /* Cho phép mô tả món ăn mở rộng hết không gian còn lại */
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .dish-description h3 {
                margin-bottom: 5px; /* Giảm khoảng cách giữa tiêu đề và giá */
            }

            .dish-description p {
                margin: 0;
            }

            .btn2 {
                background-color: #dc3545; /* Màu đỏ cho nút Delete */
                color: #fff;
                border: none;
                cursor: pointer;
                padding: 20px 30px;
                border-radius: 20%;
                margin-left: 10px;
            }

            .btn-edit {
                background-color: #00CC00; /* Màu xanh cho nút Edit */
            }

            .btn-delete {
                background-color: #990000; /* Màu đỏ cho nút Delete */
            }

            .btn2:hover {
                background-color: #c82333;
            }
            .btn-edit:hover {
                background-color: #33FF99; /* Màu xanh cho nút Edit */
            }

            /* CSS cho phần Comment */
            .comments-section {
                margin-top: 20px;
            }

            .comments-section h2 {
                margin-bottom: 10px; /* Giảm khoảng cách giữa tiêu đề và các comment */
            }

            /* Responsive CSS */
            @media (max-width: 768px) {
                .dish-detail {
                    flex-direction: column; /* Chuyển sang hiển thị dọc trên màn hình nhỏ */
                    align-items: flex-start;
                }

                .dish-img {
                    margin-bottom: 10px; /* Giảm khoảng cách giữa hình ảnh và mô tả */
                }

                .quantity-container {
                    margin-left: 0; /* Đặt nút Delete ở dưới cùng cho màn hình nhỏ */
                    margin-top: 10px;
                }
            }
        </style>
    </head>

    <body>
        <div>
            <!-- Include header -->
            <jsp:include page="path/dinerheader.jsp"/>
            <!-- End header section -->
        </div>

        <%
            Account account = (Account) session.getAttribute("account");
            if (account == null || !"dinermanager".equalsIgnoreCase(account.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }

            int id = account.getAccount_id();
            AccountManager am = new AccountManager();
            Account diner = am.getAccountById(id);
            DishManager dm = new DishManager();
            ArrayList<Dish> listDish = dm.getDishByDinerId(id);
        %>

        <div style="background-color: #dddddd">
            <a href="index.jsp" class="back-link">BACK</a>
            <div class="restaurant">
                <section class="restaurant-detail">
                    <img src="https://down-cvs-vn.img.susercontent.com/vn-11134513-7r98o-lsv21q8k90uxa6@resize_ss640x400!@crop_w640_h400_cT" class="restaurant-img" alt="Restaurant Image"/>
                    <div class="restaurant-info">
                        <h1 class="restaurant-name"><%=diner.getName()%></h1>
                        <h3 class="restaurant-address"><%=diner.getAddress()%></h3>
                        <h4 class="restaurant-rating">Rating</h4>
                        <h5 class="restaurant-opening-time">Opening Time</h5>
                    </div>
                </section>
            </div>

            <div id="container">
                <div id="content">
                    <div id="dish">
                        <!-- Add Dish Container -->
                        <div class="add-dish-container">
                            <form action="AddDishPage" method="post" enctype="multipart/form-data">
                                <button type="submit" class="btn-add-dish">Add Dish</button>
                            </form>
                        </div>
                        <div class="voucher-container">
                            <form action="VoucherPage" method="post" >
                                <button type="submit" class="btn-voucher">Management Voucher</button>
                            </form>
                        </div>

                        <!-- Existing Dishes -->
                        <%
                            for (Dish d : listDish) {
                        %>
                        <div class="dish-detail">
                            <img class="dish-img" src="<%=d.getPicture()%>" alt="Dish Image">
                            <div class="dish-description">
                                <div>
                                    <h3><%=d.getName()%></h3>
                                    <p>Price: <span><%=d.getPrice()%> VNĐ</span></p>
                                </div>
                                <div>
                                    <button class="btn2 btn-edit" onclick="editDish('<%=d.getDish_id()%>')">Edit</button>
                                    <button class="btn2 btn-delete" onclick="deleteDish('<%=d.getDish_id()%>')">Delete</button>
                                    <!-- Form for editing dish -->
                                    <form id="editForm_<%=d.getDish_id()%>" action="EditDishServlet" method="post">
                                        <input type="hidden" name="dishId" value="<%=d.getDish_id()%>">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="comments-section">
                            <h2>Comments</h2>
                            <!-- Comments will go here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->

        <!-- jQuery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- Your other JavaScript imports here -->
        <script>


                                        function deleteDish(dishId) {
                                            if (confirm("Are you sure you want to delete this dish?")) {
                                                $.ajax({
                                                    type: "POST",
                                                    url: "DeleteDishServlet", // Đường dẫn đến servlet xử lý xóa món ăn
                                                    data: {
                                                        dishId: dishId
                                                    },
                                                    success: function (response) {
                                                        // Xử lý thành công
                                                        console.log("Dish deleted successfully.");
                                                        // Tải lại trang hoặc cập nhật danh sách món ăn
                                                        location.reload(); // Hoặc cách khác để cập nhật giao diện
                                                    },
                                                    error: function (xhr, status, error) {
                                                        // Xử lý lỗi
                                                        console.error("Error deleting dish:", error);
                                                        alert("Failed to delete dish. Please try again later.");
                                                    }
                                                });
                                            }
                                        }
                                        function editDish(dishId) {
                                            document.getElementById('editForm_' + dishId).submit();
                                        }

                                        function updateCart() {
                                            // Update the UI to show the cart contents
                                            console.log(cart);
                                        }
                                        function addNewDish() {

                                        }
                                        window.onload = function () {
                                            updateCart();
                                        };
        </script>

    </body>
</html>
