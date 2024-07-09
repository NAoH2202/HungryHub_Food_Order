<%@page import="java.util.ArrayList"%>
<%@page import="model.Provinces"%>
<%@page import="model.DistrictsManager"%>
<%@page import="model.Districts"%>
<%@page import="model.ProvincesManager"%>
<%@page import="java.util.Map"%>
<%@page import="model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nhập Địa Chỉ Khách Hàng</title>
        <style>
            .boddy {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                background-color: #DDDDDD;
            }
            .container_address {
                width: 50%;
                margin: 50px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #f9f9f9;
            }
            h2 {
                text-align: center;
            }
            .form-group-address {
                margin-bottom: 40px;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"], select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            function updateDistricts() {
                var citySelect = document.getElementById("city");
                var selectedCityId = citySelect.value;

                // Xóa các option cũ trong select quận/huyện
                var districtSelect = document.getElementById("district");
                while (districtSelect.options.length > 1) {
                    districtSelect.remove(1);
                }

                // Gọi Ajax để lấy danh sách quận/huyện dựa trên tỉnh/thành phố đã chọn
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'GetDistrictsServlet?provinceId=' + selectedCityId, true);
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var districts = JSON.parse(xhr.responseText);

                        // Thêm các option mới vào select quận/huyện
                        districts.forEach(function (district) {
                            var option = document.createElement('option');
                            option.value = district.id;
                            option.textContent = district.name;
                            districtSelect.appendChild(option);
                        });
                    } else {
                        console.error('Error fetching districts. Status:', xhr.status);
                    }
                };
                xhr.onerror = function () {
                    console.error('Request failed');
                };
                xhr.send();
            }
        </script>
    </head>
    <body>
        <jsp:include page="path/header.jsp"/>
        <div class="boddy">
            <div class="container_address">
                <h2>Nhập Địa Chỉ Khách Hàng</h2>
                <form action="UpdateAddressServlet" method="post">
                    <%-- Kiểm tra đăng nhập --%>
                    <% if (request.getSession().getAttribute("account") == null) {
                            response.sendRedirect("LoginServlet");
                            return;
                    } %>

                    <%-- Lấy thông tin tài khoản --%>
                    <% Account account = (Account) request.getSession().getAttribute("account"); %>

                    <%-- Khởi tạo ProvincesManager và DistrictsManager --%>
                    <% ProvincesManager provincesManager = new ProvincesManager(); %>
                    <% DistrictsManager districtsManager = new DistrictsManager(); %>

                    <%-- Lấy danh sách tỉnh/thành phố --%>
                    <% ArrayList<Provinces> provincesList = provincesManager.getList(); %>

                    <%-- Xử lý yêu cầu order --%>
                    <% if ("true".equals(request.getParameter("order"))) {%>
                    <input type="hidden" name="order" value="<%=request.getParameter("order")%>">
                    <% } %>

                    <div class="form-group-address">
                        <label for="city">Thành Phố:</label>
                        <select id="city" name="city" onchange="updateDistricts()" required>
                            <option value="">Chọn Thành Phố</option>
                            <%-- Hiển thị danh sách tỉnh/thành phố --%>
                            <% for (Provinces entry : provincesList) {%>
                            <option value="<%= entry.getId()%>"><%= entry.getName()%></option>
                            <% }%>
                        </select>
                    </div>

                    <div class="form-group-address">
                        <label for="district">Quận/Huyện:</label>
                        <select id="district" name="district" required>
                            <option value="">Chọn Quận/Huyện</option>
                            <%-- Option quận/huyện sẽ được thêm bằng JavaScript --%>
                        </select>
                    </div>

                    <div class="form-group-address">
                        <label for="postalCode">Xã/Thị trấn - địa chỉ nhà:</label>
                        <input type="text" id="postalCode" name="address" value="<%= account.getAddress()%>" required>
                    </div>

                    <input type="submit" value="Gửi">
                </form>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>
