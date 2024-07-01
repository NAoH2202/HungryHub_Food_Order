<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Voucher</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- Custom styles -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
          
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        .btn-secondary {
            margin-left: 10px;
        }
    </style>
</head>
<body>
            <div>
            <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
        </div>
    <div class="container">
        <h1>Edit Voucher</h1>
        
        <%-- Lấy voucher từ request attribute --%>
        <% Voucher voucher = (Voucher) request.getAttribute("voucher"); %>
        
        <%-- Kiểm tra nếu voucher không null thì hiển thị thông tin --%>
        <% if (voucher != null) { %>
            <form action="UpdateVoucherServlet" method="post">
                <input type="hidden" name="voucherId" value="<%= voucher.getVoucher_id() %>">
                <div class="form-group">
                    <label for="code">Code:</label>
                    <input type="text" class="form-control" id="code" name="code" value="<%= voucher.getCode() %>" required>
                </div>
                <div class="form-group">
                    <label for="discount">Discount (%):</label>
                    <input type="number" class="form-control" id="discount" name="discount" value="<%= voucher.getDiscount_percentage() %>" required>
                </div>
                <div class="form-group">
                    <label for="validFrom">Valid From:</label>
                    <input type="date" class="form-control" id="validFrom" name="validFrom" value="<%= voucher.getValid_from() %>" required>
                </div>
                <div class="form-group">
                    <label for="validTo">Valid To:</label>
                    <input type="date" class="form-control" id="validTo" name="validTo" value="<%= voucher.getValid_to() %>" required>
                </div>
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="VoucherPage" class="btn btn-secondary">Cancel</a>
            </form>
        <% } else { %>
            <p>Voucher not found or invalid.</p>
        <% } %>
    </div>
     <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->
    <!-- Bootstrap JS and jQuery (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvOHOhE4EJel" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+7DlxFPIhsjVfDOCJq4Q/lWkZf8SrmfY6S+" crossorigin="anonymous"></script>
</body>
</html>
