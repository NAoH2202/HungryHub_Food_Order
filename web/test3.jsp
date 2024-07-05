<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            @media (max-width: 768px) {
                .order-tracker {
                    width: 95%;
                    padding: 10px;
                }
                .circle {
                    width: 30px;
                    height: 30px;
                    font-size: 16px;
                    margin-right: 15px;
                }

                .label {
                    font-size: 16px;
                }

                .time {
                    font-size: 12px;
                }

                .step:before {
                    left: 15px;
                }
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            header {
                background-color: #4CAF50;
                color: white;
                text-align: center;
                padding: 20px 0;
            }

            main {
                flex: 1;
                justify-content: center;
                align-items: stretch;
                padding: 20px;
            }

            .order-tracker {
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #33CC00;
                min-height: 500px;
                border-radius: 10px 0 0 10px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                max-width: 500px;
                padding: 20px;
            }

            .tracker-header, .tracker-footer {
                text-align: center;
                padding: 10px 0;
            }

            .tracker-header {
                font-size: 20px;
                color: white;
                font-weight: bold;
                margin: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .tracker-header img {
                width: 50px;
                height: 50px;
                margin-right: 10px;
            }

            .tracker-footer {
                color: white;
                margin: 20px;
                font-size: 14px;
                color: #555;
            }

            .step {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                width: 100%;
                position: relative;
            }

            .step:last-child {
                margin-bottom: 0;
            }

            .circle {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #bbb;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                margin-right: 20px;
                position: relative;
                z-index: 1;
            }

            .step.active .circle {
                background-color: #4CAF50;
            }

            .label {
                color: white;
                font-size: 18px;
                flex: 1;
            }

            .time {
                color: white;
                font-size: 14px;
                color: #666;
            }

            .step:before {
                content: '';
                position: absolute;
                width: 2px;
                height: calc(100% + 20px);
                background-color: #bbb;
                top: -20px;
                left: 20px;
                z-index: 0;
            }

            .step.active:before {
                background-color: #4CAF50;
            }

            .step:first-child:before {
                height: 50%;
                top: 50%;
            }

            .order-infor {
                background-color: white;
                border-radius: 0 10px 10px 0;
                min-height: 500px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 70%;
                max-width: 500px;
                text-align: left;
            }
            .order-infor, .order-tracker{
                flex: 1;
            }

            .order-infor h2 {
                text-align: center;
                margin: 27px;
                color: #333;
                font-size: 1.7em;
            }

            .order-item {
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 10px;
            }

            .item-details {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .item-details span {
                display: block;
                color: #555;
                font-size: 0.9em;
            }

            .item-image {
                width: 70px;
                height: 70px;
                border-radius: 5px;
                margin-right: 10px;
                object-fit: cover;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            }

            .item-total {
                text-align: right;
                font-weight: bold;
                color: #222;
            }

            .order-summary {
                text-align: right;
                font-size: 1.1em;
                font-weight: bold;
                color: #222;
            }

            .order-infor button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
            }

            .back_list{
                display: flex;
                justify-content: center;
            }

            .back_list button:hover {
                background-color: #45a049;
            }

            footer {
                background-color: #4CAF50;
                color: white;
                text-align: center;
                padding: 10px 0;
            }
            .tracker{
                width: 90%;
                margin: 20px;
            }
        </style>
    </head>
    <body style="background-color: #dddddd;">
        <jsp:include page="path/header.jsp"/>
        <main style="display: flex;">

            <div class="order-tracker">
                <div class="tracker-header">
                    <img src="images/tick-icon.png" alt="Tick"> Cảm ơn bạn đã đặt hàng!
                </div>
                <div class="tracker">
                    <div class="step active">
                        <div class="circle">1</div>
                        <div class="label">Đơn hàng đã đặt</div>
                        <div class="time">26/06/2024 10:00</div>
                    </div>
                    <div class="step active">
                        <div class="circle">2</div>
                        <div class="label">Đơn đang xử lý</div>
                        <div class="time">26/06/2024 12:00</div>
                    </div>
                    <div class="step active">
                        <div class="circle">3</div>
                        <div class="label">Đơn đã sẵng sàng để giao</div>
                        <div class="time">27/06/2024 08:00</div>
                    </div>
                    <div class="step">
                        <div class="circle">4</div>
                        <div class="label">Đơn hàng đang giao</div>
                        <div class="time"></div>
                    </div>
                    <div class="step">
                        <div class="circle">5</div>
                        <div class="label">Đơn hàng đã giao</div>
                        <div class="time"></div>
                    </div>
                </div>
                <div class="tracker-footer">
                    Xin lưu ý rằng thời gian giao hàng có thể thay đổi tùy thuộc vào điều kiện thực tế.
                </div>
            </div>

            <div class="order-infor">
                <h2>Thông tin Đơn hàng</h2>
                <div class="order-item">
                    <div class="item-details">
                        <img src="https://via.placeholder.com/70" alt="Điện thoại XYZ" class="item-image">
                        <span class="item-name">Tên sản phẩm: Điện thoại XYZ</span>
                        <span class="item-quantity">Số lượng: 2</span>
                        <span class="item-price">Giá: $500</span>
                    </div>
                    <div class="item-total">
                        <span>Tổng cộng: $1000</span>
                    </div>
                </div>
                <div class="order-item">
                    <div class="item-details">
                        <img src="https://via.placeholder.com/70" alt="Điện thoại XYZ" class="item-image">
                        <span class="item-name">Tên sản phẩm: Tai nghe ABC</span>
                        <span class="item-quantity">Số lượng: 1</span>
                        <span class="item-price">Giá: $200</span>
                    </div>
                    <div class="item-total">
                        <span>Tổng cộng: $200</span>
                    </div>
                </div>
                <div class="order-summary">
                    <span>Tổng đơn hàng: $1200</span>
                </div>
                <div class="back_list">
                    <button onclick="window.location.href = 'CustomerOrderPage'">Trở về danh sách đơn hàng</button>
                </div>
            </div>
        </main>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
