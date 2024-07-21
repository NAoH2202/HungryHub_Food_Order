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
import model.CartItem;
import model.CartItemDao;
import model.CartItemManager;
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
        request.setCharacterEncoding("UTF-8");
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
    protected  void doGet(HttpServletRequest request, HttpServletResponse response)
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
        Account account = (Account) request.getSession().getAttribute("account");
        // Convert totalCost and accountId to their respective types
        int totalCost = Integer.parseInt(totalCostStr);
        int OrderPrice = 0;
        switch (paymentMethod) {
            case "receipt": {
                // Recreate the list of OrderItems
                OrderManager om = new OrderManager();
                CartItemManager cIm = new CartItemManager();
                ArrayList<CartItem> ciList = cIm.getCartItemByAccountId(account.getAccount_id());
                ArrayList<Account> dinerList = AddToCartServlet.getUniqueDinersFromCartItems(ciList);
                ArrayList<CartItem> ciListByDiner;
                ArrayList<OrderItem> oiList = new ArrayList<>();
                for (Account diner : dinerList) {
                    ciListByDiner = AddToCartServlet.getCartItemsByDiner(diner.getAccount_id(), ciList);
                    for (CartItem ci : ciListByDiner) {
                        OrderPrice += ci.getDish().getPrice() * ci.getQuantity();
                        oiList.add(new OrderItem(0, ci.getDish().getDish_id(), ci.getDish().getName(), ci.getDish().getPicture(), ci.getDish().getDescription(), ci.getDish().getPrice(), ci.getDish().getType(), ci.getDish().getIngredients(), ci.getQuantity(), ci.getDish().getPrice() * ci.getQuantity()));
                    }

                    Order order = new Order(0, account, diner, null, "Checking", paymentMethod, null, totalCost);
                    int orderId = OrderDao.addOrder(order);
                    for (OrderItem oi : oiList) {
                        oi.setOrder_id(orderId);
                        OrderItemDao.addOrderItem(oi);
                    }
                    oiList.clear();
                    OrderPrice = 0;
                }
                CartItemDao.removeCartItemByAccountId(account.getAccount_id());
                request.setAttribute("message", "Order thành công");
                response.sendRedirect("CustomerOrderPage");
                break;
            }
            case "online":
                OrderManager om = new OrderManager();
                CartItemManager cIm = new CartItemManager();
                ArrayList<CartItem> ciList = cIm.getCartItemByAccountId(account.getAccount_id());
                ArrayList<Account> dinerList = AddToCartServlet.getUniqueDinersFromCartItems(ciList);
                ArrayList<CartItem> ciListByDiner;
                ArrayList<OrderItem> oiList = new ArrayList<>();
                ArrayList<Integer> orderIds = new ArrayList<>();

                for (Account diner : dinerList) {
                    ciListByDiner = AddToCartServlet.getCartItemsByDiner(diner.getAccount_id(), ciList);
                    for (CartItem ci : ciListByDiner) {
                        OrderPrice += ci.getDish().getPrice() * ci.getQuantity();
                        oiList.add(new OrderItem(0, ci.getDish().getDish_id(), ci.getDish().getName(), ci.getDish().getPicture(), ci.getDish().getDescription(), ci.getDish().getPrice(), ci.getDish().getType(), ci.getDish().getIngredients(), ci.getQuantity(), ci.getDish().getPrice() * ci.getQuantity()));
                    }

                    Order order = new Order(0, account, diner, null, "Checking", false, paymentMethod, totalCost, null);
                    int orderId = OrderDao.addOrder(order);
                    for (OrderItem oi : oiList) {
                        oi.setOrder_id(orderId);
                        OrderItemDao.addOrderItem(oi);
                    }
                    orderIds.add(orderId);
                    oiList.clear();
                    OrderPrice = 0;
                }
              
             for (int orderId : orderIds) {
                OrderDao.updatePaymentStatus(orderId, true);  
            }

                CartItemDao.removeCartItemByAccountId(account.getAccount_id());
                request.setAttribute("orderIds", orderIds);
                request.setAttribute("totalCost", totalCost);
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
                
                break;
            default:
                throw new AssertionError();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
