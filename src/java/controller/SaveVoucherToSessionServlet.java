/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "SaveVoucherToSessionServlet", urlPatterns = {"/SaveVoucherToSessionServlet"})
public class SaveVoucherToSessionServlet extends HttpServlet {

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
            out.println("<title>Servlet SaveVoucherToSessionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaveVoucherToSessionServlet at " + request.getContextPath() + "</h1>");
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
        String dinerId = request.getParameter("dinerId");
        String voucherIdString = request.getParameter("voucherId");
        String voucherCode = request.getParameter("code");

        if (voucherIdString != null && voucherCode != null) {
            try {
                int voucherId = Integer.parseInt(voucherIdString);
                HttpSession session = request.getSession();
                session.setAttribute("voucherId_" + dinerId, voucherId);
                session.setAttribute("voucherCode_" + dinerId, voucherCode);
            } catch (NumberFormatException e) {
                // Xử lý lỗi chuyển đổi số
                e.printStackTrace();
            }
        }

        // Chuyển hướng đến trang JSP cần hiển thị hoặc xử lý tiếp
        response.sendRedirect("OrderConfirmationPage");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
