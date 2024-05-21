<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Personal Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f4f4f4;
            }
            h1 {
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            a {
                text-decoration: none;
                color: #007bff;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Your Information</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Profile Picture</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sh" items="${Acc}">
                    <!-- set up a link for each account -->
                    <c:url var="temp" value="ShipServlet">
                        <c:param name="command" value="LOAD"/>
                        <c:param name="Id" value="${sh.account_id}"/>
                    </c:url>
                    <tr>
                        <td>${sh.account_id}</td>
                        <td>${sh.name}</td>
                        <td>${sh.email}</td>
                        <td>${sh.phoneNumber}</td>
                        <td>${sh.address}</td>
                        <td>
                            <img src="${sh.profile_picture}" alt="Profile Picture" width="50" height="50"/>
                        </td>
                        <td><a href="${temp}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
