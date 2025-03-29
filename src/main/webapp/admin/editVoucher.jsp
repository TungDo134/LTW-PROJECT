<%@ page import="entity.Coupon" %><%--
  Created by IntelliJ IDEA.
  User: PC-010F
  Date: 12/9/2024
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Thêm mã giảm giá</title>
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
    <style>
        #message {
            font-size: 20px;
            margin: 0;
            text-transform: uppercase;
        }
    </style>
</head>
<body class="dark-theme">


<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1> Chỉnh sửa mã giảm giá </h1>
        </div>
        <%-- UpdateVoucher--%>
        <form id="myForm">
            <p id="message" class="text-white"></p>
            <div class="row">
                <input hidden="hidden" value="${coupon.couponId}" name="id" id="id">
                <div class="col">
                    <label for="name" class="pb-2">Tên mã giảm</label>
                    <input value="${coupon.code}" id="name" name="code" type="text" class="form-control"
                           aria-label="First name">
                </div>
                <div class="col">
                    <label for="discount" class="pb-2">Giá trị mã giảm</label>
                    <input value="${coupon.discount}" id="discount" name="discount" type="text" class="form-control"
                           aria-label="Last name">
                </div>
            </div>
            <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm">Cập nhật</button>
            <a style="margin-top: 1rem" class="btn btn-primary btn-sm"
               href="<%= request.getContextPath()%>/admin/all-coupon">Quay lại</a>
        </form>
    </div>
</div>
<script>
    document.getElementById("myForm").addEventListener("submit", async function (event) {
        event.preventDefault();
        // lấy data từ form
        let formData = new URLSearchParams(new FormData(this));
        let url = `${pageContext.request.contextPath}/admin/update-voucher`
        let formObj = {};

        for (let [key, value] of formData) {
            formObj[key] = value.trim();

            // Kiểm tra giá trị rỗng và xem giá trị có phải số
            if (!formObj[key] || isNaN(formObj['discount'])) {
                return notify(false)
            } else {
                notify(formObj[key])
            }
        }

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData,
            })

            let result = await response.json();
            if (result.isSuccess) {
                notify(result.isSuccess)
            } else {
                notify(result.isSuccess)
            }
        } catch (error) {
        }
    })

    // hàm thông báo trạng thái cập nhật
    function notify(valid) {
        if (valid) {
            document.getElementById("message").textContent = 'Cập nhật thành công'
            setTimeout(function () {
                document.getElementById("message").textContent = "";
            }, 5000)
        } else {
            document.getElementById("message").classList.replace("text-white", "text-danger");
            document.getElementById("message").textContent = 'Cập nhật thất bại'
            setTimeout(function () {
                document.getElementById("message").classList.replace("text-danger", "text-white");
                document.getElementById("message").textContent = "";
            }, 5000)
        }
    }
</script>
</body>
</html>
