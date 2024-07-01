package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dish;
import model.DishManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.NumVerify;

@WebServlet(name = "UpdateDishServlet", urlPatterns = {"/UpdateDishServlet"})
public class UpdateDishServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Có thể xử lý yêu cầu ở đây nếu cần
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập mã hóa ký tự
        request.setCharacterEncoding("UTF-8");

        String name = null;
        String picture = null; // Thêm biến này để lưu trữ ảnh cũ
        String description = null;
        int price = 0;
        String type = null;
        String ingredients = null;
        String filename = null;
        int dishId = -1;

        // Tạo một nhà máy cho các mục tệp dựa trên đĩa
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("jakarta.servlet.context.tempdir");
        factory.setRepository(repository);
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
                        case "dishId":
                            dishId = Integer.parseInt(fieldValue);
                            break;
                        case "name":
                            name = fieldValue;
                            break;
                        case "description":
                            description = fieldValue;
                            break;
                        case "price":
                            price = Integer.parseInt(fieldValue);;
                            break;
                        case "type":
                            type = fieldValue;
                            break;
                        case "ingredients":
                            ingredients = fieldValue;
                            break;
                    }
                } else {
                    // Xử lý tệp được tải lên
                    filename = item.getName();
                    if (filename != null && !filename.isEmpty()) {
                        Path path = Paths.get(filename);
                        String extension = "";

                        // Lấy phần mở rộng của tệp
                        int dotIndex = filename.lastIndexOf('.');
                        if (dotIndex >= 0) {
                            extension = filename.substring(dotIndex);
                        }

                        // Tạo tên tệp mới với chuỗi ngẫu nhiên
                        String newFilename = NumVerify.getNumVerify() + extension;
                        String storePath = servletContext.getRealPath("/images");
                        File uploadFile = new File(storePath + File.separator + newFilename);
                        item.write(uploadFile);

                        // Lưu lại tên tệp mới để sử dụng sau này (nếu cần)
                        filename = "images/" + newFilename;
                    }
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateDishServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Kiểm tra nếu dishId hợp lệ
        if (dishId != -1) {
            DishManager dishManager = new DishManager();
            Dish currentDish = dishManager.getDishById(dishId);
            if (currentDish != null) {
                // Cập nhật thông tin món ăn
                currentDish.setName(name);
                currentDish.setDescription(description);
                currentDish.setPrice(price);
                currentDish.setType(type);
                currentDish.setIngredients(ingredients);
                if (filename != null && !filename.isEmpty()) {
                    currentDish.setPicture(filename);
                } else {
                    // Giữ lại ảnh cũ nếu không có tệp mới được tải lên
                    currentDish.setPicture(currentDish.getPicture());
                }

                // Cập nhật món ăn trong cơ sở dữ liệu
                boolean isUpdated = dishManager.updateDish(currentDish);

                // Thiết lập thông báo kết quả
                if (isUpdated) {
                    request.setAttribute("message", "Dish updated successfully!");
                } else {
                    request.setAttribute("message", "Failed to update dish. Please try again.");
                }
            } else {
                request.setAttribute("message", "Dish not found.");
            }
        } else {
            request.setAttribute("message", "Invalid dish ID.");
        }

        // Chuyển tiếp đến trang xác nhận kết quả
        request.getRequestDispatcher("DinerMainPage.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Update Dish Servlet";
    }
}
