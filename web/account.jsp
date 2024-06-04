<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        <div id="site-content" style="background-image: url('dummy/forBG.jpg');">
            <main class="main-content" style="padding-top: 70px">
                <div class="container">
                    <div class="midContent">
                        <div class="row"style="background-color: white;" >
                            <div class="col-md-3" >
                                <img src="avt/<%=account.getProfile_picture()%>" style="width: 180px; height: 250px; margin-right: 30px;object-fit: cover;">
                            </div>
                            <div class="col-md-9 mx-auto">
                                <div class="my-account">
                                    <div class="page-title">
                                        <h1 style="font-family: Roboto;">Information Account</h1>
                                    </div>
                                    <div class="box">
                                        <form action="UpdateAccountServlet" method="post" enctype="multipart/form-data" id="profile-validate"
                                              class="scaffold-form metiz-edit-account">
                                            <div class="row">
                                                <!-- First Column (col-md-3) -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="id">ID</label>
                                                        <input type="text" name="id" id="id" class="form-control custom-input" readonly
                                                               value="<%=id%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="username">Username</label>
                                                        <input type="text" name="username" id="username" class="form-control custom-input"
                                                               value="<%=account.getUsername()%>" disabled>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="full_name">Name</label>
                                                        <input type="text" name="full_name" id="full_name" class="form-control custom-input"
                                                               value="<%=name%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="avt">Avatar</label>
                                                        <input type="file" name="avt" id="avt" placeholder="Enter phôt" class="form-control custom-input">
                                                    </div>
                                                </div>
                                                <!-- Second Column (col-md-3) -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone Number</label>
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
                                                        <label>Birthday</label>
                                                        <div class="input-group" >
                                                            <input type="date" name="birth_date" id="birth_date"
                                                                   value="<%=dob%>" class="form-control custom-input">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-birthday" >
                                                        <label>Address</label>
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
                                                <button type="submit" title="Save" class="btn btn-primary"><span><span>Save</span></span></button>
                                            </div>
                                            <div class="buttons-set metiz-edit-btn">
                                                <a href="ChangePasswordPage" class="btn btn-primary">Change Password</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="background-color: white;">
                            <!--                <div class="col-lg-8 col-md-10 mx-auto">
                                                <div class="my-account">
                                                     Existing form code goes here 
                            
                                                    <div class="page-title">
                                                        <h2>Additional Information Table</h2>
                                                    </div>
                            
                                                     Additional table 
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>ID Phim</th>
                                                                <th>Xuat Chieu</th>
                                                                <th>Ma Phong</th>
                                                                <th>So Luong Ve</th>
                                                                <th>Thoi Gian</th>
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
                                                             Add more rows as needed 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>-->
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!-- Default snippet for navigation -->

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/app.js"></script>
    </body>

</html>