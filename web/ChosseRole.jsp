<%@page import="model.AccountManager"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Sign Up Page</title>
       <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
            .cus{
                margin-right: 3px;
                 margin-left: 5px;
                margin-top: 50px;
                font-size: 20px;
            }
             .din{
                 margin-right: 3px;
                 margin-left: 5px;
                margin-top: 50px;
                font-size: 20px;
            }
              .ship{
                 margin-right: 3px;
                 margin-left: 5px;
                margin-top: 50px;
                font-size: 20px;
            }
              

        </style>

    </head>
   <body style="background-image: url('dummy/forBG2.jpg');">
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card" style="height: 600px; width: 400px;">
                <div class="card-header d-flex justify-content-center">
                    <h3>Customer</h3>
                </div>
                <div class="cus">
                    <div>
                        <div style="height: 400px; width: 100%; color: #ffffff;">
                           <ul>
                                <li>Vai trò Khách hàng cho phép bạn duyệt, đặt món và theo dõi các đơn hàng của mình.</li>
                                <li>Đánh giá và bình luận về các món ăn.</li>
                                <li>Thực hiện các đơn hàng và theo dõi trạng thái của chúng.</li>
                            </ul>
                        </div>
                        <form action="SignUpServlet" method="Get" id="form">
                            <input type="hidden" name="role" value="Customer">
                            <div class="form-group" style="display: flex; justify-content: center;">
                                <button class="btn float-right login_btn" type="submit">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="card" style="height: 600px; width: 400px; margin-left: 50px; margin-right: 50px;">
                <div class="card-header d-flex justify-content-center">
                    <h3>Diner</h3>
                </div>
                <div class="din">
                    <div>
                        <div style="height: 400px; width: 100%; color: #ffffff">
                           <ul>
                                <li>Quản lý các món ăn, đơn hàng và nhận xét từ khách hàng.</li>
                                <li>Cập nhật thực đơn và theo dõi tình trạng kinh doanh của nhà hàng.</li>
                                <li>Phân tích phản hồi từ khách hàng để cải thiện dịch vụ.</li>
                            </ul>
                        </div>
                        <form action="SignUpServlet" method="Get" id="form">
                            <input type="hidden" name="role" value="DinerManager">
                            <div class="form-group" style="display: flex; justify-content: center;">
                                <button class="btn float-right login_btn" type="submit">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="card" style="height: 600px; width: 400px;">
                <div class="card-header d-flex justify-content-center">
                    <h3>Shipper</h3>
                </div>
                <div class="ship">
                    <div>
                        <div style="height: 400px; width: 100%;color: #ffffff">
                            <ul>
                                <li>Nhận đơn hàng và giao chúng đến khách hàng.</li>
                                <li>Cập nhật trạng thái đơn hàng trong hệ thống.</li>
                                <li>Theo dõi lịch sử giao hàng của mình và quản lý thời gian giao hàng.</li>
                            </ul>
                        </div>
                        <form action="SignUpServlet" method="Get" id="form">
                            <input type="hidden" name="role" value="Shipper">
                            <div class="form-group" style="display: flex; justify-content: center;">
                                <button class="btn float-right login_btn" type="submit">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


</html>