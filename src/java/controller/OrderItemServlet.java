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
                case "Map":
                    map(request, response);
                    break;
                case "Chat":
                    chat(request, response);
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

    private void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement map logic here
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
        String command = request.getParameter("command");
        if ("Accept".equals(command)) {
            acceptOrderItem(request, response);
        }
    }

    private void acceptOrderItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderItemIdStr = request.getParameter("orderId");
        
    
        if (orderItemIdStr == null || orderItemIdStr.trim().isEmpty()) {
            request.setAttribute("message", "Order item ID is missing or empty.");
            request.getRequestDispatcher("ShipperAccept.jsp").forward(request, response);
            return;
        }

        int orderItemId;
        try {
            orderItemId = Integer.parseInt(orderItemIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid order item ID format.");
            request.getRequestDispatcher("ShipperAccept.jsp").forward(request, response);
            return;
        }

        OrderManager oM = new OrderManager();
        OrderItemManager otm = new OrderItemManager();
        Order orderToUpdate = oM.getOderById(orderItemId);
        OrderDao orderDao = new OrderDao();
        String message;
        if (orderToUpdate != null) {
            orderToUpdate.setOrder_status("OntheWay");
            orderDao.updateOrderStatus(orderToUpdate);
            message = "Accept successfully!";
            request.setAttribute("message", message);
            request.setAttribute("orderItemList", otm.getOderItemByOrderId(orderItemId));
        request.getRequestDispatcher("ShipperAccept.jsp").forward(request, response);
        } else {
            message = "Failed to Accept.";
      
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("ShipperAccept.jsp").forward(request, response);
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
