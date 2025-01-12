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
        #form-sub {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            row-gap: 2rem;
        }

        button {
            width: 100%;
            height: 50px;
        }

        img {
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


            <form id="form-sub">
                <c:forEach var="o" items="${sub}" varStatus="status">
                    <div>
                        <img src="<%=request.getContextPath()%>/assets/pic/subP/${o}" onerror="handleImageError(this);">
                        <input type="file">
                        <input type="text" name="oldImg" value="${o}" data-id="${status.index}">
                    </div>
                </c:forEach>


                <input id="subImg" type="hidden" value="">
                <input id="subId" type="hidden" value="${subId}">
                <button type="button" onclick="pushData()">Cập nhật</button>
            </form>
        </div>
    </div>
</main>
<script>

    function handleImageError(imgElement) {
        const contextPath = "<%=request.getContextPath()%>";
        imgElement.src = contextPath + "/assets/pic/subP/empty_img"; // Thay đổi src sang ảnh mặc định onerror="handleImageError(this);"
        imgElement.alt = "Không thể tải hình ảnh gốc"; // Cập nhật thuộc tính alt
    }


    function getData() {
        let arrayImg = [];
        // $("input[name='oldImg']").each(function () {
        //     let nameImg = $(this).val().trim();
        //     if (nameImg !== "") {
        //         arrayImg.push(nameImg);
        //     }
        // });


        $("input[type='file']").each(function () {
            let nameImg = $(this).val().trim();
            if (nameImg !== "") {
                arrayImg.push(nameImg.match(/[^\\/]+$/)[0]);
            } else {
                arrayImg.push(null)
            }
        });
        console.log("mang sau khi lay value cua file: " + arrayImg);

        for (let i = 0; i < arrayImg.length; i++) {
            let dataId;
            if (arrayImg[i] === null) { // Sử dụng === để so sánh chặt chẽ
                dataId = $("input[data-id='" + i + "']").val();
                arrayImg[i] = dataId; // Gán trực tiếp vào phần tử hiện tại của mảng
            }
        }
        console.log("mang sau khi lay value cua oldImg: " + arrayImg);

        return arrayImg;
    }

    function pushData() {
        // Duyệt qua mảng và cộng dồn tên của từng tệp vào value của ô input
        getData().forEach((file) => {
            let currentValue = $("#subImg").val();  // Lấy giá trị hiện tại của ô input
            // Cập nhật lại giá trị, nối tên tệp vào hiện tại
            $("#subImg").val(currentValue + file + ',');
        });

        let subImg =
            $.ajax({
                url: 'update-sub-img',
                method: 'post',
                data: {
                    subImg: $("#subImg").val(),
                    subId: $("#subId").val()
                },
                success: function (response) {
                    alert("cập nhật thành công")
                },
                error: function (xhr, status, error) {
                    console.error("Error occurred:", status, error);
                }
            })

        console.log("Do dai cu mang: " + getData().length);
        console.log("Mang ten gom: " + $("#subImg").val());
    }


    // getData();
</script>

</body>
</html>
