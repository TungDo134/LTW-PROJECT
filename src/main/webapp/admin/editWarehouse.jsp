<%@ page import="entity.Product" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa kho</title>
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
    // Lấy dữ liệu đã truyền sang từ servlet
    String productName = (String) request.getAttribute("productName");
    int quantityInStock = (request.getAttribute("quantityInStock") != null) ? (Integer) request.getAttribute("quantityInStock") : 0;
    int quantitySold = (request.getAttribute("quantitySold") != null) ? (Integer) request.getAttribute("quantitySold") : 0;
    int quantityReserved = (request.getAttribute("quantityReserved") != null) ? (Integer) request.getAttribute("quantityReserved") : 0;
    int reorderLevel = (request.getAttribute("reorderLevel") != null) ? (Integer) request.getAttribute("reorderLevel") : 0;
%>


<main id="main-content">
    <div class="main-container">
        <div class="container">
            <h1>Chỉnh sửa nhập kho</h1>
            <span class="text-info" id="message"></span>

            <form id="inventoryForm">
                <input type="hidden" name="productID" value="<%= request.getAttribute("productID") %>">

                <label for="productName">Tên sản phẩm</label>
                <input type="text" name="productName" id="productName"
                       value="<%= productName == null ? "" : productName %>" required>

                <label for="quantityInStock">Số lượng trong kho</label>
                <input type="text" name="quantityInStock" id="quantityInStock" value="<%= quantityInStock == 0 ? "" : quantityInStock %>" required>

                <label for="quantitySold">Đã bán</label>
                <input type="text" name="quantitySold" id="quantitySold" value="<%= quantitySold == 0 ? "" : quantitySold %>" required>

                <label for="quantityReserved">Đang xử lý</label>
                <input type="text" name="quantityReserved" id="quantityReserved" value="<%= quantityReserved == 0 ? "" : quantityReserved %>" required>

                <label for="reorderLevel">Mức đề xuất nhập kho</label>
                <input type="text" name="reorderLevel" id="reorderLevel" value="<%= reorderLevel == 0 ? "" : reorderLevel %>" required>

                <button type="submit" class="submit">Cập nhật</button>
                <a href="<%=request.getContextPath()%>/admin/list-warehouse" class="btn btn-secondary ">Quay lại</a>
            </form>


        </div>
    </div>
</main>

<script>
    // Add product (ajax)
    document.querySelector('#inventoryForm').addEventListener('submit', async function (e) {
        e.preventDefault()

        // lấy data từ form
        let formData = new URLSearchParams(new FormData(this))
        let url = '<%= request.getContextPath() %>/admin/UpdateInventory';


        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-type': 'application/x-www-form-urlencoded'
                },
                body: formData
            })

            // xử lý logic
            let rs = await response.json(); // Chắc chắn là chúng ta nhận được phản hồi dạng JSON từ server
            if (rs.isSuccess) {
                // Gọi notify để thông báo thành công
                notify(true, 'Cập nhật thành công', this);
            } else {
                // Gọi notify để thông báo lỗi từ server
                notify(false, rs.msg, this);
            }

        } catch (error) {
            // Xử lý lỗi nếu có (ví dụ, không kết nối được với server)
            console.log('Lỗi khi gửi yêu cầu:', error);
            notify(false, 'Đã xảy ra lỗi khi cập nhật. Vui lòng thử lại!', this);
        }
    })


    // hàm thông báo trạng thái cập nhật
    function notify(valid, msg, form) {
        let messageElement = document.getElementById("message");

        if (valid) {
            // Hiển thị thông báo thành công
            messageElement.classList.remove("text-danger");
            messageElement.classList.add("text-info");
            messageElement.textContent = msg || 'Cập nhật thành công';

            // Ẩn thông báo khi form được focus
            form.addEventListener('focus', function () {
                messageElement.textContent = "";
            }, true);
        } else {
            // Hiển thị thông báo lỗi
            messageElement.classList.remove("text-info");
            messageElement.classList.add("text-danger");
            messageElement.textContent = msg || 'Đã xảy ra lỗi';

            // Ẩn thông báo khi form được focus
            form.addEventListener('focus', function () {
                messageElement.classList.remove("text-danger");
                messageElement.textContent = "";
            }, true);
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
