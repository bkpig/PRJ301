
<style>
    .footer {
        background-color: #202123;
        color: #ffffff;
        padding: 30px 0;
        font-size: 14px;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        flex-wrap: wrap;
        max-width: 1200px;
        margin: auto;
        gap: 20px;
    }

    .footer-section {
        flex: 1;
        min-width: 250px;
    }

    .footer h3 {
        font-size: 16px;
        margin-bottom: 15px;
        font-weight: bold;
        text-transform: uppercase;
    }

    .footer p, .footer a {
        color: #bdc3c7;
        text-decoration: none;
        transition: color 0.3s ease-in-out;
    }

    .footer a:hover {
        color: #f39c12;
    }

    .list-menu {
        padding: 0;
        list-style: none;
    }

    .list-menu li {
        margin-bottom: 8px;
    }

    /* Form nh?p email */
    .subscribe-form {
        display: flex;
        gap: 10px;
        margin-top: 10px;
    }

    .subscribe-input {
        flex: 1;
        padding: 10px;
        border: 1px solid #bdc3c7;
        border-radius: 5px;
        outline: none;
    }

    .subscribe-button {
        background-color: #f39c12;
        color: #ffffff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s ease-in-out;
    }

    .subscribe-button:hover {
        background-color: #e67e22;
    }

    /* Responsive: T? ??ng xu?ng d�ng khi m�n h�nh nh? */
    @media (max-width: 768px) {
        .footer-container {
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
    }
</style>

<footer class="footer">
    <div class="container">
        <div class="footer-container">
            
            <!-- C?t Th�ng Tin COCO SHOP -->
            <div class="footer-section">
                <h3>COCO SHOP</h3>
                <p>? ??a Ch?: S503 Vinhome GrandPark</p>
                <p>? Email: coco@gmail.com</p>
                <p>? ?i?n tho?i: 0915 282 164</p>
                <p>� 2019 - 2025. Golden Summer Fashion Co Ltd. All rights reserved</p>
            </div> 

            <!-- C?t V? COCO SHOP -->
            <div class="footer-section">
                <h3>V? COCO SHOP</h3>
                <ul class="list-menu">
                    <li><a href="informationCompany.jsp">Gi?i thi?u v? COCO</a></li>
                    <li><a href="thong_tin_lien_he.jsp">Th�ng tin li�n h?</a></li>
                    <li><a href="huong_dan_chon_size.jsp">H??ng d?n ch?n size</a></li>
                    <li><a href="he_thong_cua_hang.jsp">H? th?ng c?a h�ng</a></li>
                </ul>
            </div>

            <!-- C?t H? Tr? Kh�ch H�ng -->
            <div class="footer-section">
                <h3>H? tr? kh�ch h�ng</h3>
                <ul class="list-menu">
                    <li><a href="Quy_dinh_chung.jsp">Quy ??nh chung</a></li>
                    <li><a href="Chinh_sach_thanh_toan.jsp">Ch�nh s�ch thanh to�n</a></li>
                    <li><a href="Chinh_sach_giao_hang.jsp">Ch�nh s�ch giao h�ng</a></li>
                    <li><a href="Chinh_sach_doi_tra.jsp">Ch�nh s�ch ??i tr?</a></li>
                    <li><a href="Chinh_sach_bao_hanh.jsp">Ch�nh s�ch b?o h�nh</a></li>
                    <li><a href="Chinh_sach_bao_mat.jsp">Ch�nh s�ch b?o m?t</a></li>
                </ul>
            </div>

            <!-- C?t Nh?n Th�ng Tin ?u ?�i -->
            <div class="footer-section">
                <h3>Nh?n th�ng tin ?u ?�i</h3>
                <p>Nh?p email c?a b?n ?? nh?n c�c ch??ng tr�nh khuy?n m�i m?i nh?t.</p>
                <form class="subscribe-form">
                    <input type="email" class="subscribe-input" placeholder="Nh?p email c?a b?n..." required>
                    <button type="submit" class="subscribe-button">??ng k�</button>
                </form>
            </div>

        </div>
    </div>
</footer>
