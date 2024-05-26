<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.OrderItemDao" %>
<%@ page import="model.OrderItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Items</title>

    </head>
    <body>
        <h1>Order Items</h1>
        <%
            // Retrieve the list of order items from the DAO
            ArrayList<OrderItem> orderItemList = OrderItemDao.getAllOrderItems();
        %>
        <table>
            <thead>
                <tr>
                    <th>Order Item ID</th>
                    <th>Order ID</th>
                    <th>Dish ID</th>
                    <th>Quantity</th>
                    <th>Price</th>

                </tr>
            </thead>
            <tbody> 
                <c:forEach var="ode" items="${oderItem}">            
                    <tr>
                        <td>${orderItem.getOrder_item_id()} </td>
                        <td${orderItem.getOrder().getOrderId()}</td>
                        <td>${orderItem.getDish().getdish_id()}</td>
                        <td>${orderItem.getQuantity()}</td>
                        <td>${orderItem.getPrice()}</td>

                    </tr>
                   

                </c:forEach>
                     <td>

                <form action="OrderItemServlet" method="GET"  >
                    <input type="hidden" name="command" value="Accept">
                    <input type="submit" value="Accept">
                </form>

                <form action="OrderItemServlet" method="GET">
                    <input type="hidden" name="command" value="ITEM">
                    <input type="submit" value="View informationItem">
                </form>
            </td>
            
        </tbody>
    </table>
</body>
</html>
