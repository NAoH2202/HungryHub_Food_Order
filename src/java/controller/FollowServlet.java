/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet("/follow")
public class FollowServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ yêu cầu Ajax
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        String data = buffer.toString();
        JsonObject jsonObject = new Gson().fromJson(data, JsonObject.class);
        String action = jsonObject.get("action").getAsString();

        // Giả sử bạn có đối tượng người dùng hiện tại (currentUser) và ID của cửa hàng (storeId)
        // Kiểm tra xem người dùng đã follow cửa hàng hay chưa
//        boolean isFollowed = checkIfUserFollowed(currentUser, storeId);

//        if ("follow".equals(action) && !isFollowed) {
            // Thực hiện follow: cập nhật cơ sở dữ liệu để thêm người dùng vào danh sách theo dõi của cửa hàng
//            followStore(currentUser, storeId);
//        } else if ("unfollow".equals(action) && isFollowed) {
            // Thực hiện unfollow: cập nhật cơ sở dữ liệu để xóa người dùng khỏi danh sách theo dõi của cửa hàng
//            unfollowStore(currentUser, storeId);
//        }

        // Trả về phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\"}");
    }

    private boolean checkIfUserFollowed(Account user, int storeId) {
        // Kiểm tra xem người dùng đã follow cửa hàng chưa
        // Hàm này cần được triển khai theo cơ sở dữ liệu và logic của bạn
        return false; // Giả sử chưa follow
    }

    private void followStore(Account user, int storeId) {
        // Thực hiện logic để thêm người dùng vào danh sách theo dõi của cửa hàng
    }

    private void unfollowStore(Account user, int storeId) {
        // Thực hiện logic để xóa người dùng khỏi danh sách theo dõi của cửa hàng
    }
}

