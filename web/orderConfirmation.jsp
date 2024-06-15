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
        </style>
        <script>
            function toggleEditAddress() {
                var addressField = document.getElementById('address');
                var editButton = document.getElementById('editAddressButton');
                if (addressField.readOnly) {
                    addressField.readOnly = false;
                    editButton.value = "Save Address";
                } else {
                    addressField.readOnly = true;
                    editButton.value = "Edit Address";
                }
            }
        </script>
    </head>
    <body>
        <div>
            <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
        </div>
        <div class="center-container">
            <div class="card">
                <h2 class="text-center">Order Confirmation</h2>
                <form action="ChangeAddress" method="POST">
                    <div class="form-group">
                        <label for="address">Địa chỉ giao hàng:</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%= request.getAttribute("address")%>" readonly>
                        <input type="button" id="editAddressButton" value="Thay đổi địa chỉ giao hàng" class="btn btn-primary btn-edit mt-2" onclick="toggleEditAddress()">
                    </div>
                </form>
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
                            List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
                            if (orderItems != null && !orderItems.isEmpty()) {
                                for (OrderItem item : orderItems) {

                        %>
                        <tr>
                            <td><%= item.getDish().getName()%></td>
                            <td><%= item.getQuantity()%></td>
                            <td><%=item.getDish().getPrice() * item.getQuantity()%></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="3">Không có món ăn nào được order</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <!-- Display total cost of the order -->
                <p class="total-cost"><b>Tổng giá tiền:</b>   <%= request.getAttribute("totalCost")%> VNĐ</p>
                <%
                    if (orderItems != null && !orderItems.isEmpty() && orderItems.size() >= 1) {
                        OrderItem oi = orderItems.get(0);
                        if (oi.getDish().getAccount() != null) {
                %>
                <p><b>Tên người nhận:   </b> <%= oi.getDish().getAccount().getName()%></p>
                <%
                        } else {
                            out.println("Required data is missing in the order item.");
                        }
                    } else {
                        out.println("Order items list does not have enough elements.");
                    }
                %>
                <form action="OrderCompleteServlet" method="post">
                    <%
                        int i = 0;
                        for (OrderItem item : orderItems) {
                    %>
                    <input type="hidden" name="orderItems<%=i%>" value="<%=item.getDish().getDish_id()%>">
                    <input type="hidden" name="orderQuantity<%=i%>" value="<%=item.getQuantity()%>">
                    <%
                            i++;
                        }
                    %>

                    <input type="hidden" name="totalCost" value="<%= request.getAttribute("totalCost")%>">

                    <label for="paymentMethod"><b>Chọn phương thức thanh toán:</b></label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                        <option value="receipt">Trả sau khi nhận hàng</option>
                        <option value="online">Trả thông qua VNPay</option>
                    </select>

                    <div class="submit-btn-container">
                        <input type="submit" value="Order" class="btn btn-primary btn-lg mt-4">
                    </div>
                </form>
                    <%
                        if(request.getAttribute("message")!=null){
                        String mess = (String) request.getAttribute("message");
                            %>
                            <div>mess</div>
                <%
                        }
                    %>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
