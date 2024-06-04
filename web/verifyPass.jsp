<%@page import="model.AccountManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="card" style="height: 250px; width: 500px;">
                    <div class="card-header d-flex justify-content-center">
                        <h3>Verify your account</h3>
                    </div>
                    <div class="card-body">
                        <%
                            String email,ma;
                            if(request.getSession().getAttribute("email") != null || request.getSession().getAttribute("verify")!=null){
                            email = (String) request.getSession().getAttribute("email");
                            ma = (String) request.getSession().getAttribute("verify");
                            }
                            else{
                                response.sendRedirect("ForgotPassPage");
                                return;
                            }
                            AccountManager am = new AccountManager();
                            Account account = am.getAccountByEmail(email);
                            int id;
                            if(account != null){
                                id= account.getAccount_id();
                            }
                            else{
                                response.sendRedirect("ForgotPassPage");
                                return;
                            }
                        %>
                        <form action="VerifyPassServlet" id="form" method="POST">
                            <input type="hidden" name="accId" value="<%=id%>">
                            <input type="hidden" name="maxacthuc" id="maxacthuc"  value="<%=ma%>">
                            <%
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null) {
                            %>
                            <div class="error-message" style="color: red"><%= errorMessage%></div>
                            <%
                                }
                            %>
                            <div class="input-group form-group">
                                <input type="text" class="form-control" name="code" placeholder="Verify code">
                            </div>
                            <div class="input_error password_error" ></div>
                            <div class="form-group d-flex justify-content-center">
                                <button class="btn float-right login_btn" type="submit" id="verifyCode" > verify </button>
                                <!--<input class="btn float-right login_btn" type="submit" value="Login">-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>  
    </body>
</html>