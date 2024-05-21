<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Shipper Orders</title>
</head>
<body>
    <h1>Index Page</h1>
    
                Active state:
            <select name="groupId" >
                <option value="1">On</option>
                <option value="2">Off</option>
                 
            </select><br>
    
    <div class="button-container">
        <form action="OrderItemServlet" method="GET">
            <input type="hidden" name="command" value="LIST">
            <input type="submit" value="View Oder">
        </form>
         <form action="ShipServlet" method="POST">
            <input type="hidden" name="command" value="VIEW">
            <input type="hidden" name="accountId" value="your_account_id_here">  
            <input type="submit" value="View Information">
        </form>
    </div>

     
</body>
</html>