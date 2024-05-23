/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.ParseException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.AccountDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
        // Thiết lập mã hóa ký tự
        request.setCharacterEncoding("UTF-8");

        // Khởi tạo các biến
        String fullName = null;
        String phoneNumber = null;
        String email = null;
        String adds = null;
        String filename = null;
        Date birthDate = null;

        // Tạo một nhà máy cho các mục tệp dựa trên đĩa
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // Cấu hình một kho lưu trữ để đảm bảo vị trí tạm thời an toàn được sử dụng
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("jakarta.servlet.context.tempdir"); // Hoặc "javax.servlet.context.tempdir" cho javax
        factory.setRepository(repository);
        // Tạo một trình xử lý tải tệp mới
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // Phân tích yêu cầu
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    // Xử lý các trường form thông thường
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");
                    switch (fieldName) {
                        case "full_name":
                            fullName = fieldValue;
                            break;
                        case "phone":
                            phoneNumber = fieldValue;
                            break;
                        case "email":
                            email = fieldValue;
                            break;
                        case "address":
                            adds = fieldValue;
                            break;
                        case "birth_date":
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            if (!fieldValue.isEmpty()) {
                                birthDate = dateFormat.parse(fieldValue);
                            }
                            break;
                    }
                } else {
                    // Xử lý tệp được tải lên
                    filename = item.getName();
                    if (filename != null && !filename.isEmpty()) {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/avt");
                        File uploadFile = new File(storePath + File.separator + path.getFileName());
                        item.write(uploadFile);
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (birthDate != null) {
            // Lấy tài khoản hiện tại từ session
            Account currentAccount = (Account) request.getSession().getAttribute("account");
            if (currentAccount != null) {
                // Cập nhật thông tin tài khoản
                currentAccount.setName(fullName);
                currentAccount.setPhoneNumber(phoneNumber);
                currentAccount.setEmail(email);
                currentAccount.setAddress(adds);
                currentAccount.setDate_of_birth(birthDate);
                currentAccount.setProfile_picture(filename);

                // Cập nhật tài khoản trong cơ sở dữ liệu
                boolean isUpdated = AccountDao.updateAccount(currentAccount);

                // Thiết lập thông báo kết quả
                if (isUpdated) {
                    request.setAttribute("message", "Account updated successfully!");
                } else {
                    request.setAttribute("message", "Failed to update account. Please try again.");
                }
            } else {
                request.setAttribute("message", "Account not found in session.");
            }
        } else {
            request.setAttribute("message", "Failed to update account. Please provide a valid birth date.");
        }

        // Chuyển tiếp đến trang account.jsp để hiển thị thông báo
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
