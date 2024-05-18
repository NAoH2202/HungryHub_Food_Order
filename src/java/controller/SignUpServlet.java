package controller;

import dbconnext.ConnectDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AccountManager;

/**
 *
 * @author lenovo
 */
public class SignUpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SingUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SingUp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("sign_up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String displayName = request.getParameter("displayName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String birthdate = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phone");

        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            conn = db.openConnection();
            String query = """
                           INSERT INTO [User] ([username], [password], [name], [Gender], [PhoneNumber], [email], [BirthDay],role)
                           VALUES (?, ?, ?, ?, ?, ?, ?,1)""";
            statement = conn.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, displayName);
            statement.setString(4, gender);
            statement.setString(5, phoneNumber);
            statement.setString(6, email);
            statement.setString(7, birthdate);
            statement.executeUpdate();
            request.setAttribute("displayName", displayName);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SignUpSuccessfull.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
