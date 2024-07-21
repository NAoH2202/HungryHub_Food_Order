/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
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
import model.Comment;
import model.CommentDao;
import model.Dish;
import model.DishManager;
import model.FoodAd;
import model.FoodAdManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "RateServlet", urlPatterns = {"/RateServlet"})
public class RateServlet extends HttpServlet {

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
            out.println("<title>Servlet RateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RateServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String ratingString = request.getParameter("rating");
        int rating=0;
        if(ratingString != null){
             rating = Integer.parseInt(ratingString);
        }
        
        String comment = request.getParameter("comment");
        Account account = (Account) request.getSession().getAttribute("account");
        String status = request.getParameter("status");
        switch (status) {
            case "diner":
                String dinerIdString = request.getParameter("dinerId");
                int dinerId = Integer.parseInt(dinerIdString);
                AccountManager am = new AccountManager();
                Account diner = am.getAccountById(dinerId);
                Comment currentComment = new Comment(0, account, null, diner, null, comment, rating);
                CommentDao.addCommentDiner(currentComment);
                response.sendRedirect("CustomerDinerPage?id=" + dinerId);
                break;
            case "dish":
                String dishIdString = request.getParameter("dishId");
                int dishId = Integer.parseInt(dishIdString);
                DishManager dm = new DishManager();
                Dish dish = dm.getDishById(dishId);
                Comment currentComment2 = new Comment(0, account, dish, null, null, comment, rating);
                CommentDao.addCommentDish(currentComment2);

                response.sendRedirect("CustomerDishPage?id=" + dishId);
                break;
            
            case "Post":
                String postIdString = request.getParameter("ad_id");
                String check = request.getParameter("check");
             
                int ad_id = Integer.parseInt(postIdString);
                 FoodAdManager fam = new FoodAdManager();
                FoodAd foodAd = fam.getFoodAdById(ad_id);
                Comment currentComment3 = new Comment(0, account, null, null,foodAd , comment, rating);
                CommentDao.addCommentPost(currentComment3);

                response.sendRedirect("CustomerSocialDetailPage?ad_id=" + ad_id +"&check="+check);
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
