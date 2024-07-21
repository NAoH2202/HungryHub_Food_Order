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
import com.google.gson.JsonObject;
import model.Account;
import model.LikeDao;
import model.LikePostDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "LikePostServlet", urlPatterns = {"/LikePostServlet"})
public class LikePostServlet extends HttpServlet {

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
            out.println("<title>Servlet CommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int postId = Integer.parseInt(request.getParameter("postId"));
        JsonObject jsonResponse = new JsonObject();
        if (request.getSession().getAttribute("account") == null) {
            jsonResponse.addProperty("status", "notLoginYet");
            jsonResponse.addProperty("message", "Bạn phải đăng nhập để có thể thực hiện thành động này");
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());
        }
        Account account = (Account) request.getSession().getAttribute("account");

        switch (action) {
            case "like":
                LikePostDao.addLike(postId, account.getAccount_id());
                // Tạo phản hồi JSON
                jsonResponse.addProperty("status", "liked");
                jsonResponse.addProperty("message", postId + "\n" + account.getAccount_id());
                break;
            case "unlike":
                LikePostDao.removeLike(postId, account.getAccount_id());
                // Tạo phản hồi JSON
                jsonResponse.addProperty("status", "unliked");
                jsonResponse.addProperty("message", postId + "\n" + account.getAccount_id());
                break;
            case "reply":
                // Trả về phản hồi để hiển thị ô input reply
                jsonResponse.addProperty("status", "reply");
                break;
            case "rm-reply":
                // Trả về phản hồi để hiển thị ô input reply
                jsonResponse.addProperty("status", "rm-reply");
                break;
            default:
                jsonResponse.addProperty("status", "error");
                break;
        }

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
