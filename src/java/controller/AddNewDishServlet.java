package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Dish;
import model.DishManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet to handle adding a new dish with image upload.
 */
@WebServlet(name = "AddNewDishServlet", urlPatterns = {"/AddNewDishServlet"})
@MultipartConfig
public class AddNewDishServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Initialize variables for form data
            String name = null;
            int price = 0;
            String type = null;
            String description = null;
            String ingredients = null;
            String picture = null;
            boolean dislocal = false;

            // Get current logged-in account from session
            HttpSession session = request.getSession();
            Account currentAccount = (Account) session.getAttribute("account");

            // Ensure current account is valid
            if (currentAccount != null) {
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Set the directory used to temporarily store files that are larger than the configured size threshold
                String tempDir = System.getProperty("java.io.tmpdir");
                factory.setRepository(new File(tempDir));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                List<FileItem> items = upload.parseRequest(request);

                // Process each form field
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process regular form fields
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("UTF-8");
                        switch (fieldName) {
                            case "name":
                                name = fieldValue;
                                break;
                            case "price":
                                price = Integer.parseInt(fieldValue);
                                break;
                            case "type":
                                type = fieldValue;
                                break;
                            case "description":
                                description = fieldValue;
                                break;
                            case "ingredients":
                                ingredients = fieldValue;
                                break;
                                 case "dislocal":
                                dislocal = "on".equals(fieldValue); // Checkbox value is "on" if checked
                                break;
                        }
                    } else {
                        // Process uploaded file (image)
                        String fileName = Paths.get(item.getName()).getFileName().toString();
                        String extension = fileName.substring(fileName.lastIndexOf('.'));
                        String newFileName = currentAccount.getAccount_id() + "_" + System.currentTimeMillis() + extension;

                        // Specify the directory to save uploaded files
                        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdir();
                        }

                        // Save the file to the server
                        String filePath = uploadPath + File.separator + newFileName;
                        File storeFile = new File(filePath);
                        item.write(storeFile);

                        // Set the picture path to be stored in database
                        picture = UPLOAD_DIRECTORY + "/" + newFileName;
                    }
                }

                // Create a new Dish object with the parsed data
//                Dish newDish = new Dish(0, currentAccount, name, picture, description, price, type, ingredients);
                Dish newDish = new Dish(0, currentAccount, name, picture, description, price, picture, type, ingredients, dislocal);
                // Add the new dish to the database
                DishManager dishManager = new DishManager();
                dishManager.addDish(newDish);

                // Redirect to a success page or home page after adding the dish
                response.sendRedirect("DinerPage");

            } else {
                // Redirect to an error page if account is not found in session
                response.sendRedirect("error.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            // Redirect to an error page if an exception occurs
            response.sendRedirect("error.jsp");
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
        return "Servlet to handle adding a new dish with image upload.";
    }
}
