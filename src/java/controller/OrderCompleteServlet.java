/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Dish;
import model.DishDao;
import model.DishManager;
import model.Order;
import model.OrderDao;
import model.OrderItem;
import model.OrderItemDao;
import model.OrderManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "OrderCompleteServlet", urlPatterns = {"/OrderCompleteServlet"})
public class OrderCompleteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderCompleteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderCompleteServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String totalCostStr = request.getParameter("totalCost");
        String paymentMethod = request.getParameter("paymentMethod");
        //neu chua login
        if (request.getSession().getAttribute("account") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        Account acc = (Account) request.getSession().getAttribute("account");
        // Convert totalCost and accountId to their respective types
        double totalCost = Double.parseDouble(totalCostStr);

        // Recreate the list of OrderItems
        DishManager dm = new DishManager();
        OrderManager om = new OrderManager();
        List<OrderItem> orderItems = new ArrayList<>();
        int i = 0;
        while (request.getParameter("orderItems" + i) != null) {
            int dishId = Integer.parseInt(request.getParameter("orderItems" + i));
            int quantity = Integer.parseInt(request.getParameter("orderQuantity" + i));
            // Assuming you have a way to get Dish object by dishId
            Dish dish = dm.getDishById(dishId);
            OrderItem item = new OrderItem(0, dish, quantity, totalCost);
            orderItems.add(item);
            i++;
        }
        OrderItem check = orderItems.get(0);
        Order od = new Order(0, acc, check.getDish().getAccount(), null, "Checking", paymentMethod, totalCost);
        int orderId = OrderDao.addOrder(od);
        if (orderId == -1) {
            request.setAttribute("message", "Không thể thêm order");
            request.getRequestDispatcher("complete.jsp").forward(request, response);
        }
        System.out.println(orderId);
        for (OrderItem oi : orderItems) {
            oi.setOrder_id(orderId);
            OrderItemDao.addOrderItem(oi);
        }
        request.setAttribute("message", "Order thành công");
        request.getRequestDispatcher("complete.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
