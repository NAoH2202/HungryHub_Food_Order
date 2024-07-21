package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinh
 */
@WebServlet(name="Admin", urlPatterns ="/admin")
public class Admin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        String action = "";
       if(req.getParameter("action")!=null){
           action = req.getParameter("action");
       }
       switch(action){
           case "create":
                showCreateForm(req, resp);
               break;
           case "index":
                showIndexForm(req,resp);
                break;
           case "users":
               showUsersForm(req,resp);
               break; 
           case "banner":
                  showUserBan(req,resp);   
                  break;
           case "comment":
                showComment(req,resp);   
                break;
           case "voucher":
               showVoucher(req,resp);
               break;
           case "home":
               showHome(req,resp);
               break;
       }       
          
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/create.jsp");  
        requestDispatcher.forward(req, resp);
    }
    private void showIndexForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/index.jsp");
      requestDispatcher.forward(req, resp);
    }
    private void showUsersForm(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/account");
        requestDispatcher.forward(req, resp);
    }

    private void showUserBan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/banuser.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showComment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/comment");
        requestDispatcher.forward(req, resp);
    }

    private void showVoucher(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/voucher");
        requestDispatcher.forward(req, resp);
    }

    private void showHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/home.jsp");
        requestDispatcher.forward(req, resp);
    }
    

    

   
}
