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
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 550px; width: 800px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Sign Up</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <form action="SignUpServlet" method="post" id="form" > 
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input_error username_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            </div>
                                            <input type="text" class="form-control" name="username" placeholder="Username" >
                                        </div>

                                        <div class="input_error displayName_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            </div>
                                            <input type="text" class="form-control" name="displayName" placeholder="Display Name" >
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
                                    </div>

                                    <div class="col-md-6">
                                        <div class="input_error email_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            </div>
                                            <input type="email" class="form-control" name="email" placeholder="Email" >
                                        </div>

                                        <div class="input_error birthdate_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                            </div>
                                            <input type="date" class="form-control" name="birthdate" >
                                        </div>

                                        <div class="input_error gender_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                                            </div>
                                            <select class="form-control gender" name="gender" >
                                                <option value="">Select Gender</option>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>

                                        <div class="input_error phone_error" ></div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                            </div>
                                            <input type="tel" class="form-control" name="phone" placeholder="Phone" >
                                        </div>
                                    </div>
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
                error = "";
                username = document.getElementsByName("username")[0].value;
                if (username.length === 0) {
                    UserName_error = document.getElementsByClassName("username_error")[0];
                    UserName_error.innerHTML = "<span class='rq'>Account name cannot be empty !</span>";
                    error += "Account name cannot be empty !";
                }
                displayName = document.getElementsByName("displayName")[0].value;
                if (displayName.length === 0) {
                    DisplayName_error = document.getElementsByClassName("displayName_error")[0];
                    DisplayName_error.innerHTML = "<span class='rq'>You should input your displayname !</span>";
                    error += "\nYou should input your displayname !";
                }
                password = document.getElementsByName("password")[0].value;
                if (password.length < 8) {
                    Paasword_error = document.getElementsByClassName("password_error")[0];
                    Paasword_error.innerHTML = "<span class='rq'>Passwork must more than 8 letter !</span>";
                    error += "\nPasswork must more than 8 letter !";
                }
                confirmPassword = document.getElementsByName("confirmPassword")[0].value;
                if (password !== confirmPassword || confirmPassword.length === 0) {
                    Confirm_error = document.getElementsByClassName("confirmPassword_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>Please input your passwork correct !</span>";
                    error += "\nPlease input your passwork correct !";
                }
                birthdate = document.getElementsByName("birthdate")[0].value;
                if (birthdate.length === 0) {
                    Confirm_error = document.getElementsByClassName("birthdate_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>You choose your birthdate !</span>";
                    error += "\nYou choose your birthdate !";
                }
                email = document.getElementsByName("email")[0].value;
                if (email.length === 0) {
                    Confirm_error = document.getElementsByClassName("email_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>You should input your email !</span>";
                    error += "\nYou should input your email !";
                }
                gender = document.getElementsByName("gender")[0].value;
                if (gender.length === 0) {
                    Confirm_error = document.getElementsByClassName("gender_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>You choose your gender !</span>";
                    error += "\nYou choose your gender !";
                }
                phone = document.getElementsByName("phone")[0].value;
                if (phone.length === 0) {
                    Confirm_error = document.getElementsByClassName("phone_error")[0];
                    Confirm_error.innerHTML = "<span class='rq'>You should input your phone !</span>";
                    error += "\nYou should input your phone !";
                }
                if (error.length > 0) {
                    return;
                } else {
                    // Th?c hi?n AJAX ki?m tra username
                    var xhr_username = new XMLHttpRequest();
                    xhr_username.open('POST', 'CheckUsernameServlet', true);
                    xhr_username.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr_username.onreadystatechange = function () {
                        if (xhr_username.readyState === 4) {
                            if (xhr_username.status === 200) {
                                if (xhr_username.responseText === "duplicate") {
                                    // N?u username ?ã t?n t?i, hi?n th? thông báo l?i
                                    var UserName_error = document.getElementsByClassName("username_error")[0];
                                    UserName_error.innerHTML = "<span class='rq'>Username already exists!</span>";
                                    error += "\nUsername already exists!";
                                    checkEmail();
                                }
                                else{
                                    checkEmail();
                                }
                            } else {
                                // X? lý l?i khi không nh?n ???c ph?n h?i 200 t? máy ch?
                                console.error('Error: ' + xhr_username.status);
                            }
                        }
                    };
                    xhr_username.send("username=" + encodeURIComponent(username));
                }
            }

            // Hàm ki?m tra email b?ng AJAX
            function checkEmail() {
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
                                checkPhone();
                            }
                            else{
                                checkPhone();
                            }
                        } else {
                            // X? lý l?i khi không nh?n ???c ph?n h?i 200 t? máy ch?
                            console.error('Error: ' + xhr_email.status);
                        }
                    }
                };
                xhr_email.send("email=" + encodeURIComponent(email));
            }

            // Hàm ki?m tra s? ?i?n tho?i b?ng AJAX
            function checkPhone() {
                var phone = document.getElementsByName("phone")[0].value;
                var xhr_phone = new XMLHttpRequest();
                xhr_phone.open('POST', 'CheckPhoneServlet', true);
                xhr_phone.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr_phone.onreadystatechange = function () {
                    if (xhr_phone.readyState === 4) {
                        if (xhr_phone.status === 200) {
                            if (xhr_phone.responseText === "duplicate") {
                                // N?u s? ?i?n tho?i ?ã t?n t?i, hi?n th? thông báo l?i
                                var Phone_error = document.getElementsByClassName("phone_error")[0];
                                Phone_error.innerHTML = "<span class='rq'>Phone number must have 10 digits!</span>";
                                error += "\nPhone number must have 10 digits!";
                            } else {
                                var form = document.getElementById("form");
                                form.submit();
                            }
                        } else {
                            // X? lý l?i khi không nh?n ???c ph?n h?i 200 t? máy ch?
                            console.error('Error: ' + xhr_phone.status);
                        }
                    }
                };
                xhr_phone.send("phone=" + encodeURIComponent(phone));
            }
        </script>

    </body>

</html>