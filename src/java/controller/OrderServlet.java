
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dish;
import model.OrderItem;

@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            int i = 0;
            List<OrderItem> orderItems = new ArrayList<>();
            double totalCost = 0.0; // Khởi tạo tổng chi phí

            while (true) {
                String dishId = request.getParameter("dishId" + i);
                String dishName = request.getParameter("dishName" + i);
                String dishQuantity = request.getParameter("dishQuantity" + i);

                // Nếu một trong các tham số là null, thoát khỏi vòng lặp
                if (dishId == null || dishQuantity == null || dishName == null) {
                    break;
                }

                try {
                    int id = Integer.parseInt(dishId);
                    int quantity = Integer.parseInt(dishQuantity);

                    if (id > 0 && quantity > 0) {

                        Dish dish = new Dish(id, null, dishName, null, null, 0, null, null);
                        OrderItem orderItem = new OrderItem(id, null, dish, quantity, 0);
                        orderItems.add(orderItem);
                    }
                } catch (NumberFormatException e) {

                    System.err.println("Invalid number format for dishId or dishQuantity: " + e.getMessage());

                }
                i++;
            }

            // Lấy tổng chi phí từ tham số của request
            String totalCostParam = request.getParameter("totalCost");
            if (totalCostParam != null) {
                try {
                    totalCost = Double.parseDouble(totalCostParam);
                } catch (NumberFormatException e) {
                    // Log lỗi và đặt totalCost về giá trị mặc định
                    System.err.println("Invalid number format for totalCost: " + e.getMessage());
                    totalCost = 0.0;
                }
            }

            if (orderItems.isEmpty()) {
                throw new Exception("No valid items in the order");
            }

            // Lưu thông tin đơn hàng và tổng chi phí vào request để chuyển đến trang JSP
            request.setAttribute("orderItems", orderItems);
            request.setAttribute("totalCost", totalCost);

            // Chuyển hướng đến trang xác nhận đơn hàng
            request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
