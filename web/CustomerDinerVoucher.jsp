<%-- 
    Document   : CustomerDinerVoucher
    Created on : Jul 20, 2024, 10:44:49 PM
    Author     : lenovo
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="util.Datetime"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.VoucherManager"%>
<%@page import="model.Voucher"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher page</title>
        <style>
            .body_local {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
            }

            .header_local {
                background-color: #EEEE00;
                border-radius: 10px 10px 0 0;
                color: white;
                text-align: center;
                padding: 1rem 0;
            }

            h1 {
                margin: 0;
            }


            .voucher-container {
                display: flex;
                flex-wrap: wrap;
                /*gap: 1rem;*/
                justify-content: center;
            }

            .voucher-card {
                background: #FFFFCC;
                border-radius: 8px;
                margin: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                width: 900px;
                display: flex;
                align-items: center;
                transition: transform 0.3s ease;
            }

            .voucher-card:hover {
                transform: scale(1.05);
                cursor: pointer;
            }

            .voucher-image-container {
                width: 120px;
                height: 120px;
                margin: 10px;
                flex-shrink: 0;
            }

            .voucher-image {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
            }

            .voucher-info {
                padding: 1rem;
                flex: 1;
            }

            .voucher-title {
                font-size: 1.5rem;
                margin: 0 0 0.5rem;
            }

            .voucher-description {
                margin: 0 0 1rem;
            }

            .voucher-dates {
                color: #888;
                font-size: 0.9rem;
            }
            .container_voucher{
                background-color: white;
                border-radius: 10px;
                margin-top: 30px;
                margin-bottom: 30px;
                width: 70%;
                min-width: 800px;
                max-width: 1200px;
            }
            .back-arrow {
                font-size: 20px;
                cursor: pointer;
                color: black;
            }

            .back-arrow span:hover {
                color: blue;
            }

            .back-arrow span {
                margin-left: 8px;
            }
            .back{
                width: 100%;
                background-color: #f4f4f4;
            }
            .a_voucher{
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="path/header.jsp"/>
        <%
            if (request.getParameter("dinerId") == null) {
                response.sendRedirect("HomePage");
                return;
            }
            int dinerId = Integer.parseInt(request.getParameter("dinerId"));
            VoucherManager vm = new VoucherManager();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            ArrayList<Voucher> vList = vm.getVouchersByDinerId(dinerId);
            boolean check = request.getParameter("check").equalsIgnoreCase("true");
        %>
        <div class="back"><a href=<%= check ? "OrderConfirmationPage" : "CustomerDinerPage?id="+dinerId%> class="back-arrow">&#8592; <span>Quay lại</span></a></div>
        <div class="body_local">
            <div class="container_voucher">
                <div class="header_local">
                    <h1 style="font-family: sans-serif;">Danh Sách Voucher</h1>
                </div>
                <main>
                    <section class="voucher-container">
                        <%

                            for (Voucher voucher : vList) {
                                if (!LocalDateTime.now().isAfter(Datetime.convertToLocalDateTime(voucher.getValid_to()))) {

                        %>
                        <form action="<%= check ? "SaveVoucherToSessionServlet" : "#"%>" id="voucherForm" method="post">
                            <input type="hidden" name="dinerId" value="<%= dinerId %>" >
                            <input type="hidden" name="voucherId" value="<%= voucher.getVoucher_id()%>" >
                            <input type="hidden" name="code" value="<%= voucher.getCode()%>" >
                            <article class="voucher-card" onclick=<%= check ? "submitForm()" : ""%>>
                                <div class="voucher-image-container">
                                    <img src="images/voucherPicture.jpg" alt="Voucher 1" class="voucher-image">
                                </div>
                                <div class="voucher-info">
                                    <h2 class="voucher-title" style="font-family: sans-serif">Voucher Giảm Giá <%= voucher.getDiscount_percentage()%> %</h2>
                                    <p class="voucher-description">Nhận giảm giá <%= voucher.getDiscount_percentage()%> % bằng Mã: <strong><%= voucher.getCode()%></strong></p>
                                    <p class="voucher-dates">Thời gian: <%= Datetime.convertToLocalDateTime(voucher.getValid_from()).format(formatter)%> - <%= Datetime.convertToLocalDateTime(voucher.getValid_to()).format(formatter)%></p>
                                </div>
                            </article>
                        </form>
                        <%
                                }
                            }%>
                        <!-- Thêm nhiều voucher-card khác nếu cần -->
                    </section>
                </main>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
        <script>
            function submitForm() {
                // Gửi form khi nhấp vào voucher-card
                document.getElementById('voucherForm').submit();
            }
        </script>
    </body>
</html>
