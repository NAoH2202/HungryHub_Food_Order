package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Order;
import model.OrderDao;
import model.OrderItem;
import model.OrderItemManager;
import model.OrderManager;

@WebServlet(name = "OrderItemServlet", urlPatterns = {"/OrderItemServlet"})
public class OrderItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("listOrder.jsp");
                dispatcher.forward(request, response);
                return;
            }
            switch (theCommand) {
                case "LIST":
                    listItem(request, response);
                    break;
                case "ITEM":
                    view(request, response);
                    break;
                case "Accept":
                    acceptOrderItem(request, response);
                    break;
                case "Complete":
                    complete(request, response);
                    break;
                case "Canceled":
                    canceled(request, response);
                    break;
                case "ViewDetail":
                    viewDetail(request, response);
                    break;
                default:
                    listItem(request, response);
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderManager oM = new OrderManager();
        ArrayList<Order> list = oM.getList();
        request.setAttribute("oItList", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShipperListOrderPage");
        dispatcher.forward(request, response);
    }

    private void viewDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
            request.setAttribute("message", "Order item ID is missing or empty.");
            request.getRequestDispatcher("ShipperAcceptPage").forward(request, response);
            return;
        }

        int orderItemId;
        try {
            orderItemId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid order item ID format.");
            request.getRequestDispatcher("ShipperAcceptPage").forward(request, response);
            return;
        }

        OrderManager om = new OrderManager();
        OrderItemManager otm = new OrderItemManager();
        Order order = om.getOderById(Integer.parseInt(orderIdStr));
        request.setAttribute("recipient", order.getCustomer().getName());
        request.setAttribute("recipientId", order.getCustomer().getAccount_id());
        request.setAttribute("orderItemList", otm.getOderItemByOrderId(orderItemId));
        request.getRequestDispatcher("ShipperAcceptPage").forward(request, response);
    }

    private void complete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderItemIdStr = request.getParameter("orderId");
        if (orderItemIdStr == null || orderItemIdStr.trim().isEmpty()) {
            request.setAttribute("message", "Order item ID is missing or empty.");
            request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
            return;
        }
        int orderItemId;
        try {
            orderItemId = Integer.parseInt(orderItemIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid order item ID format.");
            request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
            return;
        }
        OrderManager oM = new OrderManager();
        OrderItemManager otm = new OrderItemManager();
        OrderDao orderDao = new OrderDao();
        Order orderToUpdate = oM.getOderById(orderItemId);
        orderToUpdate.setOrder_status("Completed");
        orderDao.updateOrderStatus(orderToUpdate); // Update order_status
        request.setAttribute("orderItemList", otm.getOderItemByOrderId(orderItemId));
        request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
    }

    private void canceled(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderItemIdStr = request.getParameter("orderId");
        if (orderItemIdStr == null || orderItemIdStr.trim().isEmpty()) {
            request.setAttribute("message", "Order item ID is missing or empty.");
            request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
            return;
        }
        int orderItemId;
        try {
            orderItemId = Integer.parseInt(orderItemIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid order item ID format.");
            request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
            return;
        }
        OrderManager oM = new OrderManager();
        OrderItemManager otm = new OrderItemManager();
        OrderDao orderDao = new OrderDao();
        Order orderToUpdate = oM.getOderById(orderItemId);

        orderToUpdate.setOrder_status("canceled");
        orderDao.updateOrderStatus(orderToUpdate); // Update order_status
        String cancelReason = request.getParameter("cancelReason");
        if (cancelReason != null && !cancelReason.trim().isEmpty()) {
            orderToUpdate.setReason(cancelReason); // Đặt lý do hủy trong đơn hàng
            orderDao.updateReason(orderToUpdate); // Cập nhật lý do hủy vào cơ sở dữ liệu
        }

        request.setAttribute("orderItemList", otm.getOderItemByOrderId(orderItemId));
        request.getRequestDispatcher("ShipperListOrderPage").forward(request, response);
    }

    private void acceptOrderItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String orderItemIdStr = request.getParameter("orderId");

        if (orderItemIdStr == null || orderItemIdStr.trim().isEmpty()) {
            request.setAttribute("message", "Order item ID is missing or empty.");
            request.getRequestDispatcher("ShipperListAcceptPage").forward(request, response);
            return;
        }

        int orderItemId;
        try {
            orderItemId = Integer.parseInt(orderItemIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid order item ID format.");
            request.getRequestDispatcher("ShipperListAcceptPage").forward(request, response);
            return;
        }

        OrderManager oM = new OrderManager();
        OrderItemManager otm = new OrderItemManager();
        OrderDao orderDao = new OrderDao();

        Order orderToUpdate = oM.getOderById(orderItemId);

        if (orderToUpdate == null) {
            String message = "Failed to Accept. Order not found.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("ShipperListAcceptPage").forward(request, response);
            return;
        }

        int shipperId = acc.getAccount_id();
        orderToUpdate.setShipper(acc); // Assuming setShipper() accepts an Account object
        orderToUpdate.getShipper().setAccount_id(shipperId); // Assuming setAccount_id() is a method in Account class

        // Update order status
        orderToUpdate.setOrder_status("OntheWay");

        // Update order in database using OrderDao
        orderDao.updateShipperId(orderToUpdate); // Update shipper_id
        orderDao.updateOrderStatus(orderToUpdate); // Update order_status

        // Prepare success message and forward to ShipperAcceptPage
        String message = "Order accepted successfully!";
        request.setAttribute("message", message);
        request.setAttribute("orderItemList", otm.getOderItemByOrderId(orderItemId));
        request.getRequestDispatcher("ShipperListAcceptPage").forward(request, response);
    }

    private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        OrderItemManager oIt = new OrderItemManager();
        ArrayList<OrderItem> oil = oIt.getOderItemByOrderId(Integer.parseInt(orderId));
        request.setAttribute("orderItemList", oil);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShipperViewItemPage");
        dispatcher.forward(request, response);
    }

    private void chat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement chat logic here
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String command = request.getParameter("command");
//        if ("Accept".equals(command)) {
//            acceptOrderItem(request, response);
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
