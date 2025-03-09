<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%
    
    // Lấy giỏ hàng từ session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<>();
    }

    // Nhận dữ liệu từ product.jsp
    String productID = request.getParameter("productID");
    String productName = request.getParameter("productName");
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");

    if (productID != null && productName != null && price != null && quantity != null) {
        boolean exists = false;

        // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
        for (Map<String, String> item : cart) {
            if (item.get("productID").equals(productID)) {
                int newQuantity = Integer.parseInt(item.get("quantity")) + Integer.parseInt(quantity);
                item.put("quantity", String.valueOf(newQuantity));
                exists = true;
                break;
            }
        }

        // Nếu chưa có trong giỏ, thêm mới
        if (!exists) {
            Map<String, String> newItem = new HashMap<>();
            newItem.put("productID", productID);
            newItem.put("productName", productName);
            newItem.put("price", price);
            newItem.put("quantity", quantity);
            cart.add(newItem);
        }

        // Cập nhật session
        session.setAttribute("cart", cart);
    }

    // Xóa sản phẩm khỏi giỏ hàng
    String removeID = request.getParameter("removeID");
    if (removeID != null) {
        Iterator<Map<String, String>> iterator = cart.iterator();
        while (iterator.hasNext()) {
            Map<String, String> item = iterator.next();
            if (item.get("productID").equals(removeID)) {
                iterator.remove();
            }
        }
        session.setAttribute("cart", cart);
    }

    // Cập nhật số lượng sản phẩm trong giỏ hàng (nếu có thay đổi)
    String updateID = request.getParameter("updateID");
    String updateQuantity = request.getParameter("updateQuantity");
    if (updateID != null && updateQuantity != null) {
        for (Map<String, String> item : cart) {
            if (item.get("productID").equals(updateID)) {
                item.put("quantity", updateQuantity);
                break;
            }
        }
        session.setAttribute("cart", cart);
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container mt-5">
        <h2 class="text-center">🛒 Giỏ Hàng Của Bạn</h2>
        
        <% if (cart.isEmpty()) { %>
            <p class="text-center text-danger">Giỏ hàng trống!</p>
        <% } else { %>
            <table class="table table-bordered mt-4">
                <thead>
                    <tr>
                        <th>Mã SP</th>
                        <th>Tên SP</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double grandTotal = 0;
                        for (Map<String, String> item : cart) {
                            double priceValue = Double.parseDouble(item.get("price"));
                            int quantityValue = Integer.parseInt(item.get("quantity"));
                            double total = priceValue * quantityValue;
                            grandTotal += total;
                    %>
                    <tr id="row_<%= item.get("productID") %>">
                        <td><%= item.get("productID") %></td>
                        <td><%= item.get("productName") %></td>
                        <td><%= String.format("%,.2f", priceValue) %> VND</td>
                        <td>
                            <form method="POST" action="orders.jsp">
                                <input type="hidden" name="updateID" value="<%= item.get("productID") %>">
                                <input type="number" name="updateQuantity" value="<%= item.get("quantity") %>" min="1" style="width: 60px;">
                                <button type="submit" class="btn btn-sm btn-outline-secondary">Cập nhật</button>
                            </form>
                        </td>
                        <td><span id="total_<%= item.get("productID") %>"><%= String.format("%,.2f", total) %></span> VND</td>
                        <td>
                            <form method="POST" action="orders.jsp">
                                <input type="hidden" name="removeID" value="<%= item.get("productID") %>">
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td colspan="4" align="right"><b>Tổng cộng:</b></td>
                        <td><b><%= String.format("%,.2f", grandTotal) %> VND</b></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        <% } %>

        <div class="text-center">
            <a href="menu.jsp" class="btn btn-primary">Tiếp tục mua hàng</a>
            <% if (!cart.isEmpty()) { %>
                <a href="checkout.jsp" class="btn btn-success">Thanh toán</a>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
