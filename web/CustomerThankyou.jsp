<%@page import="model.Order"%>
<%@page import="model.Account"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thank You for Your Order</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }
        .thank-you-card {
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            background-color: #fff;
        }
        .thank-you-card h1 {
            font-size: 2.5em;
            color: #333;
        }
        .thank-you-card p {
            font-size: 1.2em;
            color: #666;
        }
        .btn-home {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn-home:hover {
            background-color: #0056b3;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div>
    <!-- Include header -->
    <jsp:include page="path/header.jsp"/>
    <!-- End header section -->
</div>
<%
    if (request.getSession().getAttribute("account") == null) {
        response.sendRedirect("LoginServlet");
        return;
    }
    Account account = (Account) request.getSession().getAttribute("account");
    Order order = (Order) request.getSession().getAttribute("order");
%>
<div action="UpdatePaymentStatusServlet" method="post" class="center-container">
    <div class="thank-you-card">
        <h1>Cảm ơn bạn, <%= account.getName() %>!</h1>
        <p>Đơn hàng của bạn đã được đặt thành công. Chúng tôi sẽ xử lý đơn hàng của bạn sớm nhất có thể.</p>
        <form >
            <input type="hidden" name="orderId" value="<%= order.getOrder_id()%>">
            <input type="hidden" name="vnp_Amount" value="<%= request.getParameter("vnp_Amount") %>">
            <input type="hidden" name="vnp_BankCode" value="<%= request.getParameter("vnp_BankCode") %>">
            <!-- Các trường hidden khác nếu có -->
            <button type="submit" class="btn-home">Xem lịch sử đơn hàng</button>
        </form>
    </div>
</div>
<div>
    <!-- Include footer -->
    <jsp:include page="path/footer.jsp"/>
    <!-- End footer section -->
</div>
</body>
</html>
