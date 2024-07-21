<%@page import="util.CheckLocation"%>
<%@page import="model.Voucher"%>
<%@page import="model.VoucherManager"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Districts"%>
<%@page import="model.Provinces"%>
<%@page import="controller.AddToCartServlet"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CartItemManager"%>
<%@page import="model.Account"%>
<%@ page import="model.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Dish" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <style>
            .center-container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }
            .card {
                width: 50%;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin-bottom: 30px;
            }
            .center-table {
                margin: 0 auto;
                width: 100%;
                border-collapse: collapse;
            }
            .center-table th, .center-table td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }
            .center-table th {
                background-color: #f2f2f2;
            }
            .total-cost {
                margin-top: 10px;
            }
            .btn-edit {
                padding: 5px 10px;
                background-color: #007bff;
                border: none;
                color: white;
            }
            .btn-edit:hover {
                background-color: #0056b3;
            }
            .submit-btn-container {
                text-align: center;
            }
            /* Styles for the success modal */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }
            .modal-content {
                background-color: #fefefe;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
                text-align: center;
                border-radius: 10px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .success-icon {
                font-size: 50px;
                color: green;
            }
            .modal-header-new {
                display: flex;
                justify-content: flex-end;
            }
            .modal-body {
                padding: 10px 20px;
            }
            .modal-footer-new {
                display: flex;
                justify-content: center;
                align-content: center;
            }
            .btn-success {
                padding: 10px 40px;
                background-color: green;
                width: 200px;
                border: none;
                color: white;
                font-size: 16px;
                border-radius: 5px;
            }
            .btn-success:hover {
                background-color: darkgreen;
            }
            .order-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
            }

            .item_container {
                display: flex;
                justify-content: space-between;
                width: 100%;
                margin-bottom: 20px;
                border-bottom: 1px solid #eaeaea;
            }

            .order-item img {
                width: 100px;
                height: 100px;
                border-radius: 8px;
                margin-right: 20px;
            }

            .item-details {
                flex-grow: 1;
            }

            .item-name {
                font-weight: bold;
                color: #333;
                font-size: 1.2em;
            }

            .item-description {
                color: #777;
                margin: 5px 0;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 500px; /* Bạn có thể điều chỉnh giá trị này */
            }

            .item-price {
                color: #d9534f;
                font-weight: bold;
            }
            .title{
                font-size:  20px;
            }
            .price{
                text-align: right;
            }
            .input-container {
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 10px;
            }

            #myInput {
                width: 60%;
                border-radius: 4px;
                font-size: 16px;
                flex: 1;
            }
            .input-voucher{
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 5px;
                padding: 10px;
            }
            .input-voucher label {
                margin-right: 10px;
                font-size: 16px;
                color: #333;
                white-space: nowrap;
            }
            #addButton {
                width: 200px;
                background-color: #28a745;
                border: none;
                color: white;
                padding: 5px 20px;
                font-size: 16px;
                cursor: pointer;
                margin-left: 10px;
            }

            #addButton:hover {
                background-color: #218838;
            }
            .notification-bar {
                background-color: #ffcc00;
                color: white;
                padding: 5px;
                padding-left: 10px;
                /*text-align: center;*/
                font-size: 14px;
                width: auto;
                max-width: 70%;
                border-radius: 5px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>
        <div>
            <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
        </div>
        <%
            if (request.getSession().getAttribute("account") == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            Account account = (Account) request.getSession().getAttribute("account");
        %>
        <div class="center-container">
            <div class="card">
                <h2 class="text-center">Xác nhận đơn hàng</h2>
                <form action="CustomerUpdateAddressPage" method="POST">
                    <div class="form-group">
                        <label for="address">Địa chỉ giao hàng:</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%=account.getAddress()%>" readonly>  
                        <input type="hidden" name="order" value="true">
                        <input type="submit" id="editAddressButton" value="Thay đổi địa chỉ giao hàng" class="btn btn-primary btn-edit mt-2">
                    </div>
                </form>
                <%
                    int OrderPrice = 0;
                    int totalPrice = 0;
                    int totalShipFee = 0;
                    CartItemManager cim = new CartItemManager();
                    ArrayList<CartItem> ciList = cim.getCartItemByAccountId(account.getAccount_id());
                    ArrayList<Account> dinerList = AddToCartServlet.getUniqueDinersFromCartItems(ciList);
                    ArrayList<CartItem> ciListByDiner;
                    NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
                    VoucherManager vm = new VoucherManager();
                    boolean checkLocation = false;
                    for (Account diner : dinerList) {
                        if (CheckLocation.CheckDinerLocation(diner, account)) {
                            totalShipFee += 15000;
                        } else {
                            totalShipFee += 30000;
                        }
                %>
                <div class="title"><b>Tên cửa hàng:</b> <%=diner.getName()%></div>

                <%
                    ciListByDiner = AddToCartServlet.getCartItemsByDiner(diner.getAccount_id(), ciList);
                    for (CartItem ci : ciListByDiner) {
                        OrderPrice += ci.getDish().getPrice() * ci.getQuantity();
                        checkLocation = !CheckLocation.CheckDishLocation(ci.getDish(), account);
                        if (!CheckLocation.CheckDishLocation(ci.getDish(), account)) {
                %>
                <div class="notification-bar"><%= ci.getDish().getName()%> là món ăn không phù hợp để giao ngoại thành.</div>
                <%
                    }
                %>
                <div class="item_container">
                    <div class="order-item">
                        <img src="<%= ci.getDish().getPicture()%>" alt="Pizza Margherita">
                        <div class="item-details">
                            <div class="item-name"><%= ci.getDish().getName()%></div>
                            <div class="item-description">Mô tả: <%= ci.getDish().getDescription()%></div>
                            <div class="item-price">Giá: <%= numberFormat.format(ci.getDish().getPrice())%> ₫</div>
                            <div class="item-quantity">Số lượng: <%= ci.getQuantity()%></div>
                        </div>
                    </div>
                </div>

                <%
                    }
                    String voucherCode;
                    int voucherId;
                    if (session.getAttribute("voucherId_" + diner.getAccount_id()) != null && session.getAttribute("voucherCode_" + diner.getAccount_id()) != null) {
                        voucherId = (int) session.getAttribute("voucherId_" + diner.getAccount_id());
                        voucherCode = (String) session.getAttribute("voucherCode_" + diner.getAccount_id());
                    } else {
                        voucherId = -1;
                        voucherCode = "";
                    }
                    Voucher voucher = vm.getVoucherById(voucherId);
                    Double percent = voucher == null ? 0 : voucher.getDiscount_percentage() / 100.0;
                    int discountAmount = (int) Math.round(OrderPrice * percent);
                    OrderPrice = OrderPrice - discountAmount;
                %>
                <div class="input-voucher">
                    <label for="myInput" > Mã giảm giá : </label>
                    <input type="text" id="myInput" value="<%= voucherCode%>" disabled>
                    <form action="CustomerDinerVoucherPage" method="Post" style="margin: 0;">
                        <input type="hidden" name="dinerId" value="<%= diner.getAccount_id()%>">
                        <input type="hidden" name="check" value="true">
                        <button id="addButton">Thêm mã</button>
                    </form>
                </div>
                <div class="price" style="margin-bottom: 0">
                    <p class="total-cost"><b>Tổng :</b> <%=numberFormat.format(OrderPrice)%> ₫</p>
                </div>
                <%totalPrice += OrderPrice;
                        OrderPrice = 0;
                    }%>
                <div class="price">
                    <p class="total-cost"><b>Tổng tiền ship:</b> <%= numberFormat.format(totalShipFee)%> ₫</p>
                    <p class="total-cost"><b>Tổng giá tiền:</b> <%= numberFormat.format(totalPrice+totalShipFee)%> ₫</p>

                    <p><b>Tên người nhận:   </b> <%=account.getName()%></p>
                </div>
                <%
                    String address = account.getAddress();
                    Provinces provinces = account.getProvinces();
                    Districts district = account.getDistrict();
                    if (address == null || provinces == null || district == null || checkLocation) {
                %>
                <div class="alert alert-danger" role="alert">
                    Có lẽ bạn chưa nhập địa chỉ trước khi đặt hàng hoặc món ăn không phù hợp.
                </div>
                <%
                } else {
                %>
                <form id="orderForm" action="OrderCompleteServlet" method="post">
                    <input type="hidden" name="totalCost" value="<%=totalPrice%>">
                    <label for="paymentMethod"><b>Chọn phương thức thanh toán:</b></label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                        <option value="receipt">Trả sau khi nhận hàng</option>
                        <option value="online">Trả thông qua VNPay</option>
                    </select>

                    <div class="submit-btn-container">
                        <input type="button" value="Đặt hàng" class="btn btn-primary btn-lg mt-4" onclick="showSuccessModal()">
                    </div>
                </form>
                <%
                    }
                %>
                <%
                    if (request.getAttribute("message") != null) {
                        String mess = (String) request.getAttribute("message");
                %>
                <div>mess</div>
                <%
                    }
                %>
            </div>
        </div>
        <div id="successModal" class="modal">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="success-icon">✔</div>
                    <h2>Đặt hàng thành công!</h2>
                    <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đang được xử lý.</p>
                    <p>Đi đến danh sách đơn hàng !!</p>
                </div>
                <div class="modal-footer-new">
                    <button class="btn-success" onclick="submitForm()">OK</button>
                </div>
            </div>
        </div>
        <div id="VNPAYModal" class="modal">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="success-icon">✔</div>
                    <h2>Đặt hàng thành công!</h2>
                    <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đang được xử lý.</p>
                    <p>Đi đến Trang Thanh Toán !!</p>
                </div>
                <div class="modal-footer-new">
                    <button class="btn-success" onclick="submitForm()">OK</button>
                </div>
            </div>
        </div>
        <script>
            // Hiển thị modal thông báo thành công
            function showSuccessModal() {
                document.getElementById('successModal').style.display = 'flex';
            }
            // Đóng modal và submit form
            function closeModal() {
                document.getElementById('successModal').style.display = 'none';
            }
            function showSuccessModal() {
                document.getElementById('VNPAYModal').style.display = 'flex';
            }
            // Đóng modal và submit form
            function closeModal() {
                document.getElementById('VNPAYModal').style.display = 'none';
            }

            // Submit form sau khi đóng modal
            function submitForm() {
                closeModal();
                document.getElementById('orderForm').submit();
            }
        </script>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
