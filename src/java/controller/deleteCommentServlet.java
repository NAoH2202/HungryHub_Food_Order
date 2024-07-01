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
import model.Account;
import model.AccountManager;
import model.Comment;
import model.CommentDao;
import model.ReplyCommentDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "deleteCommentServlet", urlPatterns = {"/deleteCommentServlet"})
public class deleteCommentServlet extends HttpServlet {

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
            out.println("<title>Servlet deleteCommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteCommentServlet at " + request.getContextPath() + "</h1>");
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

        String status = request.getParameter("status");
        switch (status) {
            case "Comment":
                String dinerIdString = request.getParameter("dinerId");
                int dinerId = Integer.parseInt(dinerIdString);
                String commentIDString = request.getParameter("commentID");
                int commentId = Integer.parseInt(commentIDString);
                CommentDao.deleteComment(commentId);
                response.sendRedirect("CustomerDinerPage?id=" + dinerId);
                break;
            case "dish":
                String dishIdString = request.getParameter("dishId");
                int dishId = Integer.parseInt(dishIdString);
                String commentIDString2 = request.getParameter("commentID");
                int commentId2 = Integer.parseInt(commentIDString2);
                CommentDao.deleteComment(commentId2);
                response.sendRedirect("CustomerDishPage?id=" + dishId);
                break;
            case "reply":

                String replycommentIDString = request.getParameter("replycommentID");
                int replycommentId = Integer.parseInt(replycommentIDString);
                ReplyCommentDao.deleteReplyCommentById(replycommentId);
                if (request.getParameter("dinerId") != null) {
                    String dinerIdString2 = request.getParameter("dinerId");
                    int dinerId2 = Integer.parseInt(dinerIdString2);
                    response.sendRedirect("CustomerDinerPage?id=" + dinerId2);
                }else{
                    String dishIdString2 = request.getParameter("dishId");
                    int dishId2 = Integer.parseInt(dishIdString2);
                    response.sendRedirect("CustomerDishPage?id=" + dishId2);
                }
                break;
            // Có thể thêm các case khác để xử lý cho các giá trị khác của 'status'
            default:
                response.getWriter().write("Invalid status!");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
