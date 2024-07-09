<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add New Dish</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f8f9fa;
            }
            .form-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-box {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                max-width: 400px;
                width: 100%;
            }
            .form-box h2 {
                margin-bottom: 20px;
                text-align: center;
            }
            .form-box input, .form-box textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .form-box button {
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-box button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="path/dinerheader.jsp"/>
        <!-- End header section -->
        <div class="form-container">
            <div class="form-box">
                <h2>Add New Dish</h2>
                <form action="AddNewDishServlet" method="post" enctype="multipart/form-data">
                    <input type="text" name="name" placeholder="Dish Name" required />
                    <input type="number" name="price" placeholder="Dish Price" step="0.01" required />
                    <!--            <input type="text" name="image" placeholder="Dish Image URL" required />-->
                    <input type="file" name="image" accept="image/*" accept=".png, .jpg" required />   
                    <input type="text" name="type" placeholder="Dish Type" required />
                    <textarea name="description" placeholder="Dish Description" rows="3"></textarea>
                    <textarea name="ingredients" placeholder="Dish Ingredients" rows="3"></textarea>
                    <button type="submit">Add Dish</button>
                </form>
            </div>
        </div>
        <!-- Include footer -->
        <jsp:include page="path/footer.jsp"/>
        <!-- End footer section -->
    </body>
</html>
