/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Dish;
import model.DishManager;
import model.Order;
import model.OrderDao;
import model.OrderItem;
import model.OrderItemDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "OrderAgainServlet", urlPatterns = {"/OrderAgainServlet"})
public class OrderAgainServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderAgainServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderAgainServlet at " + request.getContextPath() + "</h1>");
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
        String[] dishIds = request.getParameterValues("dishId");
        Account account = (Account) request.getSession().getAttribute("account");
        Map<Integer, Integer> dishQuantities = new HashMap<>();

        for (String dishIdStr : dishIds) {
            int dishId = Integer.parseInt(dishIdStr);
            String quantityStr = request.getParameter("quantity_" + dishIdStr);
            int quantity = 0;
            if (quantityStr != null && !quantityStr.isEmpty()) {
                quantity = Integer.parseInt(quantityStr);
            }
            dishQuantities.put(dishId, quantity);
        }
        DishManager dm = new DishManager();
        Iterator<Map.Entry<Integer, Integer>> iterator = dishQuantities.entrySet().iterator();
        Map.Entry<Integer, Integer> entry = iterator.next();
        Integer firstKey = entry.getKey();
        Dish dish = dm.getDishById(firstKey);
        int totalPrice=0;
        for (Map.Entry<Integer, Integer> entry1 : dishQuantities.entrySet()) {
            Dish dish1 = dm.getDishById(entry1.getKey());
            totalPrice += dish1.getPrice()*entry1.getValue();
        }
        Order newOrder = new Order(0, account, dish.getAccount(), null, "Checking", "receipt", null, totalPrice);
        int orderId = OrderDao.addOrder(newOrder);
        for (Map.Entry<Integer, Integer> entry1 : dishQuantities.entrySet()) {
            System.out.println("Dish ID: " + entry1.getKey() + ", Quantity: " + entry1.getValue());
            Dish dish1 = dm.getDishById(entry1.getKey());
            OrderItemDao.addOrderItem(new OrderItem(0,orderId, entry1.getKey(), dish1.getName(), dish1.getPicture(), dish1.getDescription(), dish1.getPrice(), dish1.getType(), dish1.getIngredients(), entry1.getValue(), dish1.getPrice()*entry1.getValue()));
        }
        response.sendRedirect("CustomerOrderPage");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
