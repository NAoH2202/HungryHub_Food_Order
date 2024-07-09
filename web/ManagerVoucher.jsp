<%@page import="model.Voucher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.VoucherManager"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">

        <title> HungryHub - Voucher Management </title>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f8f9fa;
            }

            .container {
                margin-top: 20px;
            }

            .back-link {
                display: block;
                margin-bottom: 10px;
                text-decoration: none;
                color: #007bff;
            }

            .back-link:hover {
                color: #0056b3;
            }

            .voucher-detail {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .voucher-detail h3, .voucher-detail p {
                margin-bottom: 20px;
            }

            .voucher-list {
                margin-top: 20px;
            }

            .btn {
                margin-top: 10px;
            }

            .btn-add {
                background-color: #28a745;
                color: white;
            }

            .btn-add:hover {
                background-color: #218838;
            }

            .btn-edit {
                background-color: #ffc107;
                color: white;
            }

            .btn-edit:hover {
                background-color: #e0a800;
            }

            .btn-delete {
                background-color: #dc3545;
                color: white;
            }

            .btn-delete:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
        <div class="container">
            

            <%
                Account account = (Account) session.getAttribute("account");
                if (account == null || !"dinermanager".equalsIgnoreCase(account.getRole())) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                // Lấy hoặc tạo một instance duy nhất của VoucherManager
                VoucherManager vm = (VoucherManager) application.getAttribute("voucherManager");
                if (vm == null) {
                    vm = new VoucherManager();
                    application.setAttribute("voucherManager", vm);
                }

                int id = account.getAccount_id();
                ArrayList<Voucher> listVoucher = vm.getVouchersByDinerId(id);
            %>

            <a href="index.jsp" class="back-link">BACK</a>
            <div class="voucher-detail">
                <h2>Voucher Management</h2>

                <!-- Add Voucher Button -->
                <form action="AddVoucherPage" method="post" class="mb-4">
                    <button type="submit" class="btn btn-add">Add Voucher</button>
                </form>

                <!-- Voucher List -->
                <div class="voucher-list">
                    <table class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
<!--                                <th scope="col">ID voucher</th>-->
                                <th scope="col">Code</th>
                                <th scope="col">Discount (%)</th>
                                <th scope="col">Valid From</th>
                                <th scope="col">Valid To</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Voucher v : listVoucher) {
                            %>
                            <tr>
<!--                                <td><%= v.getVoucher_id() %></td>-->
                                <td><%= v.getCode() %></td>
                                <td><%= v.getDiscount_percentage() %></td>
                                <td><%= v.getValid_from() %></td>
                                <td><%= v.getValid_to() %></td>
                                <td>
                                    <button class="btn btn-edit" onclick="editVoucher('<%= v.getVoucher_id() %>')">Edit</button>
                                    <button class="btn btn-delete" onclick="deleteVoucher('<%= v.getVoucher_id() %>')">Delete</button>
                                    <!-- Form for editing voucher -->
                                    <form id="editForm_<%= v.getVoucher_id() %>" action="EditVoucherPage" method="post">
                                        <input type="hidden" name="voucherId" value="<%= v.getVoucher_id() %>">
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->

        <!-- jQuery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- Your other JavaScript imports here -->
        <script>
            function deleteVoucher(voucherId) {
                if (confirm("Are you sure you want to delete this voucher?")) {
                    $.ajax({
                        type: "POST",
                        url: "DeleteVoucherServlet", // URL of the servlet that handles deletion
                        data: {
                            voucherId: voucherId
                        },
                        success: function (response) {
                            // Handle successful response
                            console.log("Voucher deleted successfully.");
                            location.reload(); // Reload the page or update the UI as needed
                        },
                        error: function (xhr, status, error) {
                            // Handle error
                            console.error("Error deleting voucher:", error);
                            alert("Failed to delete voucher. Please try again later.");
                        }
                    });
                }
            }

            function editVoucher(voucherId) {
                document.getElementById('editForm_' + voucherId).submit();
            }
        </script>
    </body>
</html>
