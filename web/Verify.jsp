<%@page import="model.Account"%>
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
                            Account acc = (Account) request.getAttribute("Account");
                            
                        %>
                        <form action="VerifyServlet" id="form" method="POST">
                            <input type="hidden" name="displayname" value="<%=acc.getName()%>">
                            <input type="hidden" name="maxacthuc" id="maxacthuc"  value="<%=acc.getMaxacthuc()%>">
                            <div class="input-group form-group">
                                <input type="text" class="form-control" name="code" placeholder="Verify code">
                            </div>
                            <div class="input_error password_error" ></div>
                            <div class="form-group d-flex justify-content-center">
                                <button class="btn float-right login_btn" type="button" id="verifyCode" onclick="verifyCode()" > verify </button>
                                <!--<input class="btn float-right login_btn" type="submit" value="Login">-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function verifyCode()
            {
                var code = document.getElementById("verifyCode").value;
                var ma = document.getElementById("maxacthuc").value;
                var form = document.getElementById("form");

                // Create a new form data object
                var formData = new FormData();
                formData.append("code", code);
                formData.append("ma", ma);

                // Send the request to the VerifyServlet
                fetch("VerifyServlet", {
                    method: "POST",
                    body: formData
                })
                        .then(response => response.text())
                        .then(data => {
                            // Process the response
                            if (data === "success") {
                                alert("Verification successful!");
                                // Redirect or perform other actions upon success
                            } else {
                                alert("Verification failed. Please check your code and try again.");
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                        });
            }

        </script>           
    </body>
</html>