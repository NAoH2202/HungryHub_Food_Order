<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Dish</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
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
            padding: 20px;
        }
        .form-box {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 500px;
            width: 100%;
        }
        .form-box h2 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 1.5rem;
            color: #333;
        }
        .form-box .form-group {
            margin-bottom: 1rem;
        }
        .form-box .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        .form-box .form-control-file {
            padding: 0;
        }
        .form-box .checkbox-label {
            
            color: #666;
            margin-left: 10px;
        }
        .form-box .form-check-input {
            width: 20px; /* Kích thước checkbox */
            height: 20px; /* Kích thước checkbox */
            margin-top: 0.3rem; /* Căn giữa checkbox với label */
        }
        .form-box button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
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
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Dish Name" required />
                </div>
                <div class="form-group">
                    <input type="number" name="price" class="form-control" placeholder="Dish Price" step="0.01" required />
                </div>
                <div class="form-group">
                    <input type="file" name="image" class="form-control-file" accept="image/*" required />
                </div>
                <div class="form-group">
                    <input type="text" name="type" class="form-control" placeholder="Dish Type" required />
                </div>
                <div class="form-group">
                    <textarea name="description" class="form-control" placeholder="Dish Description" rows="3"></textarea>
                </div>
                <div class="form-group">
                    <textarea name="ingredients" class="form-control" placeholder="Dish Ingredients" rows="3"></textarea>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" name="dislocal" id="dislocal" class="form-check-input" />
                    <label for="dislocal" class="form-check-label checkbox-label">Cannot deliver outside the city</label>
                </div>
                <button type="submit">Add Dish</button>
            </form>
        </div>
    </div>
    <!-- Include footer -->
    <jsp:include page="path/footer.jsp"/>
    <!-- End footer section -->
</body>
</html>
