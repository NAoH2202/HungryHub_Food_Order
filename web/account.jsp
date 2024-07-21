<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Thông tin tài khoản</title>

        <!-- Đang tải các phông chữ của bên thứ ba -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Đang tải tệp css chính -->
        <link rel="stylesheet" href="style.css">

        <style>
            .login{
                background-color: #FFD700;
                padding: 10px 0;
                border-radius: 5px;
                border-right: 0px;
                color: black;
            }
            #find{
                background-color: #cccccc;
            }
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            .midContent {
                font-family: Arial, sans-serif;
                background-color: white;      /* Màu nền tầng thô */
            }

            .container {
                margin-right: auto;
                margin-left: auto;
                padding-left: 15px;
                padding-right: 15px;
                *zoom: 1;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
                justify-content: center; /* Căn giữa các dòng */
            }
            .box{
                border-bottom: 3px solid #999999;
                padding-bottom: 30px;
            }

            .col-md-6 {
                flex: 0 0 50%;
                max-width: 50%;
                padding-right: 15px;
                padding-left: 15px;
            }

            /* Tiêu đề trang */
            .page-title {
                margin-bottom: 20px;
            }

            .page-title h1,
            .page-title h2 {
                color: #333;
            }

            /* Form */
            .form-group {
                margin-bottom: 20px;
            }

            label {
                margin-left: 5px;
                font-weight: bold;
            }

            .custom-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                background-color: #fff;
                color: #333;
                outline: none;
            }

            .custom-input[type="radio"] {
                width: auto;
            }

            /* Nút */
            .buttons-set {
                margin-top: 20px;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;  /* Màu nút */
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }

            .btn:hover {
                background-color: #0056b3;  /* Màu hover của nút */
            }

            /* Bảng */
            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 30px;
            }

            .table th,
            .table td {
                border: 1px solid #ccc;
                padding: 10px;
                padding-left: 20px;
                padding-right: 20px;
            }

            .table th {
                background-color: #007bff;  /* Màu nền header của bảng */
                color: #fff;
                font-weight: bold;
                text-align: left;
            }

            .table td {
                background-color: #fff;  /* Màu nền của các ô dữ liệu */
            }

            /* Responsive */
            @media (max-width: 767px) {
                .col-md-6 {
                    flex: 0 0 100%;
                    max-width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <%
            Account acc = null;
            if (request.getSession().getAttribute("account") != null) {
                acc = (Account) request.getSession().getAttribute("account");
            } else {
                response.sendRedirect("LoginServlet");
                return;
            }
            AccountManager am = new AccountManager();
            Account account = am.getAccountById(acc.getAccount_id());
            if (account == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            int id = account.getAccount_id();
            String name = account.getName();
            String phone = account.getPhoneNumber();
            String email = account.getEmail();
            Date dob = account.getDate_of_birth();
            String adds = account.getAddress();
        %>
        <jsp:include page="path/header.jsp"/>
        <div id="site-content" style="background-color: #DDDDDD">
            <main class="main-content" style="padding: 50px;">
                <div class="container"style="max-width: 1500px;" >
                    <div class="midContent" style="width: 100%;height: auto;padding: 20px">
                        <div class="row" style="background-color: white;" >
                            <div class="col-md-3 d-flex justify-content-center" >
                                <img src="<%=account.getProfile_picture()%>" style="width: 180px; height: 250px; margin-right: 30px;object-fit: cover;">
                            </div>
                            <div class="col-md-7 mx-auto">
                                <div class="my-account">
                                    <div class="page-title">
                                        <h1 style="font-family: Roboto;">Thông tin tài khoản</h1>
                                    </div>
                                    <div class="box">
                                        <form action="UpdateAccountServlet" method="post" enctype="multipart/form-data" id="profile-validate"
                                              class="scaffold-form metiz-edit-account">
                                            <div class="row">
                                                <!-- Cột thứ nhất (col-md-3) -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="id">ID</label>
                                                        <input type="text" name="id" id="id" class="form-control custom-input" readonly
                                                               value="<%=id%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="username">Tên người dùng</label>
                                                        <input type="text" name="username" id="username" class="form-control custom-input"
                                                               value="<%=account.getUsername()%>" disabled>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="full_name">Họ và tên</label>
                                                        <input type="text" name="full_name" id="full_name" class="form-control custom-input"
                                                               value="<%=name%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="avt">Ảnh đại diện</label>
                                                        <input type="file" name="avt" id="avt" placeholder="Nhập ảnh" class="form-control custom-input">
                                                    </div>
                                                </div>
                                                <!-- Cột thứ hai (col-md-3) -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Số điện thoại</label>
                                                        <div class="form-group " >
                                                            <div class="inline">
                                                                <div class="country-code"></div>
                                                                <input type="text" name="phone" id="phone"
                                                                       value="<%=phone%>" class="form-control textPhone custom-input">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" id="email" name="email"
                                                               value="<%=email%>" class="form-control custom-input">
                                                    </div>
                                                    <div class="form-group form-birthday" >
                                                        <label>Ngày sinh</label>
                                                        <div class="input-group" >
                                                            <input type="date" name="birth_date" id="birth_date"
                                                                   value="<%=dob%>" class="form-control custom-input">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-birthday" >
                                                        <label>Địa chỉ</label>
                                                        <div class="input-group" >
                                                            <input type="text" name="address" id="address"
                                                                   value="<%=adds%>" class="form-control custom-input">
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                            <c:if test="${not empty message}">
                                                <div class="alert">
                                                    ${message}
                                                </div>
                                            </c:if>
                                            <div class="buttons-set metiz-edit-btn">
                                                <button type="submit" title="Lưu" class="btn btn-primary"><span><span>Lưu</span></span></button>
                                            </div>
                                            <div class="buttons-set metiz-edit-btn">
                                                <a href="ChangePasswordPage" class="btn btn-primary">Đổi mật khẩu</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="background-color: white;">
                            <!--                <div class="col-lg-8 col-md-10 mx-auto">
                                                <div class="my-account">
                                                     Mã form hiện có đi vào đây 
                            
                                                    <div class="page-title">
                                                        <h2>Bảng thông tin bổ sung</h2>
                                                    </div>
                            
                                                     Bảng bổ sung 
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>ID Phim</th>
                                                                <th>Xuất Chiếu</th>
                                                                <th>Mã Phòng</th>
                                                                <th>Số Lượng Vé</th>
                                                                <th>Thời Gian</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                             Thêm nhiều hàng khi cần 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>-->
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <jsp:include page="path/footer.jsp"/>
        <!-- Đoạn mã mặc định cho điều hướng -->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
    </body>
</html>
