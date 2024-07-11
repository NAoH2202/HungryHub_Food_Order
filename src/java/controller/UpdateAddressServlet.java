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
import javax.servlet.http.HttpSession;
import model.Account;
import model.AccountDao;
import model.Districts;
import model.DistrictsManager;
import model.Provinces;
import model.ProvincesManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "UpdateAddressServlet", urlPatterns = {"/UpdateAddressServlet"})
public class UpdateAddressServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateAddressServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAddressServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        
        ProvincesManager pm = new ProvincesManager();
        DistrictsManager dim = new DistrictsManager();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        
        int city = Integer.parseInt(request.getParameter("city"));
        Provinces provinces = pm.getProvincesById(city);
        int districtid = Integer.parseInt(request.getParameter("district"));
        Districts district = dim.getDistrictById(districtid);
        String address = request.getParameter("address");
        boolean order = "true".equals(request.getParameter("order"));
        
        acc.setAddress(address);
        acc.setProvinces(provinces);
        acc.setDistrict(district);
        
        AccountDao.updateAccountLocation(acc.getAccount_id(), city, districtid, address);
        session.setAttribute("account", acc);
        if(order){
            response.sendRedirect("OrderConfirmationPage");
        }
        else{
            response.sendRedirect("AccountPage");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
