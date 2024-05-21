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
import model.AccountDao;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccountServlet"})
public class UpdateAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateAccountServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountServlet at " + request.getContextPath() + "</h1>");
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
        // Set character encoding
        request.setCharacterEncoding("UTF-8");

        // Get parameters from the request
        
        String username = request.getParameter("username");
        String fullName = request.getParameter("full_name");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String birthDate = request.getParameter("birth_date");
        System.out.println("day la ddd: "+username+fullName+phoneNumber+email);
        // Get the current account from the session
        Account currentAccount = (Account) request.getSession().getAttribute("account");

        // Update the account details
        currentAccount.setUsername(username);
        currentAccount.setName(fullName);
        currentAccount.setPhoneNumber(phoneNumber);
        currentAccount.setEmail(email);
        currentAccount.setDate_of_birth(birthDate);

        // Update the account in the database
        boolean isUpdated = AccountDao.updateAccount(currentAccount);

        // Set a message attribute based on the update result
        if (isUpdated) {
            request.setAttribute("message", "Account updated successfully!");
        } else {
            request.setAttribute("message", "Failed to update account. Please try again.");
        }

        // Forward to the same page or a result page
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
