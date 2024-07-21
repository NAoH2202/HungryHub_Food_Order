package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderDao;

@WebServlet(name = "UpdatePaymentStatusServlet", urlPatterns = {"/UpdatePaymentStatusServlet"})
public class UpdatePaymentStatusServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            boolean paymentStatus = true; // Set payment status here based on your logic

            OrderDao orderDao = new OrderDao();
            boolean isUpdated = orderDao.updatePaymentStatus(orderId, paymentStatus);

            if (isUpdated) {
                response.sendRedirect("CustomerOrderPage");
            } else {
                response.sendRedirect("ErrorPage.jsp");
            }
        } catch (NumberFormatException ex) {
            response.sendRedirect("ErrorPage.jsp"); // Handle number format exception
        }
    }

    @Override
    public String getServletInfo() {
        return "Update Payment Status Servlet";
    }
}
