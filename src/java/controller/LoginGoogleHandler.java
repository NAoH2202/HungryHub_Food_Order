/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dbconnext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;
import model.Account;
import model.AccountManager;
import model.Constants;
import model.GoogleSupport;
import model.UserGoogleDao;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import java.sql.ResultSet;
import model.AccountDao;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        String code= request.getParameter("code");
//        String accessToken=GoogleSupport.getToken(code);
//        UserGoogleDao user = GoogleSupport.getUserInfo(accessToken);
//        PrintWriter prW=response.getWriter();
//        prW.print(user);

        PrintWriter prW = response.getWriter();

        // Lấy mã truy cập từ tham số yêu cầu
        String code = request.getParameter("code");

        // Lấy mã thông báo truy cập từ GoogleSupport
        String accessToken = GoogleSupport.getToken(code);

        // Lấy thông tin người dùng từ mã thông báo truy cập
        UserGoogleDao user = GoogleSupport.getUserInfo(accessToken);

        // Kiểm tra xem người dùng đã tồn tại trong cơ sở dữ liệu chưa
        boolean userExists = checkUserExists(user.getId());

        if (!userExists) {
            // Nếu người dùng chưa tồn tại, thêm mới vào cơ sở dữ liệu
            try {
                // Sử dụng ConnectDB để mở kết nối
                ConnectDB connectDB = ConnectDB.getInstance();
                Connection connection = connectDB.openConnection();

                if (connection != null) {
                    String sql = "INSERT INTO Account (username, email, name, profile_picture, role, trangthaixacthuc) VALUES (?, ?, ?, ?, ?,1)";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, user.getId()); // Sử dụng ID của Google làm username
                    statement.setString(2, user.getEmail());
                    statement.setString(3, user.getName());
                    statement.setString(4, user.getPicture());
                    statement.setString(5, "Customer"); // Giả định tất cả người dùng từ Google đều là khách hàng

                    int rowsInserted = statement.executeUpdate();
                    AccountManager am = new AccountManager();
                    Account acc = am.getAccountByEmail(user.getEmail());
                    if (rowsInserted > 0) {
//                    prW.println("User saved successfully!");
                        request.getSession().setAttribute("account", acc);
                        response.sendRedirect("index.jsp");
                    } else {
                        prW.println("Failed to save user.");
                    }

                    connection.close();
                } else {
                    prW.println("Failed to establish connection.");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                prW.println("Error saving user: " + e.getMessage());
            }
        } else {
//            prW.println("User already exists in the database.");
            AccountManager am = new AccountManager();
            Account acc = am.getAccountByEmail(user.getEmail());
            if (acc != null) {
                request.getSession().setAttribute("account", acc);
                response.sendRedirect("index.jsp");
            } else {
                prW.println("Failed to login user.");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        response.setContentType("text/html;charset=UTF-8");
    }

    private boolean checkUserExists(String userId) {
        boolean exists = false;
        try {
            // Sử dụng ConnectDB để mở kết nối
            ConnectDB connectDB = ConnectDB.getInstance();
            Connection connection = connectDB.openConnection();

            if (connection != null) {
                String sql = "SELECT COUNT(*) AS count FROM Account WHERE username = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, userId);

                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    exists = count > 0;
                }

                connection.close();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Xử lý lỗi tùy ý, có thể log hoặc báo cho hệ thống khác biết
        }
        return exists;
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
