<%@page contentType="text/html; charset=UTF-8" %>



<%
    // Kiểm tra nếu chưa đăng nhập thì chuyển hướng về login.jsp

%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Online</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* Định dạng logo */
        .navbar-brand img {
            height: 110px;
            margin-right: 10px;
            border-radius: 50%;
        }

        /* Định dạng banner */
        .banner {
            background: url('${pageContext.request.contextPath}/img/banner02.jpg') no-repeat center center;
            background-size: cover;
            color: white;
            text-align: center;
            padding: 150px 20px;
        }

        /* Định dạng sản phẩm */
        .product-card {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
            transition: 0.3s;
        }

        .product-card:hover {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .product-card img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }

        .product-card h5 {
            margin-top: 10px;
            font-size: 1.2rem;
        }

        .product-card p {
            color: #e74c3c;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Navbar header -->
<%@ include file="header.jsp" %>

<!-- Banner -->
<div class="container-fluid banner">
</div>

<div class="container my-5">
    <h2 class="text-center mb-4">Sản phẩm nổi bật</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/img/vay02.jpg" alt="Dress">
                <h5>Dress</h5>
                <p>$150</p>
                <a href="ProductServlet?id=1" class="btn btn-primary">Xem chi tiết</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/img/GiaySneaker01.jpg" alt="Giày Sneakers">
                <h5>Giày Sneakers</h5>
                <p>$89</p>
                <a href="ProductServlet?id=2" class="btn btn-primary">Xem chi tiết</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/img/AoKhoacMuaDong.jpg" alt="Áo khoác mùa đông">
                <h5>Áo khoác mùa đông</h5>
                <p>$120</p>
                <a href="ProductServlet?id=3" class="btn btn-primary">Xem chi tiết</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
