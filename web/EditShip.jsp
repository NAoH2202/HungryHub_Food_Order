<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>

    </head>
    <body>


        <div id="container">
            <h1>Edit a Shipper</h1>
            <hr>
            <form action="shipServlet" method="GET">
                <input type="hidden" name="command" value="EDIT">
                <input type="hidden" name="ContactId" value="${Ac.id}">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID</td>
                            <td><input type="text" name="id" value="${Ac.getAccount_id()}" disabled></td>
                        </tr>

                        <tr>
                            <td>Name:</td>
                            <td><input type="text" name="firstName" value="${Ac.getName()}"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" name="lastName" value="${Ac.getEmail()}"></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><input type="number" name="phoneNumber" value="${Ac.getPhoneNumber()}"></td>
                        </tr>
                          <tr>
                            <td>Address</td>
                            <td><input type="number" name="phoneNumber" value="${Ac.getAddress()}"></td>
                        </tr>
                            <tr>
                            <td>profile_picture</td>
                            <td><input type="number" name="phoneNumber" value="${Ac.getprofile_picture()}"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="Edit" class="save" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <form action="shipServlet" method="GET">
            <input type="hidden" name="command" value="VIEW">
            <input type="submit" value="Back">
        </form>
    </body>
</html>
