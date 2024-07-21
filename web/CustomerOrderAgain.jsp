<%-- 
    Document   : CustomerOrderAgain
    Created on : Jul 15, 2024, 7:57:46 PM
    Author     : lenovo
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.AbstractMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Dish,model.DishManager, model.DishDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.OrderItemManager, model.OrderItem, model.OrderItemDao"%>
<%@page import="model.OrderManager, model.Order, model.OrderDao"%>
<%@page import="model.Account, model.AccountManager, model.AccountDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Đơn Hàng Thức Ăn</title>
        <style>
            .body_local {
                font-family: Arial, sans-serif;
                background-color: #DDDDDD;
                margin: 0;
                padding: 20px;
            }
            .container_local2 {
                max-width: 800px;
                margin: auto;
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .order-info {
                margin: 20px 0;
            }
            .order-info h2 {
                color: #555;
            }
            .order-item {
                display: flex;
                align-items: center;
                padding: 10px 0;
            }
            .item_container{
                display: flex;
                justify-content: space-between;
                width: 100%;
                margin-bottom: 20px;
                border-bottom: 1px solid #eaeaea;
            }
            .order-item img {
                width: 100px;
                height: 100px;
                border-radius: 8px;
                margin-right: 20px;
            }
            .item-details {
                flex-grow: 1;
            }
            .item-name {
                font-weight: bold;
                color: #333;
                font-size: 1.2em;
            }
            .item-description {
                color: #777;
                margin: 5px 0;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                max-width: 500px; /* Bạn có thể điều chỉnh giá trị này */
            }
            .item-price {
                color: #d9534f;
                font-weight: bold;
            }
            .total-price {
                font-size: 1.5em;
                color: #d9534f;
                text-align: right;
                margin-top: 20px;
            }
            .button {
                display: inline-block;
                height: 45px;
                margin: 20px 0;
                padding: 10px 20px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                text-align: center;
            }
            .button.disabled {
                opacity: 0.5;
                cursor: not-allowed;
                background-color: Gray;
                color: silver;
                pointer-events: none;
            }
            .button:hover {
                background-color: #4cae4c;
            }
            .notification-bar {
                background-color: #ffcc00;
                color: white;
                padding: 5px;
                padding-left: 10px;
                /*text-align: center;*/
                font-size: 14px;
                width: auto;
                max-width: 50%;
                border-radius: 5px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                margin-top: 40px;
            }
            .notification-bar::before {
                content: "\26A0"; /* Unicode cho biểu tượng cảnh báo */
                font-size: 20px;
                margin-right: 8px;
                color: #fff;
            }
            .notification-bar-location {
                display: flex;
                background-color: #ffcc00;
                color: white;
                padding: 5px;
                padding-left: 10px;
                /*text-align: center;*/
                font-size: 16px;
                width: auto;
                max-width: 100%;
                border-radius: 5px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                margin-top: 40px;
            }
            .body_local a{
                color: black;
            }
            /*bang succesfull*/
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }
            .modal-content {
                background-color: #fefefe;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
                text-align: center;
                border-radius: 10px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .success-icon {
                font-size: 50px;
                color: green;
            }
            .modal-header-new {
                display: flex;
                justify-content: flex-end;
            }
            .modal-body {
                padding: 10px 20px;
            }
            .modal-footer-new {
                display: flex;
                justify-content: center;
                align-content: center;
            }
            .btn-success {
                padding: 10px 40px;
                background-color: green;
                width: 200px;
                border: none;
                color: white;
                font-size: 16px;
                border-radius: 5px;
            }
            .btn-success:hover {
                background-color: darkgreen;
            }
            .cosplayA{
                background: none;
                color: black;
                border: none;
                padding: 0;
                font: inherit;
                cursor: pointer;
                text-decoration: underline;
            }
            .cosplayA:hover {
                color: darkblue;
            }
        </style>
    </head>
    <body>
        <jsp:include page="path/header.jsp"/>
        <%
            String id = request.getParameter("id");
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("LoginServlet");
                return;
            }
            if (id == null) {
                response.sendRedirect("CustomerOrderPage");
                return;
            }
            NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
            OrderManager om = new OrderManager();
            Order currentOrder = om.getOderById(Integer.parseInt(id));
            OrderItemManager oIm = new OrderItemManager();
            ArrayList<OrderItem> oiList = oIm.getOderItemByOrderId(currentOrder.getOrder_id());
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        %>
        <div class="body_local">
            <div class="container_local2">
                <h1>Chi Tiết Đơn Hàng</h1>
                <%
                    if (account.getDistrict() == null || account.getProvinces() == null) {
                %>
                <div class="notification-bar-location">
                    Bạn chưa cập nhật địa chỉ, thêm  
                    <form action="CustomerUpdateAddressPage" method="POST">
                        <input type="hidden" name="odid" value="<%= currentOrder.getOrder_id()%>">
                        <input type="hidden" name="again" value="true">
                        <button type="submit" class="cosplayA" > tại đây</button> 
                    </form>
                </div>
                <%
                    }%>
                <div class="order-info">
                    <h2>Thông Tin Đơn Hàng</h2>
                    <p>Mã Đơn Hàng: <strong>#<%= currentOrder.getOrder_id()%></strong></p>
                    <p>Cửa Hàng: <a href="CustomerDinerPage?id=<%= currentOrder.getDiner().getAccount_id()%>"><strong><%= currentOrder.getDiner().getName()%></strong></a></p>
                    <p>Ngày Đặt: <strong><%= currentOrder.getCreated_at().format(formatter)%></strong></p>
                    <p>Trạng Thái Thanh Toán: <strong><%= currentOrder.isPayment_status() ? "Đã thanh toán" : "Chưa thanh toán"%></strong></p>
                </div>

                <div class="order-info">
                    <h2>Danh Sách Món Ăn</h2>
                    <%
                        boolean check = true;
                        int totalPrice = 0;
                        DishManager dm = new DishManager();
                        Map<OrderItem, Dish> DishMap = new HashMap<OrderItem, Dish>();
                        for (OrderItem orderItem : oiList) {
                            Dish dish = dm.getDishById(orderItem.getDishId());
                            if (dish == null) {
                                check = false;
                    %>
                    <div class="notification-bar" data-item-id="<%= orderItem.getOrder_item_id()%>"><%= orderItem.getDishName()%> đã không còn được bán.</div>
                    <div class="item_container" data-item-id="<%= orderItem.getOrder_item_id()%>">
                        <div class="order-item">
                            <img src="<%= orderItem.getDishPicture()%>" alt="Pizza Margherita">
                            <div class="item-details">
                                <div class="item-name"><%= orderItem.getDishName()%></div>
                                <div class="item-description">Mô tả: <%= orderItem.getDishDescription()%></div>
                                <div class="item-price">Giá: <%= numberFormat.format(orderItem.getDishPrice())%> ₫</div>
                                <div class="item-quantity">Số lượng: <%= orderItem.getQuantity()%></div>
                            </div>
                        </div>
                        <div style="display: flex;align-content: center;">
                            <button class="button delete-button" style="background-color: #DD0000" data-dish-id="<%= orderItem.getDishId()%>"> Xóa </button>
                        </div>
                    </div>
                    <%
                    } else {
                        totalPrice += dish.getPrice()*orderItem.getQuantity();
                    %>
                    <div class="item_container" data-item-id="<%= orderItem.getOrder_item_id()%>">
                        <div class="order-item">
                            <img src="<%= dish.getPicture() %>" alt="Pizza Margherita">
                            <div class="item-details">
                                <div class="item-name"><%= dish.getName()%></div>
                                <div class="item-description">Mô tả: <%= dish.getDescription()%></div>
                                <div class="item-price">Giá: <%= numberFormat.format(dish.getPrice())%> ₫</div>
                                <div class="item-quantity">Số lượng: <%= orderItem.getQuantity()%></div>
                            </div>
                        </div>
                        <div style="display: flex;align-content: center;">
                            <button class="button delete-button" style="background-color: #DD0000" data-item-type="dish"  data-dish-id="<%= orderItem.getDishId()%>"> Xóa </button>
                        </div>
                    </div>
                    <%
                            }
                        }%>
                </div>

                <div class="total-price">
                    Tổng Cộng: <strong><%= numberFormat.format(totalPrice)%> ₫</strong>
                </div>
                <div style="display: flex; justify-content: space-between">
                    <a href="CustomerOrderPage" class="button" style="color: white">Quay Lại Trang Chính</a>
                    <form id="orderForm" action="OrderAgainServlet" method="POST">
                        <button type="button" class="button <%= check ? "" : "disabled"%> order" onclick="showSuccessModal()">Đặt hàng</button>
                    </form>
                </div>
            </div>
        </div>
        <div id="successModal" class="modal">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="success-icon">✔</div>
                    <h2>Đặt hàng thành công!</h2>
                    <p>Cảm ơn bạn đã đặt hàng. Đơn hàng của bạn đang được xử lý.</p>
                    <p>Đi đến danh sách đơn hàng !!</p>
                </div>
                <div class="modal-footer-new">
                    <button class="btn-success" onclick="submitForm()">OK</button>
                </div>
            </div>
        </div>
        <jsp:include page="path/footer.jsp"/>
        <script>
            function showSuccessModal() {
                document.getElementById('successModal').style.display = 'flex';
                const orderForm = document.getElementById('orderForm');
                const itemContainers = document.querySelectorAll('.item_container');

                itemContainers.forEach((container, index) => {
                    const dishId = container.querySelector('.delete-button').getAttribute('data-dish-id');
                    const quantity = container.querySelector('.item-quantity').textContent.replace(/\D/g, '');

                    const dishInput = document.createElement('input');
                    dishInput.type = 'hidden';
                    dishInput.name = `dishId`;
                    dishInput.value = dishId;

                    const quantityInput = document.createElement('input');
                    quantityInput.type = 'hidden';
                    quantityInput.name = `quantity_` + dishId;
                    quantityInput.value = quantity;

                    orderForm.appendChild(dishInput);
                    orderForm.appendChild(quantityInput);
                });
            }
            function closeModal() {
                document.getElementById('successModal').style.display = 'none';
            }
            function submitForm() {
                closeModal();
                document.getElementById('orderForm').submit();
            }

            document.addEventListener('DOMContentLoaded', function () {
                const deleteButtons = document.querySelectorAll('.delete-button');
                const orderButton = document.querySelector('.button.order');
                let totalPrice = <%= totalPrice%>;

                const numberFormat = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });

                deleteButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        const dishId = this.getAttribute('data-dish-id');
                        const itemId = this.closest('.item_container').getAttribute('data-item-id');
                        const itemType = this.getAttribute('data-item-type');

                        console.log('Dish ID:', dishId);
                        console.log('Item ID:', itemId);

                        // Kiểm tra và xóa phần tử thông báo nếu tồn tại
                        const notificationBars = document.getElementsByClassName('notification-bar');
                        let notificationBar;
                        for (let i = 0; i < notificationBars.length; i++) {
                            if (notificationBars[i].getAttribute('data-item-id') === itemId) {
                                notificationBar = notificationBars[i];
                                break;
                            }
                        }
                        if (notificationBar) {
                            console.log('Notification bar found and removed:', notificationBar);
                            notificationBar.remove();
                        } else {
                            console.log('Notification bar not found');
                        }

                        // Kiểm tra và xóa phần tử món ăn nếu tồn tại
                        const itemContainers = document.getElementsByClassName('item_container');
                        let itemContainer;
                        for (let i = 0; i < itemContainers.length; i++) {
                            if (itemContainers[i].getAttribute('data-item-id') === itemId) {
                                itemContainer = itemContainers[i];
                                break;
                            }
                        }
                        if (itemContainer) {
                            console.log('Item container found and removed:', itemContainer);
                            itemContainer.remove();
                        } else {
                            console.log(`Không tìm thấy item_container với data-item-id="${itemId}"`);
                        }

                        console.log('Item type:', itemType);

                        if (itemType === 'dish') { // Kiểm tra nếu là nút xóa của món ăn
                            console.log('Deleting dish:', dishId);

                            // Xử lý trừ tiền vào totalPrice
                            const itemPrice = parseFloat(this.closest('.item_container').querySelector('.item-price').textContent.replace(/\D/g, ''));
                            const itemQuantity = parseFloat(this.closest('.item_container').querySelector('.item-quantity').textContent.replace(/\D/g, ''));
                            console.log('Item price:', itemPrice);
                            totalPrice -= itemPrice*itemQuantity;
                            document.querySelector('.total-price strong').textContent = numberFormat.format(totalPrice);

                            // Kiểm tra và disable nút đặt hàng nếu totalPrice = 0
                            if (totalPrice === 0) {
                                console.log('Total price is zero. Disabling order button.');
                                orderButton.classList.add('disabled');
                                orderButton.disabled = true;
                            }
                        }
                        checkNotificationBars();
                    });
                });
                function checkNotificationBars() {
                    const notificationBars = document.querySelectorAll('.notification-bar');
                    const notificationBarLocation = document.querySelector('.notification-bar-location');
                    const orderButton = document.querySelector('.button.order');

                    console.log('Number of notification bars:', notificationBars.length);
                    console.log('Notification bar location exists:', notificationBarLocation !== null);
                    console.log('Total price:', totalPrice);

                    if (notificationBars.length === 0 && totalPrice > 0 && !notificationBarLocation) {
                        console.log('Enabling order button');
                        orderButton.classList.remove('disabled');
                        orderButton.disabled = false;
                    } else {
                        console.log('Disabling order button');
                        orderButton.classList.add('disabled');
                        orderButton.disabled = true;
                    }
                }
                checkNotificationBars();
            });
        </script>

    </body>
</html>


