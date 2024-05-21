/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderItem;
import model.OrderItemManager;

/**
 *
 * @author DELL
 */
@WebServlet(name = "OrderItemServlet", urlPatterns = {"/OrderItemServlet"})
 
public class OrderItemServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("listOrder.jsp");
                dispatcher.forward(request, response);
            }
            switch (theCommand) {
                case "LIST" ->
                    listItem(request, response);
                    
                case "ITEM" ->
                      view(request, response);    
                case "Map" ->
                    map(request, response);
                case "Chat" ->
                      chat(request, response);    
                  case "Accept" ->
                      accept(request, response);
                  
                default ->
                    listItem(request, response);
            }

        } catch (Exception ex) {

            Logger.getLogger(OrderItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     private void listItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         OrderItemManager oIt = new OrderItemManager();
        ArrayList<OrderItem> list = oIt.getList();
        // add these movies to the request object
        request.setAttribute("oItList", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("listOrder.jsp");
        dispatcher.forward(request, response);
    }
     private void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     }
     private void accept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     }
     private void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String itemId = request.getParameter("order_item_id");
         OrderItemManager oIt = new OrderItemManager();
        OrderItem orderItems = oIt.getOderItemById(Integer.parseInt(itemId));
        RequestDispatcher dispatcher = request.getRequestDispatcher("shipViewOrderItem.jsp");
        dispatcher.forward(request, response);
     }
     private void chat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          
     }
     
       @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


    }

     


