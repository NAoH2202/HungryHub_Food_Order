/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountManager;
import model.DishManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "LoadMoreDiners", urlPatterns = {"/LoadMoreDiners"})
public class LoadMoreDiners extends HttpServlet {

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
        String countString = request.getParameter("countDiner");
        int count = 0;
        if(countString != null){
            count = Integer.parseInt(countString);
        }
        ArrayList<Account> listDiner = ( ArrayList<Account>)request.getSession().getAttribute("listDiner");
        ArrayList<Account> listNext = getNextElements(listDiner, count, 4);
        PrintWriter out = response.getWriter();
        
        for(Account ac : listNext){
            out.print("<div class=\"count col-sm-6 col-md-4 col-lg-3 all \">\n" +
"                            <div class=\"box\">\n" +
"                                <div>\n" +
"                                    <div class=\"img-box\">\n" +
"                                        <img src=\""+ac.getProfile_picture()+"\" alt=\"\" style=\"object-fit: cover;\">\n" +
"                                    </div>\n" +
"                                    <div class=\"detail-box\">\n" +
"                                        <h5>\n" +
"                                            "+ac.getName()+"\n" +
"                                        </h5>\n" +
"                                        <p>\n" +
"                                            "+ac.getDetail()+"\n" +
"                                        </p>\n" +
"                                        <div class=\"options\">\n" +
"                                            <a href=\"CustomerDishPage?id=1\">\n" +
"                                                <svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" x=\"0px\" y=\"0px\" viewBox=\"0 0 456.029 456.029\" style=\"enable-background:new 0 0 456.029 456.029;\" xml:space=\"preserve\">\n" +
"                                                <g>\n" +
"                                                <g>\n" +
"                                                <path d=\"M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248\n" +
"                                                      c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z\" />\n" +
"                                                </g>\n" +
"                                                </g>\n" +
"                                                <g>\n" +
"                                                <g>\n" +
"                                                <path d=\"M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48\n" +
"                                                      C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064\n" +
"                                                      c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4\n" +
"                                                      C457.728,97.71,450.56,86.958,439.296,84.91z\" />\n" +
"                                                </g>\n" +
"                                                </g>\n" +
"                                                <g>\n" +
"                                                <g>\n" +
"                                                <path d=\"M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296\n" +
"                                                      c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z\" />\n" +
"                                                </g>\n" +
"                                                </g>\n" +
"                                                </svg>\n" +
"                                            </a>\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>\n" +
"                        </div>");
        }
        
    }

    public static ArrayList<Account> getNextElements(ArrayList<Account> list, int skip, int take) {
        ArrayList<Account> result = new ArrayList<>();

        // Kiểm tra nếu skip lớn hơn hoặc bằng kích thước của danh sách
        if (skip >= list.size()) {
            return result; // Trả về danh sách rỗng nếu không còn phần tử nào để lấy
        }

        // Tính toán số phần tử thực tế có thể lấy ra
        int end = Math.min(skip + take, list.size());

        // Lấy các phần tử từ vị trí skip đến end
        for (int i = skip; i < end; i++) {
            result.add(list.get(i));
        }

        return result;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
