/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.CartItem;
import model.CartItemDao;
import model.CartItemManager;
import model.Dish;
import model.DishManager;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        JsonObject jsonResponse = new JsonObject();
        if (request.getSession().getAttribute("account") == null) {
                jsonResponse.addProperty("status", "notLoginYet");
                jsonResponse.addProperty("message", "Bạn phải đăng nhập để có thể thực hiện thành động này");
                response.setContentType("application/json");
                response.getWriter().write(jsonResponse.toString());
                return;
        }
        DishManager dm = new DishManager();
        Account account = (Account)request.getSession().getAttribute("account");
        int dishId = Integer.parseInt(request.getParameter("id"));
        Dish dish = dm.getDishById(dishId);
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        CartItemDao.addCartItem(new CartItem(0,account, dish, quantity));
        
        CartItemManager cim = new CartItemManager();
        ArrayList<CartItem> ciList = cim.getCartItemByAccountId(account.getAccount_id());
        ArrayList<Account> dinerList = getUniqueDinersFromCartItems(ciList);
        ArrayList<CartItem> ciListByDiner;
        String newCartItemsHTML ="";
        for(Account diner : dinerList){
            newCartItemsHTML += "<h3 class=\"cart-title\">"+ diner.getName() +"</h3> \n";
            ciListByDiner = getCartItemsByDiner(diner.getAccount_id(), ciList);
            for(CartItem ci : ciListByDiner){
                newCartItemsHTML += "<div class=\"cart-item-dish\">\n" +
"                        <img src=\""+ ci.getDish().getPicture() +"\" alt=\"Product Image\">\n" +
"                        <div>\n" +
"                            <p>"+ ci.getDish().getName() +"</p>\n" +
"                            <p><strong>Số lượng:</strong> "+ ci.getQuantity() +" - <strong>Giá:</strong> "+ ci.getDish().getPrice()*ci.getQuantity() +" VNĐ</p>\n" +
"                        </div>\n" +
"                        <button class=\"btn_delete_cartitem\" onclick=\"RemoveCart("+ci.getCartitemId()+")\">Xóa</button>\n"+
"                    </div>";
            }
        }
        // Trả về thông tin cập nhật của giỏ hàng dưới dạng JSON


        // Gửi lại nội dung HTML như phản hồi
        PrintWriter out = response.getWriter();
        out.print(newCartItemsHTML);
        out.flush();
    }

    public static ArrayList<Account> getUniqueDinersFromCartItems(ArrayList<CartItem> cartItems) {
        Set<Account> uniqueAccounts = new HashSet<>();

        for (CartItem cartItem : cartItems) {
            Dish dish = cartItem.getDish();
            if (dish != null) {
                Account account = dish.getAccount();
                if (account != null) {
                    uniqueAccounts.add(account);
                }
            }
        }

        return new ArrayList<>(uniqueAccounts);
    }
    public static ArrayList<CartItem> getCartItemsByDiner(int id,ArrayList<CartItem> cartItems) {
        ArrayList<CartItem> ciList = new ArrayList<>();
        for (CartItem facc : cartItems) {
            if (id == facc.getDish().getAccount().getAccount_id()) {
                ciList.add(facc);
            }
        }
        return ciList;
    }
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
