<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/5/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh sửa ảnh Home</title>
    <!-- Bootstrap  -->
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

    !-- jQuery -->
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
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Thêm hình cho trang chủ</h1>
        </div>
        <form action="#">
            <div class="mb-3">
                <label for="formFile" class="form-label">Ảnh banner</label>
                <input class="form-control" type="file" id="formFile" placeholder="Ảnh banner">
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Ảnh banner</label>
                <input class="form-control" type="file" id="formFile" placeholder="Ảnh banner">
            </div>
            <div class="mb-3">
            <label for="formFile" class="form-label">Ảnh banner</label>
            <input class="form-control" type="file" id="formFile" placeholder="Ảnh banner">
        </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Ảnh banner</label>
                <input class="form-control" type="file" id="formFile" placeholder="Ảnh banner">
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Ảnh banner</label>
                <input class="form-control" type="file" id="formFile" placeholder="Ảnh banner">
            </div>

            <button type="submit" class="btn btn-primary btn-sm">Small button</button>
        </form>

    </div>
</div>
<script>
    document.getElementById('formFileMultiple').addEventListener('change', function(event) {
        const fileList = event.target.files;
        console.log('Files selected:', fileList);
        Array.from(fileList).forEach(file => console.log(file.name));
    });
</script>

</body>
</html>
