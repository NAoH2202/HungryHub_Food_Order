<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shipper Orders</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #DDDDDD; /* Light gray background */
            color: #333; /* Default text color */
            margin: 0;
            padding: 0;
            position: relative;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group label {
            font-size: 24px; /* Increase font size */
            margin-right: 10px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 80px; /* Increase width for labels */
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #4CAF50;
        }

        input:checked + .slider:before {
            transform: translateX(46px); /* Adjust for label spacing */
        }

        .slider:after {
            content: 'Off';
            color: white;
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 70%; /* Position inside the slider */
            font-size: 14px;
        }

        input:checked + .slider:after {
            content: 'On';
            left: 30%; /* Adjust position for 'On' label */
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button-container form {
            display: inline-block;
        }

        .button-container input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button-container input[type="submit"]:hover {
            background-color: #218838;
        }

        .button-container input[type="submit"]:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .header {
            display: flex;
            align-items: center;
            padding: 40px;
            background-color: #8bc34a;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header img {
            height: 50px;
        }

    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        function updateButtonState() {
            if ($('#toggle-active').is(':checked')) {
                $('input[type="submit"]').prop('disabled', false);
            } else {
                $('input[type="submit"]').prop('disabled', true);
            }
        }

        $('#toggle-active').change(function () {
            updateButtonState();
        });

        // Initial state update
        updateButtonState();
    });
</script>

<body>
    <div class="header">
           <a href="ShipperPage" style="text-decoration: none; color: #ff6347; font-family: 'Roboto', sans-serif; font-size: 20px; font-weight: bold;">
    HungryHub</a>
        <a href="AccountPage" class="order_online" style="position: absolute; top: 10px; right: 60px; font-size: 30px;">
            <i class="fas fa-user"></i>
        </a>
        <a href="#" class="notification" style="position: absolute; top: 10px; right: 20px; font-size: 30px; color: yellow;">
            <i class="fas fa-bell"></i>
        </a>
    </div>
    <h1 style="font-size: 36px; line-height: 42px;">ARE YOU READY!!</h1>
    <h1 style="font-size: 20px; line-height: 42px; color: #4CAF50;">SAFE, FAST and GOOD LUCK</h1>
    <div class="container">
        <div class="form-group">
            <label for="toggle-active">Active state:</label>
            <label class="switch">
                <input type="checkbox" id="toggle-active" checked>
                <span class="slider"></span>
            </label>
        </div>

        <div class="button-container">
            <form action="OrderItemServlet" method="GET">
                <input type="hidden" name="command" value="LIST">
                <input type="submit" value="View Order">
            </form>
        </div>
    </div>
</body>
</html>
