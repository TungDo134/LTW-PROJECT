<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/8/2025
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Chỉnh sửa ảnh chi tiết</title>
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
    <%--    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddUser.css">--%>
    <style>
        #form-sub{
            display: grid;
            grid-template-columns: repeat(4,1fr);
            row-gap: 2rem;
        }
        button{
            width: 100%;
            height: 50px;
        }

        img{
            width: 100px;
        }


    </style>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<main id="main-content">
    <div class="main-container">
        <div class="container">
            <h1>Chỉnh sửa ảnh chi tiết</h1>
            <span class="text-info"> ${msg} </span>


            <form id="form-sub" action="<%=request.getContextPath()%>/edit-sub-img?code=1" method="POST">


                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg1}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg1}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg2}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg2}">
                </div>
                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg3}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg3}">
                </div>
                <div
                ><img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg4}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg4}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg5}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg5}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg6}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg6}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg7}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg7}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg8}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg8}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg9}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg9}">
                </div>

                <div>
                    <img src="<%=request.getContextPath()%>/assets/pic/subP/${sub.subImg10}" onerror="handleImageError(this);">
                    <input type="file">
                    <input type="hidden" value="${sub.subImg10}">
                </div>


                <button type="submit">Cập nhật</button>
            </form>
        </div>
    </div>
</main>
<script>

    function handleImageError(imgElement) {
        imgElement.src = "assets/pic/products/empty_img"; // Thay đổi src sang ảnh mặc định onerror="handleImageError(this);"
        imgElement.alt = "Không thể tải hình ảnh gốc"; // Cập nhật thuộc tính alt
    }
</script>
</script>
</body>
</html>
