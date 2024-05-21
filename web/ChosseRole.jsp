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
                <div class="card" style="height: 600px; width: 400px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Customer</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <div style="height: 400px;width: 100%;">
                                
                            </div>
                            <form action="SignUpServlet" method="Get" id="form" > 
                                <input type="hidden" name="role" value="Customer">
                                <div class="form-group" style="display: flex;justify-content: center;">
                                    <button class="btn float-right login_btn" type="submit">Sign up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card" style="height: 600px; width: 400px; margin-left: 50px;margin-right: 50px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Diner Manager</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <div style="height: 400px;width: 100%;">
                                
                            </div>
                            <form action="SignUpServlet" method="Get" id="form" > 
                                <input type="hidden" name="role" value="DinerManager">
                                <div class="form-group" style="display: flex;justify-content: center;">
                                    <button class="btn float-right login_btn" type="submit">Sign up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card" style="height: 600px; width: 400px;">
                    <div class="card-header d-flex justify-content-center" >
                        <h3>Shipper</h3>
                    </div>
                    <div class="main_input card-body align-center ">
                        <div>
                            <div style="height: 400px;width: 100%;">
                                
                            </div>
                            <form action="SignUpServlet" method="Get" id="form" > 
                                <input type="hidden" name="role" value="Shipper">
                                <div class="form-group" style="display: flex;justify-content: center;">
                                    <button class="btn float-right login_btn" type="submit">Sign up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>