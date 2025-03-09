<%@page import="dto.UserDTO"%>
<%@page contentType="text/html; charset=UTF-8" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("user");
%>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #202123;
        padding: 1rem 0;
        width: 100%;
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        color: #fff;
        font-size: 1.5rem;
        font-weight: bold;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .logo img {
        height: 80px;
        margin-right: 10px;
        border-radius: 50%;
    }

    .menu {
        display: flex;
        list-style: none;
        gap: 1.5rem;
        padding: 0;
    }

    .menu-item a {
        color: #fff;
        text-decoration: none;
        font-size: 1rem;
        transition: color 0.3s ease;
        padding: 0.5rem 1rem;
    }

    .menu-item a:hover {
        color: #3498db;
    }

    .search-bar {
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0.5rem 1rem;
    }

    .search-input {
        border: none;
        outline: none;
        padding: 0.2rem;
        width: 200px;
    }

    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: #2c3e50;
        font-size: 1.2rem;
    }

    .search-button:focus {
        outline: none;
    }

    /* User icon & dropdown */
    .user-dropdown {
        position: relative;
        display: inline-block;
    }

    .user-icon {
        font-size: 1.5rem;
        color: #fff;
        cursor: pointer;
        padding: 0.5rem;
    }

    .user-dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #fff;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        min-width: 180px;
        border-radius: 5px;
        overflow: hidden;
    }

    .user-dropdown-content a {
        color: #333;
        padding: 10px 15px;
        text-decoration: none;
        display: block;
        transition: 0.3s;
    }

    .user-dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    .user-dropdown:hover .user-dropdown-content {
        display: block;
    }

</style>

<header class="header">
    <div class="container">
        <nav class="nav">
            <a href="menu.jsp" class="logo">
                <img src="img/logo01.jpg" alt="Logo de COCO SHOP">
                COCO SHOP
            </a>
            <ul class="menu">
                <li class="menu-item"><a href="menu.jsp">HOME</a></li>
                <li class="menu-item"><a href="products.jsp">SHOP</a></li>
                <li class="menu-item"><a href="cart.jsp">GIỎ HÀNG</a></li>
            </ul>
            
            <!-- SEARCH -->
            <div class="search-bar">
                <form action="MainController" method="get">
                    <input type="hidden" name="action" value="searchProduct">
                    <div class="search-bar">
                        <input type="text" class="search-input" name="searchName" placeholder="Nhập tên sản phẩm..." required>
                        <button type="submit" class="search-button" aria-label="Rechercher">🔍</button>
                    </div>
                </form>
            </div>

            <% if (user == null) { %>
                <!-- Nếu chưa đăng nhập, hiển thị nút Login -->
                <a href="login.jsp" class="menu-item" style="color: white; text-decoration: none;">LOGIN</a>
            <% } else { %>
                <!-- Nếu đã đăng nhập, hiển thị icon người dùng -->
                <div class="user-dropdown">
                    <span class="user-icon">👤</span>
                    <div class="user-dropdown-content">
                        <a href="MainController?action=profile">Thông tin cá nhân</a>
                        <a href="orders.jsp">Đơn hàng</a>
                        <hr style="margin: 5px 0;">
                        <a href="MainController?action=logout" style="color: red;">Đăng xuất</a>
                    </div>
                </div>
            <% } %>
        </nav>
    </div>
</header>
