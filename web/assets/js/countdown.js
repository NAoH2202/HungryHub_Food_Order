// Hàm để khởi tạo đồng hồ đếm ngược
function initializeCountdown(elementId, duration) {
    var countdownElement = document.getElementById(elementId);
    var countDownDate = new Date().getTime() + duration * 1000; // thời gian kết thúc

    var x = setInterval(function() {
        var now = new Date().getTime();
        var distance = countDownDate - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        countdownElement.innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";

        if (distance < 0) {
            clearInterval(x);
            countdownElement.innerHTML = "EXPIRED";
        }
    }, 1000);
}

// Hàm để xử lý việc bỏ cấm người dùng
function unbanUser(userId) {
    var countdownElement = document.getElementById('countdown' + userId);
    countdownElement.innerHTML = "User unbanned";
    // Logic để xử lý việc bỏ cấm người dùng có thể thêm vào đây
}

// Khởi tạo đồng hồ đếm ngược cho từng người dùng với thời gian mẫu
initializeCountdown('countdown1', 3600); // 1 giờ
initializeCountdown('countdown2', 7200); // 2 giờ
initializeCountdown('countdown3', 18000); // 5 giờ
