<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            int id = (int) request.getAttribute("accountId");
        %>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 350px; width: 500px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Reset password</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <form action="ResetPasswordServlet" method="POST" id="form" > 
                                <input type="hidden" name="accId" value="<%=id%>">
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
                                <div class="form-group" style="display: flex;justify-content: center;">
                                    <button class="btn float-right login_btn" type="button" onclick="Sign()" >Reset</button>
                                </div>

                            </form>
                            <div class="card-footer">
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