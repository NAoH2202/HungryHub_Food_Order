
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            boolean hasItems = false;

            while (true) {
                String dishId = request.getParameter("dishId" + i);
                String dishName = request.getParameter("dishName" + i);
                String dishQuantity = request.getParameter("dishQuantity" + i);

                if (dishId == null || dishQuantity == null || dishName == null) {
                    break;
                }

                int id = Integer.parseInt(dishId);
                int quantity = Integer.parseInt(dishQuantity);

                if (id > 0 && quantity > 0) {
                    // Xử lý đơn hàng (ví dụ: lưu thông tin đơn hàng vào cơ sở dữ liệu)
                    response.getWriter().println("Order placed successfully for dish ID: " + id + ", Name: " + dishName + ", Quantity: " + quantity + "<br>");
                    hasItems = true;
                }
                i++;
            }

            if (!hasItems) {
                throw new Exception("No valid items in the order");
            }
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
