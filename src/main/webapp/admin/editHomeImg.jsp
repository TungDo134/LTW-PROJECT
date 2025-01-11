<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Header Example</title>
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

    <!-- jQuery  -->
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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddCate.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Chỉnh sửa ảnh</h1>
        </div>
        <div id="addNewCate-container">
            <div class="row align-items-center">
                <%--    UpdateHomeImg--%>
                <form action="<%= request.getContextPath()%>/admin/update-homePic" method="post">

                    <div class="row">
                        <div class="col">
                            <img id="imgCate" style="width: 150px;"
                                 src="<%=request.getContextPath()%>/assets/pic/homePage/<%=request.getAttribute("value")%>">
                            <input value="<%=request.getAttribute("value")%>" id="cateImg" name="value" type="file"
                                   onchange="loadImg()"
                                   class="form-control"
                                   aria-label="Last name">
                        </div>
                        <div class="col">

                            <input value="<%=request.getAttribute("target")%>" id="name" name="target" type="hidden"
                                   class="form-control"
                                   aria-label="First name">
                        </div>
                    </div>
                    <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm px-5 py-2">Cập nhật
                    </button>
                    <button style="margin-top: 1rem" type="button" class="btn btn-success btn-sm px-5 py-2"><a
                            class="text-white text-decoration-none" href="all-homePic">Quay lại</a></button>

                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function loadImg() {
        const contextPath = "<%=request.getContextPath()%>";
        let preImg = $("#cateImg").val().trim().split("\\").pop();
        let imgSrc = contextPath + "/assets/pic/homePage/" + preImg
        $("#imgCate").attr("src", imgSrc)
    }

</script>
</body>
</html>
