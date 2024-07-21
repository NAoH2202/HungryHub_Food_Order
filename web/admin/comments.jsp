<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>HungryHub - Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
    <meta content="Coderthemes" name="author">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css">
    <style>
        .ban {
            color: white;
            background-color: red;
        }
        .content-page {
            min-height: 100vh;
        }
        .table-container {
            max-height: 70vh; /* Điều chỉnh chiều cao nếu cần */
            overflow-y: scroll;
        }
        .comment {
            padding: 10px;
            border-bottom: 1px solid #444;
        }
        .comment .header {
            display: flex;
            align-items: center;
        }
        .comment .header img {
            border-radius: 50%;
            margin-right: 10px;
        }
        .comment .header .name {
            font-weight: bold;
            margin-right: 10px;
        }
        .comment .header .time {
            color: #777;
        }
        .comment .content {
            margin-top: 5px;
        }
        .comment .actions {
            margin-top: 10px;
        }
        .comment .actions a {
            margin-right: 15px;
            color: #aaa;
        }
        .comment-reply {
            padding-left: 40px;
            border-left: 2px solid #ddd;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<!-- Begin page -->
<div id="wrapper">
    <!-- Topbar Start -->
    <div class="navbar-custom">
        <ul class="list-unstyled topnav-menu float-right mb-0">
            <li class="d-none d-sm-block">
                <form class="app-search">
                    <div class="app-search-box">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search...">
                            <div class="input-group-append">
                                <button class="btn" type="submit">
                                    <i class="fe-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </li>
            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="assets/images/users/avatar.png" alt="" height="50">
                    <span class="pro-user-name ml-1">
                            My Account <i class="mdi mdi-chevron-down"></i>
                        </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown">
                    <!-- item-->
                    <div class="dropdown-item noti-title">
                        <h5 class="m-0 text-white">
                            Welcome, Admin!
                        </h5>
                    </div>
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-user"></i>
                        <span>My Account</span>
                    </a>
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-settings"></i>
                        <span>Settings</span>
                    </a>
                    <!-- item-->
                    <div class="dropdown-divider"></div>
                    <!-- item-->
                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                        <i class="fe-log-out"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </li>
        </ul>
        <!-- LOGO -->
        <div class="logo-box">
            <a href="http://localhost:8080/HurryHub/admin?action=home" class="logo text-center">
                    <span class="logo-lg">
                        <img src="assets/images/logo_web.png" alt="" height="55">ADMIN
                    </span>
                <span class="logo-sm">
                        <img src="assets/images/logo_web.png" alt="" height="28">
                    </span>
            </a>
        </div>
        <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
            <li>
                <button class="button-menu-mobile waves-effect waves-light">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </li>
        </ul>
    </div>
    <!-- end Topbar -->
    <!-- ========== Left Sidebar Start ========== -->
    <div class="left-side-menu">
        <div class="slimscroll-menu">
            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <ul class="metismenu" id="side-menu">
                    <li class="menu-title">Navigation</li>
                    <li>
                        <a href="http://localhost:8080/HurryHub/statistic">
                            <i class="fa-solid fa-chart-pie"></i>
                            <span> Statistics </span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript: void(0);">
                            <i class="fa-solid fa-user"></i>
                            <span> User </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <ul class="nav-second-level" aria-expanded="false">
                            <li>
                                <a href="http://localhost:8080/HurryHub/account">List</a>
                            </li>
                            <li>
                                <a href="http://localhost:8080/HurryHub/account-request">Request Member</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://localhost:8080/HurryHub/comment">
                            <i class="fa-solid fa-comments"></i>
                            <span> Comment </span>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/HurryHub/voucher">
                            <i class="fa-solid fa-ticket"></i>
                            <span class="badge badge-danger float-right">New</span>
                            <span> Voucher </span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- End Sidebar -->
            <div class="clearfix"></div>
        </div>
        <!-- Sidebar -left -->
    </div>
    <!-- Left Sidebar End -->
    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="card-box">
                    <h4 class="header-title">COMMENT</h4>
                    <div class="table-container">
                        <div class="table-responsive">
                            <c:forEach items="${listC}" var="comment">
                                <div class="comment">
                                    <div class="header">
                                        <img src="assets/${comment.avatar}" alt="Avatar" height="50">
                                        <span class="name">${comment.name}</span>
                                        <span class="time name">(@${comment.username})</span>
                                        <span class="time">1 tháng trước</span>
                                    </div>
                                    <div class="content" id="comment-${comment.commentId}">
                                            ${comment.content}
                                    </div>
                                    <div class="actions">
                                        <a href="#"><i class="fa fa-thumbs-up"></i> Thích</a>
                                        <a href="javascript:void(0);" onclick="showReplyCommentModal(${comment.commentId})"><i class="fa fa-reply"></i> Phản hồi</a>
                                        <a href="javascript:void(0);" onclick="showEditCommentModal(${comment.commentId}, '${comment.content}')"><i class="fa fa-edit"></i> Sửa</a>
                                        <a href="delete?sid=${comment.commentId}"><i class="fa fa-trash"></i> Xóa</a>
                                    </div>
                                    <div class="comment-reply" id="comment-reply-${comment.commentId}">
                                        <c:forEach items="${comment.listReply}" var="reply">
                                            <div class="comment-reply">
                                                <div class="header">
                                                    <img src="assets/${reply.avatar}" alt="Avatar" height="30">
                                                    <span class="name">${reply.name}</span>
                                                    <span class="time name">(@${reply.username})</span>
                                                    <span class="time">1 tuần trước</span>
                                                </div>
                                                <div class="content" id="comment-reply-content-${reply.commentReplyId}">
                                                        ${reply.content}
                                                </div>
                                                <div class="actions">
                                                    <a href="#"><i class="fa fa-thumbs-up"></i> Thích</a>
                                                    <a href="javascript:void(0);" onclick="showEditCommentModal(${reply.commentId}, '${reply.content}', '${reply.commentReplyId}')"><i class="fa fa-edit"></i> Sửa</a>
                                                    <a href="delete-reply-comment?id=${reply.commentReplyId}"><i class="fa fa-trash"></i> Xóa</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- content -->
    </div>
    <!-- Edit Comment Modal -->
    <div class="modal fade" id="editCommentModal" tabindex="-1" aria-labelledby="editCommentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCommentModalLabel">Edit Comment</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editCommentForm">
                        <div class="mb-3">
                            <label for="editCommentContent" class="form-label">Comment</label>
                            <textarea class="form-control" id="editCommentContent" rows="3"></textarea>
                        </div>
                        <input type="hidden" id="editCommentId">
                        <input type="hidden" id="editReplyCommentId">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveEditComment()">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Reply Comment Modal -->
    <div class="modal fade" id="replyCommentModal" tabindex="-1" aria-labelledby="replyCommentModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="replyCommentModalLabel">Reply to Comment</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="replyCommentForm">
                        <div class="mb-3">
                            <label for="replyCommentContent" class="form-label">Reply</label>
                            <textarea class="form-control" id="replyCommentContent" rows="3"></textarea>
                        </div>
                        <input type="hidden" id="replyCommentId">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveReplyComment()">Send Reply</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Start -->
    <footer class="footer">
        <!-- ... existing code ... -->
    </footer>
    <!-- end Footer -->
    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->
</div>
<!-- END wrapper -->
<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>
<!-- Vendor js -->
<script src="assets/js/vendor.min.js"></script>
<!-- App js -->
<script src="assets/js/app.min.js"></script>
<script>
    function showEditCommentModal(commentId, content, replyCommentId) {
        document.getElementById('editCommentId').value = commentId;
        document.getElementById('editCommentContent').value = content;
        if (replyCommentId) {
            document.getElementById('editReplyCommentId').value = replyCommentId;
        } else {
            document.getElementById('editReplyCommentId').value = '';
        }
        var myModal = new bootstrap.Modal(document.getElementById('editCommentModal'), {
            keyboard: false
        });
        myModal.show();
    }

    function showReplyCommentModal(commentId) {
        document.getElementById('replyCommentId').value = commentId;
        var myModal = new bootstrap.Modal(document.getElementById('replyCommentModal'), {
            keyboard: false
        });
        myModal.show();
    }

    function saveEditComment() {
        var commentId = document.getElementById('editCommentId').value;
        var content = document.getElementById('editCommentContent').value;
        var replyCommentId = document.getElementById('editReplyCommentId').value;

        if (replyCommentId) {
            $.post('edit-reply-comment', { id: commentId, content: content, replyCommentId: replyCommentId }, function(response) {
                document.getElementById('comment-reply-content-' + replyCommentId).innerHTML = content;
            });
        } else {
            $.post('edit-comment', { id: commentId, content: content }, function(response) {
                document.getElementById('comment-' + commentId).innerHTML = content;
                var myModal = bootstrap.Modal.getInstance(document.getElementById('editCommentModal'));
                myModal.hide();
            });
        }

    }

    function saveReplyComment() {
        var commentId = document.getElementById('replyCommentId').value;
        var content = document.getElementById('replyCommentContent').value;
        $.post('reply-comment', { id: commentId, content: content }, function(response) {
            const html = '<div class="comment-reply">' +
                '<div class="header">' +
                '<img src="assets/' + response.avatar + '" alt="Avatar" height="30">' +
                '<span class="name">' + response.name + '</span>' +
                '<span class="time name">(@' + response.username + ')</span>' +
                '<span class="time">1 tuần trước</span>' +
                '</div>' +
                '<div class="content" id="comment-reply-content-${response.id}">' + response.content + '</div>' +
                '<div class="actions">' +
                '<a href="#"><i class="fa fa-thumbs-up"></i> Thích</a>' +
                '<a href="javascript:void(0);" onclick="showEditCommentModal(' + response.id + ', \'' + response.content + '\')"><i class="fa fa-edit"></i> Sửa</a>' +
                '<a href="delete-reply-comment?id=' + response.id + '"><i class="fa fa-trash"></i> Xóa</a>' +
                '</div>' +
                '</div>';
            $('#comment-reply-' + commentId).append(html);
        });
    }
</script>

</body>
</html>
