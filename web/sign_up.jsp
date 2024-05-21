<%@page import="model.AccountManager"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Sign Up Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/login_style.css">

        <style>
            .rq{
                color : red;
            }
            .align-center {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100%;
            }
            .main_input {
                padding-bottom: 0;
            }
            .input_error{
                font-size: 12px;
                height: 12px;
                margin-bottom: 5px;
            }

        </style>

    </head>
    <body style="background-image: url('dummy/forBG2.jpg');">
        <%
            String role = request.getParameter("role");
        %>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 550px; width: 500px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Sign Up</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <form action="SignUpServlet" method="POST" id="form" > 
                                <div class="input_error email_error" ></div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    </div>
                                    <input type="email" class="form-control" name="email" placeholder="Email" >
                                </div>
                                <div class="input_error password_error" ></div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <input type="password" class="form-control" name="password" placeholder="Password" >
                                </div>
                                <div class="input_error confirmPassword_error" ></div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" >
                                </div>
                                <div class="input_error address_error"></div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
                                    <input type="text" class="form-control" name="address" placeholder="Address">
                                </div>
                                <div class="form-group" style="display: flex;justify-content: center;">
                                    <button class="btn float-right login_btn" type="button" onclick="Sign()" >Sign up</button>
                                </div>

                            </form>
                            <div class="card-footer">
                                <div class="d-flex justify-content-center links">
                                    Already have an account?<a href="LoginServlet">Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            
            function Sign() {
                var error = "";
                var password = document.getElementsByName("password")[0].value;
                if (password.length < 8) {
                    Password_error = document.getElementsByClassName("password_error")[0];
                    Password_error.innerHTML = "<span class='rq'>Passwork must more than 8 letter !</span>";
                    error += "\nPasswork must more than 8 letter !";
                }
                var confirmPassword = document.getElementsByName("confirmPassword")[0].value;
                if (password !== confirmPassword || confirmPassword.length === 0) {
                    Confirm_error = document.getElementsByClassName("confirmPassword_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>Please input your passwork correct !</span>";
                    error += "\nPlease input your passwork correct !";
                }
                var email = document.getElementsByName("email")[0].value;
                if (email.length === 0) {
                    Confirm_error = document.getElementsByClassName("email_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>You should input your email !</span>";
                    error += "\nYou should input your email !";
                }
                if (error.length > 0) {
                    return;
                } else {
                    // Th?c hi?n AJAX ki?m tra email
                    var xhr_email = new XMLHttpRequest();
                    xhr_email.open('POST', 'CheckEmailContainServlet', true);
                    xhr_email.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr_email.onreadystatechange = function () {
                        if (xhr_email.readyState === 4) {
                            if (xhr_email.status === 200) {
                                if (xhr_email.responseText === "duplicate") {
                                    // N?u email ?ã t?n t?i, hi?n th? thông báo l?i
                                    var emailContain = document.getElementsByClassName("email_error")[0];
                                    emailContain.innerHTML = "<span class='rq'>The email is not in the correct format or already exists!</span>";
                                    error += "\gmail already exists!";
                                } else {
                                    checkEmail();
                                }
                            } else {
                                // X? lý l?i khi không nh?n ???c ph?n h?i 200 t? máy ch?
                                console.error('Error: ' + xhr_email.status);
                            }
                        }
                    };
                    xhr_email.send("email=" + encodeURIComponent(email));
                }
            }

            // Hàm ki?m tra email b?ng AJAX
            function checkEmail() {
                var error = "";
                var email = document.getElementsByName("email")[0].value;
                var xhr_email = new XMLHttpRequest();
                xhr_email.open('POST', 'CheckEmailServlet', true);
                xhr_email.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr_email.onreadystatechange = function () {
                    if (xhr_email.readyState === 4) {
                        if (xhr_email.status === 200) {
                            if (xhr_email.responseText === "duplicate") {
                                // N?u email ?ã t?n t?i, hi?n th? thông báo l?i
                                var Email_error = document.getElementsByClassName("email_error")[0];
                                Email_error.innerHTML = "<span class='rq'>Email must end with @gmail.com!</span>";
                                error += "\nEmail must end with @gmail.com!";
                            } else {
                                var form = document.getElementById("form");
                                form.submit();
                            }
                        } else {
                            // X? lý l?i khi không nh?n ???c ph?n h?i 200 t? máy ch?
                            console.error('Error: ' + xhr_email.status);
                        }
                    }
                };
                xhr_email.send("email=" + encodeURIComponent(email));
            }
        </script>

    </body>

</html>