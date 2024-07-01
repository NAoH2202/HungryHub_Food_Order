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
                <form action="ChangeAddress" method="POST">
                    <div class="form-group">
                        <label for="address">Địa chỉ giao hàng:</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%=account.getAddress()%>" readonly>
                        <input type="button" id="editAddressButton" value="Thay đổi địa chỉ giao hàng" class="btn btn-primary btn-edit mt-2" onclick="toggleEditAddress()">
                    </div>
                </form>
                <%
                    int OrderPrice = 0;
                    int totalPrice = 0;
                    CartItemManager cim = new CartItemManager();
                    ArrayList<CartItem> ciList = cim.getCartItemByAccountId(account.getAccount_id());
                    ArrayList<Account> dinerList = AddToCartServlet.getUniqueDinersFromCartItems(ciList);
                    ArrayList<CartItem> ciListByDiner;
                    for (Account diner : dinerList) {
                %>
                <h2><%=diner.getName()%></h2>
                <table class="center-table">
                    <thead>
                        <tr>
                            <th>Tên món ăn</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ciListByDiner = AddToCartServlet.getCartItemsByDiner(diner.getAccount_id(), ciList);
                            for (CartItem ci : ciListByDiner) {
                                OrderPrice += ci.getDish().getPrice() * ci.getQuantity();
                        %>
                        <tr>
                            <td><%= ci.getDish().getName()%></td>
                            <td><%= ci.getQuantity()%></td>
                            <td><%=ci.getDish().getPrice() * ci.getQuantity()%></td>
                        </tr>
                        <%
                            }%>
                    </tbody>
                </table>
                <p class="total-cost"><b>Tổng :</b> <%=OrderPrice%> VNĐ</p>
                <%totalPrice += OrderPrice;
                        OrderPrice = 0;
                    }%>
                <!-- Display total cost of the order -->
                <p class="total-cost"><b>Tổng giá tiền:</b>   <%=totalPrice%> VNĐ</p>

                <p><b>Tên người nhận:   </b> <%=account.getName()%></p>

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
        <script>
            // Hiển thị modal thông báo thành công
            function showSuccessModal() {
                document.getElementById('successModal').style.display = 'flex';
            }
            // Đóng modal và submit form
            function closeModal() {
                document.getElementById('successModal').style.display = 'none';
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
