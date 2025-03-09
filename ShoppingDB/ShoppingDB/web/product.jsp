<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productName}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        .product-container { display: flex; flex-wrap: wrap; gap: 30px; margin-top: 40px; }
        .product-images { display: flex; gap: 15px; }
        .thumbnail-container { display: flex; flex-direction: column; gap: 10px; }
        .thumbnail-container img { width: 70px; cursor: pointer; border: 1px solid #ccc; padding: 5px; transition: 0.3s; }
        .thumbnail-container img:hover { border: 2px solid black; }
        .main-image-container { width: 350px; height: 350px; display: flex; align-items: center; justify-content: center; background: #e7f1ff; padding: 15px; border-radius: 10px; }
        .main-image { max-width: 100%; max-height: 100%; }
        .product-details { flex: 2; }
        .product-title { font-size: 24px; font-weight: bold; }
        .brand { color: #ffaa00; }
        .price { font-size: 26px; font-weight: bold; color: red; }
        .discount-box { border: 2px dashed red; padding: 15px; margin: 15px 0; background: #fff9f9; }
        .quantity-selector { display: flex; align-items: center; gap: 10px; margin: 20px 0; }
        .quantity-btn { width: 40px; height: 40px; background: #f8f9fa; border: 1px solid #ccc; text-align: center; cursor: pointer; }
        .btn-add-to-cart, .btn-buy-now { padding: 10px 30px; font-size: 16px; border: none; cursor: pointer; width: 100%; margin-top: 10px; }
        .btn-add-to-cart { background: black; color: white; }
        .btn-buy-now { background: red; color: white; }
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="container">
        <c:choose>
            <c:when test="${product != null}">
                <div class="product-container">
                    <div class="product-images">
                        <div class="thumbnail-container">
                            <img src="${product.image != null ? product.image : 'img/default.jpg'}" alt="Ảnh chính" id="mainImage">
                        </div>
                        <div class="main-image-container">
                            <img id="mainImageLarge" src="${product.image != null ? product.image : 'img/default.jpg'}" alt="${product.productName}" class="main-image">
                        </div>
                    </div>
                    <div class="product-details">
                        <h2 class="product-title">${product.productName}</h2>
                        <p class="brand">Thương hiệu: ${product.brand}</p>
                        <p class="price">${product.price} VNĐ</p>
                        <p>Số lượng còn: ${product.quantity}</p>
                        <div class="discount-box">
                            <p><b>🎁 KHUYẾN MÃI - ƯU ĐÃI</b></p>
                            <ul>
                                <li>Gọi 0906.773.723 để mua hàng nhanh hơn</li>
                                <li>Miễn phí giao hàng từ 800.000 VNĐ</li>
                            </ul>
                        </div>
                        <div class="quantity-selector">
                            <button class="quantity-btn" onclick="updateQuantity(-1)">-</button>
                            <input type="text" id="quantity" value="1" readonly style="width: 40px; text-align: center; font-size: 16px;">
                            <button class="quantity-btn" onclick="updateQuantity(1)">+</button>
                        </div>
                        
                        <!-- Add to Cart button for logged-in users -->
                        <%
                            if (session.getAttribute("user") != null) {
                        %>
                                <button class="btn-add-to-cart" onclick="addToCart()">🛒 THÊM VÀO GIỎ</button>
                        <%
                            } else {
                        %>
                            <a href="login.jsp" class="btn-add-to-cart">🔑 ĐĂNG NHẬP ĐỂ MUA</a>

                        <%
                            }
                        %>

                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h2 class="text-danger">⚠ Sản phẩm không tồn tại hoặc đã bị xóa.</h2>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        function updateQuantity(change) {
            let quantityInput = document.getElementById('quantity');
            let current = parseInt(quantityInput.value);
            if (current + change > 0) {
                quantityInput.value = current + change;
            }
        }

        function addToCart() {
            // Tạo một form ẩn
            let form = document.createElement("form");
            form.method = "POST";
            form.action = "orders.jsp"; // Trang xử lý giỏ hàng

            // Lấy dữ liệu sản phẩm từ DOM
            let productID = "${product.productID}"; // Lấy productID từ JSP
            let productName = "${product.productName}"; // Tên sản phẩm
            let price = "${product.price}"; // Giá sản phẩm
            let quantity = document.getElementById("quantity").value; // Số lượng sản phẩm từ input

            // Dữ liệu cần gửi
            let fields = {
                "productID": productID,
                "productName": productName,
                "price": price,
                "quantity": quantity
            };

            // Tạo các input ẩn và thêm vào form
            for (let key in fields) {
                let input = document.createElement("input");
                input.type = "hidden";
                input.name = key;
                input.value = fields[key];
                form.appendChild(input);
            }

            // Thêm form vào body và submit
            document.body.appendChild(form);
            form.submit();
        }
    </script>

</body>
</html>
