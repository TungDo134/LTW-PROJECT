<%@ page import="entity.Product" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nhập Hàng</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Font Awesome (cho các icon) -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
            integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- Google Icon -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
    />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddInven.css">
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<%
    // Các biến cần thiết để hiển thị giá trị mặc định khi sửa
    String productName = (String) request.getAttribute("productName");
    String category = (String) request.getAttribute("category");
    double price = (request.getAttribute("price") != null) ? (Double) request.getAttribute("price") : 0.0;
    int quantityInStock = (request.getAttribute("quantityInStock") != null) ? (Integer) request.getAttribute("quantityInStock") : 0;
    int reorderLevel = (request.getAttribute("reorderLevel") != null) ? (Integer) request.getAttribute("reorderLevel") : 0;
    String description = (String) request.getAttribute("description");
    String imageUrl = (String) request.getAttribute("imageUrl");
    int manuID = (request.getAttribute("manuID") != null) ? (Integer) request.getAttribute("manuID") : 0;
%>

<main id="main-content">
    <div class="main-container">
        <div class="container">
            <h1>Nhập kho sản phẩm</h1>
            <span class="text-info" id="message"></span>

            <form id="inventoryForm" action="<%= request.getContextPath() %>/admin/add-stock" method="POST">
            <!-- ID sản phẩm (ẩn) -->
                <input type="hidden" name="productID" value="${productID}" readonly />

                <label for="productName">Tên sản phẩm</label>
                <input type="text" id="productName" value="${productName}" readonly />

                <label for="quantityInStock">Số lượng muốn nhập thêm</label>
                <input type="number" id="quantityInStock" name="quantityInStock" required placeholder="Nhập số lượng nhập kho" />

                <label for="reorderLevel">Mức đề xuất nhập kho</label>
                <input type="number" id="reorderLevel" name="reorderLevel" value="${reorderLevel}" required />

                <button type="submit" class="btn btn-primary mt-3 mb-10">Xác nhận nhập kho</button>
                <a href="<%=request.getContextPath()%>/admin/list-warehouse" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>
    </div>
</main>

<script>
    document.querySelector('#inventoryForm').addEventListener('submit', async function (e) {
        e.preventDefault();

        let formData = new URLSearchParams(new FormData(this));
        let url = '<%= request.getContextPath() %>/admin/add-stock';


        try {
            let res = await fetch(url, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: formData
            });

            let rs = await res.json();
            if (rs.isSuccess) {
                document.getElementById("message").textContent = "Nhập kho thành công!";
                document.getElementById("message").classList.replace("text-danger", "text-info");
            } else {
                document.getElementById("message").textContent = rs.msg;
                document.getElementById("message").classList.replace("text-info", "text-danger");
            }
        } catch (err) {
            console.error(err);
        }
    });
</script>


</body>
</html>
