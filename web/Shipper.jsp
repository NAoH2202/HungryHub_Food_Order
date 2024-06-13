<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="model.AccountManager"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

    <title>Account Information</title>

    <!-- Loading third party fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:300,400,700|" rel="stylesheet" type="text/css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Loading main css file -->
    <link rel="stylesheet" href="style.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f0f2f5; /* Màu n?n */
        }

        .profile-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-right: 20px;
        }

        .profile-header h1 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        .profile-header p {
            color: #666;
            margin: 5px 0 0;
        }

        .profile-info {
            margin-bottom: 20px;
        }

        .profile-info p {
            margin: 5px 0;
            color: #666;
        }

        .profile-info p span {
            font-weight: bold;
            color: #333;
        }

        .profile-actions {
            margin-top: 20px;
        }

        .profile-actions button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .profile-actions button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <%
            Account acc = (Account) request.getSession().getAttribute("account");
            AccountManager am = new AccountManager();
            Account account = am.getAccountById(acc.getAccount_id());
            if (account == null) {
                response.sendRedirect("ShipperPage");
            }
            int id = account.getAccount_id();
            String name = account.getName();
            String phone = account.getPhoneNumber();
            String email = account.getEmail();
            String adds = account.getAddress();
            
        %>
    <div class="profile-container">
        <div class="profile-header">
            <img src="avt/<%=account.getProfile_picture()%>" alt="Profile Picture">
            <div>
                <h1><%=name%></h1>
                <p>Email: <%=email%></p>
                <p>Phone Number: <%=phone%></p>
                <p>Address: <%=adds%></p>
            </div>
        </div>
        
        <div class="profile-info">
            <p><span>ID:</span> <%=id%></p>
        </div>

        <div class="profile-actions">
            <form action="UpdateAccountServlet" method="post" enctype="multipart/form-data">
                <button type="submit">Edit Profile</button>
            </form>
            <form action="changePassword.jsp">
                <button type="submit">Change Password</button>
            </form>
        </div>
    </div>
</body>
</html>