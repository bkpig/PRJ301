<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .form-control {
            border-radius: 5px;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
        .btn-black {
            background-color: black;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
            padding: 10px;
        }
        .btn-black:hover {
            background-color: #333;
        }
        .forgot-password {
            font-size: 14px;
            margin-top: 10px;
        }
        .forgot-password a {
            color: blue;
            text-decoration: none;
        }
        .forgot-password a:hover {
            text-decoration: underline;
        }
        .register-link {
            font-size: 14px;
            margin-bottom: 20px;
        }
        .register-link a {
            color: orange;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    
    <jsp:include page="header.jsp"/>

    <div class="container">
        <div class="login-container">
            <h3 class="fw-bold">ĐĂNG NHẬP TÀI KHOẢN</h3>
            <p class="register-link">Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký tại đây</a></p>

            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="login"/>

                <div class="mb-3 text-start">
                    <label for="strUserID" class="form-label">User ID <span class="text-danger">*</span></label>
                    <input type="text" name="strUserID" id="strUserID" class="form-control" placeholder="UserID" required>
                </div>

                <div class="mb-3 text-start">
                    <label for="password" class="form-label">Mật khẩu <span class="text-danger">*</span></label>
                    <input type="password" name="strPassword" id="password" class="form-control" placeholder="Mật khẩu" required>
                </div>

                <button type="submit" name ="action" value="login" class="btn btn-black">Đăng nhập</button>
            </form>

            <div class="forgot-password">
                Quên mật khẩu? Nhấn vào <a href="forgot-password.jsp">đây</a>
            </div>

            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
                <p class="error-message"><%=message%></p>
            <%
                }
            %>
        </div>
    </div>

    <%@include file="footer.jsp" %> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>