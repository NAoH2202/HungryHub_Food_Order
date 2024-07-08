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
        request.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        CommentManager cm = new CommentManager();
        Account account = (Account) request.getSession().getAttribute("account");

        String status = request.getParameter("status");
        switch (status) {
            case "comment":
                String dinerIdString = request.getParameter("dinerId");
                int dinerId = Integer.parseInt(dinerIdString);
                String commentIdString = request.getParameter("commentId");
                int commentId = Integer.parseInt(commentIdString);
                Comment comment = cm.getCommentById(commentId);
                String replyContent = request.getParameter("replyContent");
                ReplyComment rm = new ReplyComment(0, account, comment, replyContent);
                ReplyCommentDao.addReplyComment(rm);

                PrintWriter out = response.getWriter();
                response.sendRedirect("CustomerDinerPage?id=" + dinerId);
                break;
            case "dish":
                String dishIdString = request.getParameter("dishId");
                int dishId = Integer.parseInt(dishIdString);
                String commentIdString2 = request.getParameter("commentId");
                int commentId2 = Integer.parseInt(commentIdString2);
                Comment comment2 = cm.getCommentById(commentId2);
                String replyContent2 = request.getParameter("replyContent");
                ReplyComment rm2 = new ReplyComment(0, account, comment2, replyContent2);
                ReplyCommentDao.addReplyComment(rm2);

                response.sendRedirect("CustomerDishPage?id=" + dishId);
                break;
            default:
        }
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
