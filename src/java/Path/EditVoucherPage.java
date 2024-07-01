package Path;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Voucher;
import model.VoucherManager;

@WebServlet(name = "EditVoucherPage", urlPatterns = {"/EditVoucherPage"})
public class EditVoucherPage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String voucherIdParam = request.getParameter("voucherId");
        int voucherId = -1;

        try {
            voucherId = Integer.parseInt(voucherIdParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if parsing fails
            return;
        }

        VoucherManager voucherManager = new VoucherManager();
        Voucher voucher = voucherManager.getVoucherById(voucherId);

        if (voucher != null) {
            request.setAttribute("voucher", voucher);
            request.getRequestDispatcher("editVoucher.jsp").forward(request, response);
        } else {
            System.out.println("Voucher with ID " + voucherId + " not found.");
            response.sendRedirect("error.jsp"); // Redirect to an error page if voucher is not found
        }
    }

    @Override
    public String getServletInfo() {
        return "Edit Voucher Servlet";
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // You may choose to handle request processing here if needed
    }
}
    