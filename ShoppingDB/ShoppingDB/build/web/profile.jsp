<%@page import="dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông Tin Cá Nhân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .profile-img {
            border-radius: 50%;
            border: 4px solid #ddd;
        }
        .btn-update {
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="profile-card">
            <c:set var="profile" value="${sessionScope.user}"/>
            
            <img src="${profile.image}" alt="User Image" class="profile-img mb-3" width="150" height="150">
            
            <h3 class="mb-2">${profile.fullname}</h3>
            <p class="text-muted">Role: <strong>${profile.roleID}</strong></p>
            <p>Email: <strong>${profile.email}</strong></p>
            <p>Phone (85+): <strong>${profile.phone}</strong></p>
            
            <a href="updateProfile.jsp" class="btn btn-primary btn-update mt-3">Cập Nhật Thông Tin</a>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
