<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/login_style.css">

        <style>
            .rq{
                color : red;
            }
            .align-center {
                display: flex;
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
            .alert {
                position: fixed;
                top: 5%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f44336; /* Red */
                color: white;
                text-align: center;
                z-index: 9999; /* Ensure it's above other elements */
            }
            .alert.success {
                background-color: #4CAF50;
            } /* Green */
            .alert.info {
                background-color: #2196F3;
            } /* Blue */
            .alert.warning {
                background-color: #ff9800;
            } /* Orange */
            .alert.close {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }
            .alert.close:hover {
                color: black;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
</head>
<body style="background-image: url('dummy/forBG2.jpg');">
    <%
        String message = (String) request.getSession().getAttribute("message");
        if (message != null && !message.isEmpty()) {
    %>
    <div class="alert success">
        <span class="close" style="margin-left: 10px" onclick="this.parentElement.style.display = 'none';">&times;</span>
        <%=message%>
    </div>
    <%
            request.getSession().removeAttribute("message");
        }
    %>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card" style="height: 400px;">
                <div class="card-header">
                    <h3><b>Sign In</b></h3>
                </div>
                <div class="d-flex justify-content-end social_icon">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/HungryHub_OrderFood/LoginGoogleHandler&response_type=code
                       &client_id=446753440793-j227if2dn4gtep6g1u7llgf0i15grtm9.apps.googleusercontent.com&approval_prompt=force"><span><i class="fab fa-google-plus-square"></i></span></a>
                </div>
                <div class="card-body">
                    <%
                        String username = "";
                        if (session.getAttribute("username") != null) {
                            username = (String) session.getAttribute("username");
                        }
                        String password = "";
                        if (session.getAttribute("password") != null) {
                            password = (String) session.getAttribute("password");
                        }
                        String error = "";
                        if (session.getAttribute("Error") != null) {
                            error = (String) session.getAttribute("Error");
                        }
                    %>
                    <form action="LoginServlet" id="form" method="post">
                        <div class="input_error username_error" ><span class='rq'><%=error%></span></div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" name="username" placeholder="username or email" value="<%= username%>">

                        </div>
                        <div class="input_error password_error" ></div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" name="password" placeholder="password" value="<%= password%>">
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox" name="remember">Remember Me
                        </div>
                        <div class="form-group d-flex justify-content-center">
                            <button class="btn float-right login_btn" type="button" onclick="Sign()" >Login</button>
                            <!--<input class="btn float-right login_btn" type="submit" value="Login">-->
                        </div>
                    </form>
                </div>
                <div class="card-footer ">
                    <div class="d-flex justify-content-center links">
                        Don't have an account?<a href="ChosseRolePage">Sign Up</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="ForgotPassPage">Forgot your password?</a>
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
                UserName_error.innerHTML = "<span class='rq'>You should input your username !</span>";
                error += "Account name cannot be empty !";
            }
            password = document.getElementsByName("password")[0].value;
            if (password.length === 0) {
                password_error = document.getElementsByClassName("password_error")[0];
                password_error.innerHTML = "<span class='rq'>You should input your password !</span>";
                error += "\nYou should input your displayname !";
            }
            if (error.length > 0) {
                return;
            } else {
                var form = document.getElementById("form");
                form.submit();
            }
        }
    </script>
</body>
</html>