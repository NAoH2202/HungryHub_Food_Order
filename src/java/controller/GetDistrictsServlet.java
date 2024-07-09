/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import model.Districts;
import model.DistrictsManager;

@WebServlet("/GetDistrictsServlet")

public class GetDistrictsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        int provinceId = Integer.parseInt(request.getParameter("provinceId"));

        // Xử lý logic để lấy danh sách quận/huyện từ DistrictsManager
        DistrictsManager districtsManager = new DistrictsManager();
        ArrayList<Districts> districtsList = districtsManager.getDistrictByProvinces(provinceId);

        // Chuyển đổi danh sách thành JSON và gửi về client
        String json = gson.toJson(districtsList);
        out.print(json);
        out.flush();
    }
}
