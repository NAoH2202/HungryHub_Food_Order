<%@page import="controller.AddToCartServlet"%>
<%@page import="model.CartItem"%>
<%@page import="model.CartItemManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.AccountManager"%>
<%@page import="model.Dish"%>
<%@page import="model.DishManager"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    .cart-menu {
        position: absolute;
        right: calc(5% - 60px);
        background: var(--bg-color);
        top: 110%;
        max-width: 350px;
        width: 100%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
        border-radius: 4px;
        overflow: hidden;
        max-height: 0px;
        transition: max-height 0.3s ease, opacity 0.3s ease;
        opacity: 0;
        z-index: 1000;
    }

    .cart-menu-showup-toggle {
        max-height: 470px;
        opacity: 1;
    }

    .cart-items {
        max-height: 380px; /* Đặt giá trị max-height tại đây */
        overflow-y: auto;
        padding: 20px;
    }

    .cart-item-dish {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .cart-item-dish img {
        width: 45px;
        height: 45px;
        object-fit: cover;
        border-radius: 4px;
        margin-right: 10px;
    }

    .cart-item-dish div p {
        color: var(--text-color);
        font-weight: 600;
        margin-bottom: 10px;
    }

    .cart-checkout {
        text-align: center;
        padding: 10px;
    }

    .cart-checkout a {
        text-decoration: none;
        color: var(--primary-color);
        font-weight: bold;
    }
    .cart-title {
        text-align: center;
        padding: 10px 0;
        margin-bottom: 10px;
        font-weight: bold;
        color: #333; /* Màu chữ của tiêu đề */
        font-size: 18px; /* Kích cỡ chữ của tiêu đề */
        border-bottom: 1px solid #ccc; /* Đường viền dưới của tiêu đề */
    }

    .btn_delete_cartitem {
        background-color: #dc3545; /* Màu nền */
        color: #fff; /* Màu chữ */
        border: none; /* Không có viền */
        padding: 4px 8px; /* Kích thước nút */
        cursor: pointer; /* Con trỏ khi rê chuột */
        border-radius: 4px; /* Độ cong góc */
        transition: background-color 0.3s ease, color 0.3s ease; /* Hiệu ứng chuyển đổi */
    }

    .btn_delete_cartitem:hover {
        background-color: #c82333; /* Màu nền khi hover */
        color: #fff; /* Màu chữ khi hover */
    }

    @media (max-width: 600px) {
        .cart-menu {
            right: 0;
            max-width: 100%;
        }
    }
    /*them moi*/
    .icon_container {
        position: relative;
        display: inline-block; /* Để phần tử có thể chứa inline content như icon */
    }
    .notification-dot {
        position: absolute;
        top: 0;
        left: 25px;
        width: 10px; /* Đường kính của chấm tròn */
        height: 10px;
        background-color: red; /* Màu sắc của chấm tròn */
        border-radius: 50%; /* Để tạo hình dạng hình tròn */
        box-shadow: 0 0 1px #333; /* Độ mờ cho chấm tròn, tùy chỉnh theo ý muốn */
    }

</style>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mx-auto">
        <li class="nav-item active">
            <a class="nav-link" href="DinerPage">Trang Chủ<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="CustomerSocialPage">Cộng Đồng</a>
        </li>
        <li class="nav-item">
            <%
                Account acc = (Account) session.getAttribute("account");
                String url, urlacc, name;
                if (acc == null) {
                    url = "about.jsp";
                    urlacc = "";
                    name = "about";
                } else {
                    url = "CustomerOrderPage";
                    urlacc = "AccountPage";
                    name = acc.getName() + "'s Order";
                }

            %>
        </li>
    </ul>
    <div class="user_option">
        <a href="<%=urlacc%>" class="user_link">
            <i class="fa fa-user" aria-hidden="true"></i>
        </a>
        <a href="#" class="user_link">
            <i class="fa fa-bell"></i>
        </a>
        <%
            if (acc == null) {
        %>
        <a href="#" class="user_link">
            <i class="fa fa-cart-arrow-down"></i>
        </a>
        <%
        } else {
            CartItemManager cim = new CartItemManager();
            ArrayList<CartItem> ciList = cim.getCartItemByAccountId(acc.getAccount_id());
            ArrayList<Account> dinerList = AddToCartServlet.getUniqueDinersFromCartItems(ciList);
            ArrayList<CartItem> ciListByDiner;

        %>
        <div class="icon_container">
            <a href="#" class="user_link cart-button" onclick="CartToggle()">
                <i class="fa fa-cart-arrow-down"></i>
            </a>
        </div>
        <div class="cart-menu"  style="background-color: white;right: calc(5% - 60px);">
            <div class="cart-items">
                <div class="cart-item">
                    <%                        for (Account diner : dinerList) {%>
                    <h3 class="cart-title"><%=diner.getName()%></h3>
                    <%ciListByDiner = AddToCartServlet.getCartItemsByDiner(diner.getAccount_id(), ciList);
                        for (CartItem ci : ciListByDiner) {%>
                    <div class="cart-item-dish">
                        <img src="<%=ci.getDish().getPicture()%>" alt="Product Image">
                        <div>
                            <p><%=ci.getDish().getName()%></p>
                            <p><strong>Số lượng:</strong> <%=ci.getQuantity()%> - <strong>Giá:</strong> <%=ci.getDish().getPrice() * ci.getQuantity()%> VNĐ</p>
                        </div>
                        <button class="btn_delete_cartitem" onclick="RemoveCart(<%=ci.getCartitemId()%>)">Xóa</button>
                    </div>
                    <%
                            }
                        }%>
                </div>
            </div>
            <hr>
            <div class="cart-checkout">
                <a href="OrderConfirmationPage">Go to Checkout</a>
            </div>
        </div>
        <%
            }
        %>
        <%
            if (acc == null) {
        %>
        <a href="LoginServlet" class="order_online">
            Login
        </a>
        <%
        } else {
            String orderPageUrl = acc.getRole().equals("DinerManager") ? "DinerOrderPage" : "CustomerOrderPage";
        %>
        <div class="profile-image online" onclick="UserSettingToggle()">
            <img src="<%=acc.getProfile_picture()%>" alt="">
        </div>
        <div class="user-settings" style="background-color: white;right: calc(5% - 60px);">
            <div class="profile-darkButton" >
                <div class="user-profile" style="padding-bottom: 10px">
                    <img src="<%=acc.getProfile_picture()%>" alt="">
                    <div>
                        <p> <%=acc.getName()%></p>
                        <a href="#" style="margin: 0px;">See your profile</a>
                    </div>
                </div>
            </div>
            <hr>
            <div class="user-profile" style="padding-bottom: 10px;padding-top: 10px">
                <img src="images/feedback.png" alt="">
                <div>
                    <p> Gửi phản hồi</p>
                    <a href="#" style="margin-left: 0px;">Hãy trút cơn giận của bạn lên chúng tôi</a>
                </div>
            </div>
            <hr>
            <div class="settings-links">
                <img src="images/order.png" alt="" class="settings-icon">
                <a href="<%=orderPageUrl%>">Đơn hàng của bạn<img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/help.png" alt="" class="settings-icon">
                <a href="#">Giúp đỡ và hỗ trợ <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/voucher.png" alt="" class="settings-icon">
                <a href="#">Mã giảm giá của bạn <img src="images/arrow.png" alt=""></a>
            </div>

            <div class="settings-links">
                <img src="images/logout.png" alt="" class="settings-icon">
                <a href="LogOutServlet">Đăng Xuất <img src="images/arrow.png" alt=""></a>
            </div>

        </div>
        <%
            }
        %>
    </div>
</div>



<script src="js/function.js"></script>
<script>
            // JavaScript để xử lý mở/đóng menu cài đặt người dùng và cart
            function CartToggle() {
                const cartMenu = document.querySelector('.cart-menu');
                var notificationDot = document.querySelector('.notification-dot.cart');
                if (cartMenu) {
                    if (notificationDot) {
                        // Nếu đã có notification-dot cart, loại bỏ nó đi
                        notificationDot.remove();
                    }
                    cartMenu.classList.toggle('cart-menu-showup-toggle');
                }
            }
            document.addEventListener('click', function (event) {
                const userSettings = document.querySelector('.user-settings');
                const cartMenu = document.querySelector('.cart-menu');
                if (userSettings && !userSettings.contains(event.target) && !document.querySelector('.profile-image').contains(event.target)) {
                    userSettings.classList.remove('user-setting-showup-toggle');
                }
                if (cartMenu && !cartMenu.contains(event.target) && !document.querySelector('.cart-button').contains(event.target)) {
                    cartMenu.classList.remove('cart-menu-showup-toggle');
                }
            });

            function RemoveCart(Id) {
                $.ajax({
                    url: 'RemoveToCartServlet', // Đường dẫn đến Servlet
                    type: 'POST',
                    data: {
                        id: Id
                    },
                    success: function (response) {
                        if (response.status === 'notLoginYet') {
                            alert(response.message);
                        } else {
                            var cartItemsContainer = document.querySelector('.cart-items');
                            cartItemsContainer.innerHTML = '';
                            // Thêm nội dung mới vào cart-items
                            cartItemsContainer.insertAdjacentHTML('beforeend', response);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(error);
                    }
                });
            }
</script>
