package controller;

import dbconnext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
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
import model.AccountDao;
import model.AccountManager;
import util.Email;
import util.NumVerify;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SingUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SingUp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("sign_up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String address = request.getParameter("address");
        String role = request.getParameter("role"); // Default role for new users, adjust as needed

        // Validation
        if (email == null || password == null || confirmPassword == null || address == null || role == null
                || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() || address.isEmpty() || role.isEmpty()
                || !password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=Invalid input");
            return;
        }
        Account account = new Account(email, email, password, email, role, address);
        //day so xac thuc
        String maxacthuc = NumVerify.getNumVerify();
        //thoi gian hieu luc
        LocalDateTime thoigianhieuluc = LocalDateTime.now().plusDays(1);

        //Trang thai xac thuc = false
        boolean trangThaiXacThuc = false;
        account.setMaxacthuc(maxacthuc);
        account.setThoigianhieuluc(thoigianhieuluc);
        account.setTrangthaixacthuc(trangThaiXacThuc);
        if (AccountDao.addAccount(account)) {
            String noidung = "<h1 style=\"color: #5e9ca0;\">Ch&agrave;o Mừng bạn đến với <span style=\"color: #33cccc;\">HungryHub</span></h1>\n"
                    + "<p>vui l&ograve;ng x&aacute;c thực t&agrave;i khoảng của bạn bằng c&aacute;ch nhập m&atilde; <span style=\"color: #ff0000;\"><strong>"+account.getMaxacthuc()+"</strong></span></p>\n"
                    + "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\n"
                    + "<p>Xin cảm ơn đ&atilde; sử dụng dịch vụ!</p>\n"
                    + "<p><strong>&nbsp;</strong></p>";
            Email.SendEmail(account.getEmail(), "Xác thực tài khoảng HungryHub", noidung);
            request.setAttribute("Account", account);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Verify.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("sign_up.jsp?error=Account creation failed");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
