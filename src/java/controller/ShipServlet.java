/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountDao;
import model.AccountManager;
import model.OrderItem;
import model.OrderItemManager;
 

/**
 *
 * @author DELL
 */
@WebServlet(name = "ShipServlet", urlPatterns = {"/ShipServlet"})
public class ShipServlet extends HttpServlet {

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
            out.println("<title>Servlet ship</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ship at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
 
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    try {
            String theCommand = request.getParameter("command");
            if (theCommand == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("shipIndex.jsp");
                dispatcher.forward(request, response);
            }
            switch (theCommand) {
                 
                case "VIEW" ->
                    viewInf(request, response);
                  case "LOAD" ->
                    load(request, response);
                  case "EDIT" ->
                    edit(request, response);  
                default ->
                    viewInf(request, response);
            }

        } catch (Exception ex) {

            Logger.getLogger(ShipServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
      private void viewInf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          AccountManager acc = new AccountManager();
        ArrayList<Account> list = acc.getList();
        // add these movies to the request object
        request.setAttribute("Acc", list);

        // send to the JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("ship.jsp");
        dispatcher.forward(request, response);
    }
       private void load(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //read student id from the form data
        int Id = Integer.parseInt(request.getParameter("Id"));
        AccountManager acm = new AccountManager();
        //get student from the database
        Account ac = acm.getAccountById(Id);
        //place student in the request attribute
        request.setAttribute("Ac", ac);
        //send to jsp page: update-student-form.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditShip.jsp");
        dispatcher.forward(request, response);
    }
        private void edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read student info from the form data
         
        int id = Integer.parseInt(request.getParameter("Account_id"));
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("phoneNumber");
        String adress = request.getParameter("adress");
        //create a new student object
        Account ac = new Account(name, email, phoneNumber, adress);

        //perform update on database
        AccountDao.edit(ac);
        //send them back to the "list student" page
        RequestDispatcher dispatcher = request.getRequestDispatcher("ContactServlet?command=VIEW");
        dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
