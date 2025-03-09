<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <title>Danh sách sản phẩm</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .product-img {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 8px;
            }
            .custom-table th, .custom-table td {
                text-align: center;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container mt-4">
            <% if (request.getAttribute("message") != null) { %>
                <div class="alert alert-danger text-center"><%= request.getAttribute("message") %></div>
            <% } %>
            <%
                List<ProductDTO> searchResults = (List<ProductDTO>) request.getAttribute("searchResults");
                if (searchResults != null && !searchResults.isEmpty()) {
            %>
            <div class="table-responsive">
                <table class="table table-bordered table-hover custom-table">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Mã SP</th>
                            <th>Tên SP</th>
                            <th>Thương hiệu</th>
                            <th>Hình ảnh</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ProductDTO product : searchResults) { %>
                        <tr>
                            <td><%= product.getProductID() %></td>
                            <td><%= product.getProductCode() %></td>
                            <td><%= product.getProductName() %></td>
                            <td><%= product.getBrand() %></td>
                            <td>
                                <% if (product.getImage() != null && !product.getImage().isEmpty()) { %>
                                    <img src="<%= product.getImage() %>" class="product-img" alt="Product Image">
                                <% } else { %>
                                    Không có ảnh
                                <% } %>
                            </td>
                            <td><%= product.getPrice() %> VND</td>
                            <td><%= product.getQuantity() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% } %>
            <div class="text-center mt-3">
                <a href="menu.jsp" class="btn btn-primary">Quay lại trang chính</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
