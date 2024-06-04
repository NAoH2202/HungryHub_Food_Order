/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "VerifyServlet", urlPatterns = {"/VerifyServlet"})
public class VerifyServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyServlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        int accId = Integer.parseInt(request.getParameter("accId"));
        String inputCode = request.getParameter("code");
        
        // Lấy account từ AccountManager
        AccountManager accountManager = new AccountManager();
        
        Account acc = accountManager.getAccountById(accId);
        
        if (acc != null) {
            // Lấy mã xác thực và thời gian hiệu lực từ account
            String accountCode = acc.getMaxacthuc();
            LocalDateTime expiryTime = acc.getThoigianhieuluc();
            LocalDateTime currentTime = LocalDateTime.now();

            // Kiểm tra mã xác thực và thời gian hiệu lực
            if (inputCode.equals(accountCode)) {
                if (currentTime.isBefore(expiryTime)) {
                    // Mã xác thực hợp lệ và chưa hết hạn
                    request.setAttribute("accountId", accId);
                    request.getRequestDispatcher("SuccesfullPage").forward(request, response);
                } else {
                    // Mã xác thực đã hết hạn
                    request.setAttribute("errorMessage", "Verification code has expired.");
                    request.setAttribute("Account", acc);
                    request.getRequestDispatcher("VerifyPage").forward(request, response);
                }
            } else {
                // Mã xác thực không đúng
                request.setAttribute("errorMessage", "Invalid verification code.");
                request.setAttribute("Account", acc);
                request.getRequestDispatcher("VerifyPage").forward(request, response);
            }
        } else {
            // Account không tồn tại
            request.setAttribute("errorMessage", "Account not found.");
            request.setAttribute("Account", acc);
            request.getRequestDispatcher("VerifyPage").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
