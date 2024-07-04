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
                font-weight: bold;
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
                <form action="VNPAY" method="post">
                    <div class="form-group">
                        <label for="address">Shipping Address:</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%= request.getAttribute("address") %>" readonly>
                        <input type="button" id="editAddressButton" value="Edit Address" class="btn btn-primary btn-edit mt-2" onclick="toggleEditAddress()">
                    </div>
                    <table class="center-table">
                        <thead>
                            <tr>
                                <th>Dish ID</th>
                                <th>Dish Name</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
                                if (orderItems != null && !orderItems.isEmpty()) {
                                    for (OrderItem item : orderItems) {
                            %>
                            <tr>
                                <td><%= item.getOrder_item_id() %></td>
                                <td><%= item.getDish().getName() %></td>
                                <td><%= item.getQuantity() %></td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3">No items in the order</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <!-- Display total cost of the order -->
                    <p class="total-cost">Total Cost: $<%= request.getAttribute("totalCost") %></p>
                    <%
                        if (orderItems != null && !orderItems.isEmpty() && orderItems.size() >= 1) {
                            OrderItem oi = orderItems.get(0);
                            if (oi.getDish().getAccount() != null) {
                    %>
                    <p>Account ID: <%= oi.getDish().getAccount().getAccount_id() %></p>
                    <%
                            } else {
                                out.println("Required data is missing in the order item.");
                            }
                        } else {
                            out.println("Order items list does not have enough elements.");
                        }
                    %>
                    <input type="hidden" name="orderItems" value="<%= request.getAttribute("orderItems") %>">
                    <input type="hidden" name="totalCost" value="<%= request.getAttribute("totalCost") %>">
                    <input type="hidden" name="accountId" value="<%= request.getAttribute("accountId") %>">

                    <label for="paymentMethod">Choose a payment method:</label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                        <option value="receipt">Pay upon receipt</option>
                        <option value="online">Proceed to Payment</option>
                    </select>

                    <div class="submit-btn-container">
                        <input type="submit" value="Order" class="btn btn-primary btn-lg mt-4">
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
