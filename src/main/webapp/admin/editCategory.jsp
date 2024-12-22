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
            <h1>Thêm danh mục</h1>
        </div>
        <div id="addNewCate-container">
            <div class="row align-items-center">
                <%--                action="<%= request.getContextPath()%>/update-cate"--%>
                <form id="form-editCate" method="post" onsubmit="updateCate(); return false">
                    <div class="row">
                        <span class="msg text-success"></span>
                        <input hidden="hidden" value="${cate.id}" name="id">
                        <div class="col">

                            <input value="${cate.name}" id="name" name="name" type="text" class="form-control"
                                   aria-label="First name" required>
                            <input type="hidden" value="${cate.cateImg}" id="temp" name="temp">
                            <input value="${cate.cateImg}" id="cateImg" name="cateImg" type="file"
                                   class="form-control"
                                   aria-label="Last name"
                            >
                        </div>

                        <div class="col">
                            <img id="imgCate" style="width: 150px;"
                                 src="<%=request.getContextPath()%>/assets/pic/products/${cate.cateImg}">
                        </div>
                    </div>
                    <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm px-5 py-2">Cập nhật
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function updateCate() {
        const contextPath = "<%=request.getContextPath()%>";
        let name = $("input[name='name']").val();
        let id = $("input[name='id']").val();
        let img = $("input[name='cateImg']").val().split("\\").pop();

        if (img === "") {
            img = $("input[name='temp']").val().trim();
        }

        $.ajax({
            url: 'update-cate',
            method: 'POST',
            data: {
                id: id,
                name: name,
                img: img
            },
            success: function (data) {
                let img = data.img;
                let imgSrc = contextPath + "/assets/pic/products/" + img
                $("#imgCate").attr("src", imgSrc)
                console.log(data.nameCate);
                $("input[name='name']").val(data.nameCate);
                $(".msg").text("Thêm thành công")
            },
            error: function () {
                alert("Có lỗi khi chỉnh sửa")
            }

        })

    }


</script>
</body>
</html>
