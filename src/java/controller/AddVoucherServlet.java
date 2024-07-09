package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Voucher;
import model.VoucherManager;

@WebServlet(name = "AddVoucherServlet", urlPatterns = {"/AddVoucherServlet"})
public class AddVoucherServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lấy thông tin từ form thêm voucher
            String code = request.getParameter("code");
            double discountPercentage = Double.parseDouble(request.getParameter("discount_percentage"));
            LocalDate validFrom = LocalDate.parse(request.getParameter("valid_from"));
            LocalDate validTo = LocalDate.parse(request.getParameter("valid_to"));

            // Kiểm tra đăng nhập và quyền hạn
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null || !"dinermanager".equalsIgnoreCase(account.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Tạo đối tượng Voucher mới
            Timestamp validFromTimestamp = Timestamp.valueOf(validFrom.atStartOfDay());
            Timestamp validToTimestamp = Timestamp.valueOf(validTo.atStartOfDay());
            Voucher newVoucher = new Voucher(0, code, discountPercentage, validFromTimestamp, validToTimestamp, account);

            // Lấy hoặc tạo mới VoucherManager từ application scope
            VoucherManager vm = (VoucherManager) getServletContext().getAttribute("voucherManager");
            if (vm == null) {
                vm = new VoucherManager();
                getServletContext().setAttribute("voucherManager", vm);
            }

            // Thêm voucher vào cơ sở dữ liệu
            vm.addVoucher(newVoucher);

            // Nếu thành công, chuyển hướng về trang quản lý voucher
            response.sendRedirect("VoucherPage");
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu có lỗi xảy ra
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error occurred while adding voucher: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Add Voucher Servlet";
    }
}
