<%@ page import="entity.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/14/2024
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm người dùng</title>
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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddUser.css">
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<%
    String customerName = (String) request.getAttribute("customerName");
    String email = (String) request.getAttribute("email");
    String pass = (String) request.getAttribute("pass");
    String phone = (String) request.getAttribute("phone");
    String address = (String) request.getAttribute("address");
%>

<main id="main-content">
    <div class="main-container">
        <div class="container">
            <h1>Thêm người dùng</h1>
            <span class="text-info" id="message">  </span>

            <%-- AddUser --%>
            <form id="myForm">

                <label for="username">Tên đăng nhập</label>
                <input type="text" value="<%=customerName == null?"":customerName%>" id="username" name="username"
                       placeholder="Nhập tên người dùng" required>

                <label for="email">Email</label>
                <input type="email" value="<%=email == null?"":email%>" id="email" name="email"
                       placeholder="Nhập email người dùng" required>

                <label for="password">Mật khẩu</label>
                <input type="password" value="<%=pass == null?"":pass%>" id="password" name="password"
                       placeholder="Nhập password người dùng" required>

                <label for="numberPhone">Số điện thoại</label>
                <input type="tel" value="<%=phone == null?"":phone%>" id="numberPhone" name="numberPhone"
                       placeholder="Nhập số điện thoại người dùng">

                <label for="Address">Địa chỉ</label>
                <input type="text" value="<%=address == null?"":address%>" id="Address" name="address"
                       placeholder="Nhập địa chỉ người dùng">

                <label for="role">Vai trò</label>
                <select id="role" name="role" required>
                    <option value="0">Người dùng</option>
                    <option value="1">Admin</option>
                </select>

                <button type="submit">Thêm người dùng</button>
            </form>
        </div>
    </div>
</main>

<script>
    // Add user (ajax)
    document.querySelector('#myForm').addEventListener('submit', async function (e) {
        e.preventDefault()

        // lấy data từ form
        let formData = new URLSearchParams(new FormData(this))
        let url = '${pageContext.request.contextPath}/admin/add-user'

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    'Content-type': 'application/x-www-form-urlencoded'
                },
                body: formData
            })

            // xử lí logic
            let rs = await response.json();
            if (rs.isSuccess) {
                notify(rs.isSuccess)
            } else {
                notify(rs.isSuccess, rs.msg)
            }
        } catch (error) {
            console.log(error)
        }

    })

    // hàm thông báo trạng thái cập nhật
    function notify(valid, msg) {
        if (valid) {
            document.getElementById("message").textContent = 'Thêm thành công'
            setTimeout(function () {
                document.getElementById("message").textContent = "";
            }, 5000)
        } else {
            document.getElementById("message").classList.replace("text-info", "text-danger");
            document.getElementById("message").textContent = msg
            setTimeout(function () {
                document.getElementById("message").classList.replace("text-danger", "text-info");
                document.getElementById("message").textContent = "";
            }, 5000)
        }
    }
</script>
</body>

</html>
