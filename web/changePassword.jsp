<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1">

        <title>Account information</title>

        <!-- Loading third party fonts -->
        <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
        <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Loading main css file -->
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
                background-color: white;      /*Màu n?n t?ng th?*/
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
                justify-content: center; /* C?n gi?a các dòng */
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

            /* Page Title */
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

            /* Buttons */
            .buttons-set {
                margin-top: 20px;
                display: flex;
                justify-content: center;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;  /*Màu nút*/
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }

            .btn:hover {
                background-color: #0056b3;  /*Màu hover c?a nút */
            }

            Table
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
                background-color: #007bff;  /*Màu n?n header c?a b?ng */
                color: #fff;
                font-weight: bold;
                text-align: left;
            }

            .table td {
                background-color: #fff;  /*Màu n?n c?a các ô d? li?u */
            }

            /* Responsive */
            @media (max-width: 767px) {
                .col-md-6 {
                    flex: 0 0 100%;
                    max-width: 100%;
                }
            }
            #site-content-local{
                display: flex;
                justify-content: center;
                background: #DDDDDD;
                width: 100%;
                padding: 0;
                margin: 0;
            }

            .local{
                width: 70%;
                background-color: white;
                min-width: 300px;
                max-width: 600px;
                margin-top: 20px;
                margin-bottom: 20px;
                border-radius: 10px;
            }
        </style>
    </head>


    <body>
        <jsp:include page="path/header.jsp"/>

        <div id="site-content-local">
            <div class="local">
                <main class="main-content-local" style="padding-top: 70px">
                    <div class="container">
                        <div class="midContent">
                            <div class="row"style="background-color: white;" >
                                <div class="col-lg-8 col-md-10 mx-auto">
                                    <div class="my-account">
                                        <div class="page-title" style="display: flex; justify-content: center">
                                            <h1>Thay đổi mật khẩu</h1>
                                        </div>
                                        <%
                                            Account acc = (Account) request.getSession().getAttribute("account");
                                            AccountManager am = new AccountManager();
                                            Account account = am.getAccountById(acc.getAccount_id());
                                            if (account == null) {
                                                response.sendRedirect("login.jsp");
                                            }
                                            int id = account.getAccount_id();
                                            String name = account.getName();
                                            String phone = account.getPhoneNumber();
                                            String email = account.getEmail();
                                            Date dob = account.getDate_of_birth();
                                            String adds = account.getAddress();
                                        %>
                                        <div class="box">
                                            <form action="ChangePasswordServlet" method="post" id="profile-validate"
                                                  class="scaffold-form metiz-edit-account">
                                                <div class="row">
                                                    <!-- First Column (col-md-3) -->
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="full_name">Mật khẩu cũ</label>
                                                            <input type="password" name="oldpassword" id="oldpassword" class="form-control custom-input">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="full_name">Mật khẩu mới</label>
                                                            <input type="password" name="newpassword" id="newpassword" class="form-control custom-input">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="full_name">Xác nhận lại mật khẩu</label>
                                                            <input type="password" name="Cfpassword" id="password" class="form-control custom-input">
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${not empty message}">
                                                    <div class="alert">
                                                        ${message}
                                                    </div>
                                                </c:if>
                                                <div class="buttons-set metiz-edit-btn">
                                                    <button type="submit" title="Save" class="btn btn-primary"><span><span>Thay đổi mật khẩu</span></span></button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="background-color: white;">
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- Default snippet for navigation -->
        <jsp:include page="path/footer.jsp"/>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
    </body>

</html>