package Path;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dish;
import model.DishManager;

@WebServlet(name = "EditDishServlet", urlPatterns = {"/EditDishServlet"})
public class EditDishServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String dishIdParam = request.getParameter("dishId");
        int dishId = -1;

        try {
            dishId = Integer.parseInt(dishIdParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if parsing fails
            return;
        }

        DishManager dishManager = new DishManager();
        Dish dish = dishManager.getDishById(dishId);

        if (dish != null) {
            request.setAttribute("dish", dish);
            request.getRequestDispatcher("EditDish.jsp").forward(request, response);
        } else {
            System.out.println("Dish with ID " + dishId + " not found.");
            response.sendRedirect("error.jsp"); // Redirect to an error page if dish is not found
        }
    }

    @Override
    public String getServletInfo() {
        return "Edit Dish Servlet";
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // You may choose to handle request processing here if needed
    }
}
