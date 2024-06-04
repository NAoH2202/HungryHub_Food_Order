/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountManager;
import util.Email;
import util.NumVerify;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "ForgotPassServlet", urlPatterns = {"/ForgotPassServlet"})
public class ForgotPassServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgetPassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String maxacthuc = NumVerify.getNumVerify();
        String noidung = "<h1 style=\"color: #5e9ca0;\">Đ&acirc;y l&agrave; m&atilde; x&aacute;c thực thay đổi mật khẩu t&agrave;i khoảng <span style=\"color: #33cccc;\">HungryHub </span>của bạn</h1>\n"
                + "<p>vui l&ograve;ng x&aacute;c thực t&agrave;i khoảng của bạn bằng c&aacute;ch nhập m&atilde; <span style=\"color: #ff0000;\"><strong>"+maxacthuc+"</strong></span></p>\n"
                + "<p>Vui l&ograve;ng kh&ocirc;ng để lộ m&atilde; v&agrave; đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\n"
                + "<p>Xin cảm ơn đ&atilde; sử dụng dịch vụ!</p>\n"
                + "<p><strong>&nbsp;</strong></p>\n"
                + "<div class=\"ddict_btn\" style=\"top: 48px; left: 374.594px;\"><img src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/logo/48.png\" /></div>";
        Email.SendEmail(email, "Xác thực thay đổi mật khẩu", noidung);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("verify", maxacthuc);
        response.sendRedirect("VerifyPassPage");
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
