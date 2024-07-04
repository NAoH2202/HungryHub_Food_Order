/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountManager;
import model.Comment;
import model.CommentManager;
import model.ReplyComment;
import model.ReplyCommentDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "RepCommentServlet", urlPatterns = {"/RepCommentServlet"})
public class RepCommentServlet extends HttpServlet {

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
            out.println("<title>Servlet RepCommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RepCommentServlet at " + request.getContextPath() + "</h1>");
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
        JsonObject jsonResponse = new JsonObject();
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (request.getSession().getAttribute("account") == null) {
                jsonResponse.addProperty("status", "notLoginYet");
                jsonResponse.addProperty("message", "Bạn phải đăng nhập để có thể thực hiện thành động này");
                response.setContentType("application/json");
                response.getWriter().write(jsonResponse.toString());
                return;
            }

            // Lấy các tham số từ yêu cầu
            String replyContent = request.getParameter("replyContent");
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            CommentManager cm = new CommentManager();
            Comment comment = cm.getCommentById(commentId);
            int dinerId = Integer.parseInt(request.getParameter("dinerId"));
            AccountManager am = new AccountManager();
            Account diner = am.getAccountById(dinerId);

            ReplyComment repcomment = new ReplyComment(commentId, diner, comment, replyContent);
            ReplyCommentDao.addReplyComment(repcomment);

            // Tạo phản hồi JSON thành công
            jsonResponse.addProperty("status", "success");
        } catch (Exception e) {
            // Tạo phản hồi JSON lỗi
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "An error occurred: " + e.getMessage());
        }

        // Thiết lập kiểu nội dung và gửi phản hồi
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
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
