<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Voucher</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            margin: 20px; /* Thêm kho?ng cách ?? tránh sát mép màn hình */
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        header, footer {
            width: 100%;
            background-color: #343a40;
            color: white;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <!-- Include header -->
    <header>
        <jsp:include page="path/dinerheader.jsp"/>
    </header>
    <!-- End header section -->

    <div class="form-container">
        <h2 class="form-title">Add Voucher</h2>
        <form action="AddVoucherServlet" method="post">
            <div class="form-group">
                <label for="code">Voucher Code</label>
                <input type="text" class="form-control" id="code" name="code" required>
            </div>
            <div class="form-group">
                <label for="discount_percentage">Discount Percentage</label>
                <input type="number" step="0.01" class="form-control" id="discount_percentage" name="discount_percentage" required>
            </div>
            <div class="form-group">
                <label for="valid_from">Valid From</label>
                <input type="date" class="form-control" id="valid_from" name="valid_from" required>
            </div>
            <div class="form-group">
                <label for="valid_to">Valid To</label>
                <input type="date" class="form-control" id="valid_to" name="valid_to" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Add Voucher</button>
        </form>
    </div>

    <!-- Include footer -->
    <footer>
        <jsp:include page="path/footer.jsp"/>
    </footer>
    <!-- End footer section -->

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
