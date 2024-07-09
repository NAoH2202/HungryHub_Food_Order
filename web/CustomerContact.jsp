<%-- 
    Document   : CustomerContact
    Created on : Jul 9, 2024, 5:47:18 PM
    Author     : lenovo
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông Tin Liên Hệ</title>
        <link rel="stylesheet" href="css/contact.css">
    </head>
    <body>
        <%
            Account acc = (Account) session.getAttribute("account");
            if (acc == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
        %>
        <jsp:include page="path/header.jsp"/>
        <div class="contact-container">
            <h1>Thông Tin Liên Hệ</h1>
            <p>Liên hệ với chúng tôi nếu bạn cần trợ giúp</p>
            <form action="/submit" method="post">
                <div class="form-group">
                    <label for="subject">Chủ đề *</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="message">Tin nhắn *</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                <div class="form-group captcha">
                    <div class="g-recaptcha" data-sitekey="your-site-key"></div>
                </div>
                <div class="button-container">
                    <button type="submit">Gửi</button>
                </div>
            </form>
        </div>
        <jsp:include page="path/footer.jsp"/>
    </body>
</html>