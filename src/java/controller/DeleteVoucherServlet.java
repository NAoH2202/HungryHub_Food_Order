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
import model.VoucherManager;

@WebServlet(name = "DeleteVoucherServlet", urlPatterns = {"/DeleteVoucherServlet"})
public class DeleteVoucherServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lấy thông tin từ request
            int voucherId = Integer.parseInt(request.getParameter("voucherId"));

            // Kiểm tra đăng nhập và quyền hạn
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null || !"dinermanager".equalsIgnoreCase(account.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Lấy hoặc tạo mới VoucherManager từ application scope
            VoucherManager vm = (VoucherManager) getServletContext().getAttribute("voucherManager");
            if (vm == null) {
                vm = new VoucherManager();
                getServletContext().setAttribute("voucherManager", vm);
            }

            // Xóa voucher từ cơ sở dữ liệu
            vm.deleteVoucher(voucherId);

            // Không cần chuyển hướng ở đây vì sẽ xử lý bằng Ajax trên client side
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu có lỗi xảy ra
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to delete voucher: " + e.getMessage());
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
        return "Delete Voucher Servlet";
    }
}
