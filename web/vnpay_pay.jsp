<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .header {
                margin-bottom: 30px;
            }
            .header h3 {
                margin: 0;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-group h5 {
                margin-top: 20px;
            }
            .btn-primary {
                background-color: #007bff;
                color: #fff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .footer {
                margin-top: 50px;
                padding: 10px 0;
                text-align: center;
                background-color: #e9ecef;
            }
        </style>
    </head>
    <body>
        <jsp:include page="path/header.jsp"/>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY DEMO</h3>
            </div>
            <h3 class="mb-4">Tạo mới đơn hàng</h3>
            <div class="card">
                <div class="card-body">
                    <form action="/HungryHub_OrderFood/vnpayajax" id="frmCreateOrder" method="post">
                        <div class="form-group">
                            <label for="amount">Số tiền</label>
                            <input class="form-control"  data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." readonly id="amount" name="amount" type="number" value="<%= request.getParameter("totalCost")%>"/>
                            <input type="hidden" id="orderId" name="orderId" value="<%= request.getParameter("orderId")%>">
                        </div>
                        <h4>Chọn phương thức thanh toán</h4>
                        <div class="form-group">
                            <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="bankCode1" name="bankCode" value="" checked>
                                <label class="form-check-label" for="bankCode1">Cổng thanh toán VNPAYQR</label>
                            </div>

                            <h5 class="mt-3">Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="bankCode2" name="bankCode" value="VNPAYQR">
                                <label class="form-check-label" for="bankCode2">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="bankCode3" name="bankCode" value="VNBANK">
                                <label class="form-check-label" for="bankCode3">Thanh toán qua thẻ ATM/Tài khoản nội địa</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="bankCode4" name="bankCode" value="INTCARD">
                                <label class="form-check-label" for="bankCode4">Thanh toán qua thẻ quốc tế</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="language1" name="language" value="vn" checked>
                                <label class="form-check-label" for="language1">Tiếng Việt</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="language2" name="language" value="en">
                                <label class="form-check-label" for="language2">Tiếng Anh</label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Thanh toán</button>
                    </form>
                </div>
            </div>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var orderId = $("#orderId").val(); // Lấy orderId từ trường ẩn
                var postData = $("#frmCreateOrder").serialize();
                postData += "&orderId=" + orderId; // Thêm orderId vào dữ liệu gửi đi
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
