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

            h1{
                color: white;
            }
            .wc{
                color: orange;
                font-size: 20px;
                text-align: center;
            }
            .ip{
                color: red;
                font-size: 20px;
                text-align: center;
            }
        </style>

    </head>
    <body style="background-image: url('dummy/forBG2.jpg');">
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 300px; width: 700px;">
                    <div class="card-header d-flex align-items-center justify-content-center" >
                        <h1>THANK YOU ${displayName} !</h1>
                    </div>
                    <div class="align-center ">
                        <div>
                            <div >
                                <p class="wc">Welcome to TTH Cinema, thank you for coming to us. Wish you have a happy movie watching experience <3</p>
                                <p class="ip">Please press the button below to go back and log in!!!</p>
                            </div>
                            <div class="form-group" style="display: flex;justify-content: center;">
                                <a class="btn float-right login_btn" href="LoginServlet" >Back to sign in</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>