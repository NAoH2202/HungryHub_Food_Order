<%@ page import="model.OrderItem" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Dish" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />
    </head>
    <body>
        <h2>Order Confirmation</h2>
        <table border="1">
            <tr>
                <th>Dish ID</th>
                <th>Dish Name</th>
                <th>Quantity</th>
            </tr>
            <%
                List<OrderItem> orderItems = (List<OrderItem>) request.getAttribute("orderItems");
                if (orderItems != null && !orderItems.isEmpty()) {
                    for (OrderItem item : orderItems) {
            %>
            <tr>
                <td><%= item.getOrder_item_id()%></td>
                <td><%= item.getDish().getName()%></td>
                <td><%= item.getQuantity()%></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3">No items in the order</td>
            </tr>
            <% }%>
        </table>
        <!-- Hiển thị tổng tiền của đơn hàng -->
        <p>Total Cost: $<%= request.getAttribute("totalCost")%></p>

        <!-- Thêm trường ẩn để chứa tổng chi phí -->
        <input type="hidden" name="totalCost" value="<%= request.getAttribute("totalCost")%>">

        <!-- Thêm trường ẩn để chứa account_id -->
        <input type="hidden" name="accountId" value="<%= request.getAttribute("accountId")%>">

        <!-- Thêm nút để chuyển hướng đến trang thanh toán -->
        <form action="VNPAY" method="post">
            <input type="hidden" name="orderItems" value="<%= request.getAttribute("orderItems")%>">
            <input type="hidden" name="totalCost" value="<%= request.getAttribute("totalCost")%>">

            <label for="paymentMethod">Choose a payment method:</label>
            <select id="paymentMethod" name="paymentMethod">
                <option value="receipt">Pay upon receipt</option>
                <option value="online">Proceed to Payment</option>
            </select>

            <input type="submit" value="Submit">
        </form>
            
    </body>
</html>
