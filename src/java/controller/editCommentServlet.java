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
import model.CommentDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "editCommentServlet", urlPatterns = {"/editCommentServlet"})
public class editCommentServlet extends HttpServlet {

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
            out.println("<title>Servlet editCommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editCommentServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String status = request.getParameter("status");

        // Sử dụng switch-case để xử lý dựa trên giá trị của 'status'
        switch (status) {
            case "diner":
                // Lấy dữ liệu cần thiết từ form
                String commentIdString = request.getParameter("commentID");
                String dinerIdString = request.getParameter("dinerId");
                String rateString = request.getParameter("rate");
                String content = request.getParameter("content");


                int commentId = Integer.parseInt(commentIdString);
                int dinerId = Integer.parseInt(dinerIdString);
                int rate = Integer.parseInt(rateString);
                CommentDao.updateComment(commentId, content, rate);
                
                response.sendRedirect("CustomerDinerPage?id=" + dinerId);
                break;
            case "dish":
                // Lấy dữ liệu cần thiết từ form
                String commentIdString2 = request.getParameter("commentID");
                String dishIdString = request.getParameter("dishId");
                String rateString2 = request.getParameter("rate");
                String content2 = request.getParameter("content");


                int commentId2 = Integer.parseInt(commentIdString2);
                int dishId = Integer.parseInt(dishIdString);
                int rate2 = Integer.parseInt(rateString2);
                CommentDao.updateComment(commentId2, content2, rate2);
                
                response.sendRedirect("CustomerDishPage?id=" + dishId);
                break;
            // Có thể thêm các case khác để xử lý cho các giá trị khác của 'status'
            default:
                response.getWriter().write("Invalid status!");
                break;
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
