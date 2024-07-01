<%@ page import="model.Dish" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Dish</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link href="css/style.css" rel="stylesheet" />
    <style>
        .edit-dish-container {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: #f9f9f9;
            margin-top: 20px;
        }
        .h1{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Chiều cao đầy đủ màn hình để dễ căn giữa theo chiều dọc */
            text-align: center; /* Căn giữa theo chiều ngang */
        }
    </style>
</head>
<body>
      <!-- Include header -->
            <jsp:include page="path/header.jsp"/>
            <!-- End header section -->
    <div class="container">
        <h1>Edit Dish</h1>
        <%
            Dish dish = (Dish) request.getAttribute("dish");
            if (dish != null) {
        %>
        <div class="edit-dish-container">
            <form action="UpdateDishServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="dishId" value="<%= dish.getDish_id() %>">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= dish.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="picture">Picture:</label>
                    <input type="file" class="form-control-file" id="picture" name="picture" accept=".png, .jpg">
                    <img src="<%= dish.getPicture() %>" alt="Dish Image" style="width:100px;height:100px;">
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" required><%= dish.getDescription() %></textarea>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" id="price" name="price" value="<%= dish.getPrice() %>" required>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <input type="text" class="form-control" id="type" name="type" value="<%= dish.getType() %>" required>
                </div>
                <div class="form-group">
                    <label for="ingredients">Ingredients:</label>
                    <textarea class="form-control" id="ingredients" name="ingredients" required><%= dish.getIngredients() %></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Update Dish</button>
            </form>
        </div>
        <% 
            } else {
        %>
        <p>Dish not found. Please check the dish ID and try again.</p>
        <%
            }
        %>
    </div>
    <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->

</body>
</html>
