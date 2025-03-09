<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cập Nhật Thông Tin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<style>
    .row {
        margin: 80px auto;
        padding: 30px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
</style>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-4">
                    <h2 class="text-center mb-4">Cập Nhật Thông Tin</h2>
                    
                    <% HttpSession sessionUpdate = request.getSession();
                        UserDTO user = (UserDTO) sessionUpdate.getAttribute("user");
                        if (user == null) {
                            response.sendRedirect("login.jsp");
                            return;
                        }
                        String message = (String) request.getAttribute("message");
                    %>
                    
                    <% if (message != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= message %>
                        </div>
                    <% } %>
                    
                    <form action="MainController" method="post">
                        <input type="hidden" name="action" value="updateProfile">
                        <input type="hidden" name="userID" value="<%= user.getUserID() %>">
                        
                        <div class="mb-3">
                            <label class="form-label">Họ và Tên</label>
                            <input type="text" class="form-control" name="fullname" value="<%= user.getFullname() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Số Điện Thoại</label>
                            <input type="text" class="form-control" name="phone" value="<%= user.getPhone() %>" required>
                        </div>
                        
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        </div>
                    </form>
                    
                    <div class="text-center mt-3">
                        <a href="profile.jsp" class="btn btn-secondary">Quay lại</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
