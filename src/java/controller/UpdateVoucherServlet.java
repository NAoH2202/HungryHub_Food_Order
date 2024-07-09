package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Voucher;
import model.VoucherManager;

@WebServlet(name = "UpdateVoucherServlet", urlPatterns = {"/UpdateVoucherServlet"})
public class UpdateVoucherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy thông tin từ request
        String voucherIdParam = request.getParameter("voucherId");
        String code = request.getParameter("code");
        String discountParam = request.getParameter("discount");
        String validFromStr = request.getParameter("validFrom");
        String validToStr = request.getParameter("validTo");

        // Chuyển đổi dữ liệu
        int voucherId = -1;
        double discount = 0;
        try {
            voucherId = Integer.parseInt(voucherIdParam);
            discount = Double.parseDouble(discountParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Xử lý lỗi nếu parse không thành công
            return;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date validFrom = null;
        Date validTo = null;
        try {
            validFrom = dateFormat.parse(validFromStr);
            validTo = dateFormat.parse(validToStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Xử lý lỗi nếu parse không thành công
            return;
        }

        // Tạo đối tượng voucher mới
        Voucher updatedVoucher = new Voucher(voucherId, code, discount, validFrom, validTo, null);

        // Lấy hoặc tạo mới VoucherManager từ application scope
        VoucherManager voucherManager = (VoucherManager) getServletContext().getAttribute("voucherManager");
        if (voucherManager == null) {
            voucherManager = new VoucherManager();
            getServletContext().setAttribute("voucherManager", voucherManager);
        }

        try {
            // Cập nhật voucher thông qua VoucherManager
            voucherManager.updateVoucher(updatedVoucher);

            // Cập nhật lại danh sách voucher trong request attribute
            request.setAttribute("voucherList", voucherManager.getAllVouchers());

            // Forward về trang danh sách voucher
            request.getRequestDispatcher("VoucherPage").forward(request, response);
        } catch (RuntimeException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Xử lý lỗi nếu không cập nhật thành công
        }
    }

    @Override
    public String getServletInfo() {
        return "Update Voucher Servlet";
    }
}
