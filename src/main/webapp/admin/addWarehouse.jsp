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
            <h1>Nhập Hàng Mới</h1>
            <span class="text-info" id="message"></span>

            <form id="productForm">

                <label for="productName">Tên sản phẩm</label>
                <input type="text" id="productName" name="productName"
                       value="<%= productName == null ? "" : productName %>"
                       placeholder="Nhập tên sản phẩm" required>

                <label for="category">Danh mục</label>
                <input type="text" id="category" name="category"
                       value="<%= category == null ? "" : category %>"
                       placeholder="Nhập danh mục sản phẩm" required>

                <label for="price">Giá</label>
                <input type="text" id="price" name="price"
                       value="<%= price == 0.0 ? "" : price %>"
                       placeholder="Nhập giá sản phẩm" required>

                <label for="quantityInStock">Số lượng trong kho</label>
                <input type="text" id="quantityInStock" name="quantityInStock"
                       value="<%= quantityInStock == 0 ? "" : quantityInStock %>"
                       placeholder="Nhập số lượng trong kho" required>

                <label for="reorderLevel">Mức đề xuất nhập kho</label>
                <input type="text" id="reorderLevel" name="reorderLevel"
                       value="<%= reorderLevel == 0 ? "" : reorderLevel %>"
                       placeholder="Nhập mức đề xuất nhập kho" required>

                <label for="description">Mô tả sản phẩm</label>
                <textarea id="description" name="description" placeholder="Nhập mô tả sản phẩm"><%= description == null ? "" : description %></textarea>

                <label for="imageUrl">Hình ảnh sản phẩm</label>
                <input type="text" id="imageUrl" name="imageUrl"
                       value="<%= imageUrl == null ? "" : imageUrl %>"
                       placeholder="Nhập URL hình ảnh sản phẩm">

                <label for="manuID">Nhà sản xuất</label>
                <select id="manuID" name="manuID" required>
                    <option value="">Chọn nhà sản xuất</option>
                    <!-- Bạn có thể thay đổi danh sách nhà sản xuất tại đây -->
                    <option value="1" <%= manuID == 1 ? "selected" : "" %>>Thiên Long</option>
                    <option value="2" <%= manuID == 2 ? "selected" : "" %>>Hải Tiến</option>
                    <!-- Thêm các nhà sản xuất khác -->
                </select>

                <button type="submit">Thêm sản phẩm</button>
                <a href="<%=request.getContextPath()%>/admin/all-product" id="btnAddProduct" class="text-decoration-none text-white p-2 text-center bg-success mt-2 rounded" hidden>
                    Quay lại
                </a>

            </form>

        </div>
    </div>
</main>

<script>
    // Add product (ajax)
    document.querySelector('#productForm').addEventListener('submit', async function (e) {
        e.preventDefault()

        // lấy data từ form
        let formData = new URLSearchParams(new FormData(this))
        let url = '<%= request.getContextPath() %>/admin/AddProduct';


        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-type': 'application/x-www-form-urlencoded'
                },
                body: formData
            })

            // xử lý logic
            let rs = await response.json();
            if (rs.isSuccess) {
                notify(rs.isSuccess, this)
            } else {
                notify(rs.isSuccess, rs.msg, this)
            }
        } catch (error) {
            console.log(error)
        }

    })

    // hàm thông báo trạng thái cập nhật
    function notify(valid, msg, form) {
        if (valid) {
            document.getElementById("message").textContent = 'Thêm sản phẩm thành công'
            toggleHidden()
            form.addEventListener('focus', function () {
                document.getElementById("message").textContent = "";
            }, true)
        } else {
            document.getElementById("message").classList.replace("text-info", "text-danger");
            document.getElementById("message").textContent = msg
            form.addEventListener('focus', function () {
                document.getElementById("message").classList.replace("text-danger", "text-info");
                document.getElementById("message").textContent = "";
            }, true)
        }
    }

    // ẩn hiển thẻ quay lại
    function toggleHidden() {
        let link = document.getElementById("btnAddProduct");
        link.hidden = !link.hidden; // Đảo ngược trạng thái hidden
    }

</script>

</body>
</html>
