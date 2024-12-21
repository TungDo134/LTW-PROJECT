<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/2024
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa Thông Tin Người Dùng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styleEditProfile.css">
</head>
<body>
<div class="Page-profile">
    <main class="container-profile">
        <div class="content">
            <div class="main-profile-container">
                <h1 class="title-profile" style="text-transform: uppercase">chỉnh sửa thông tin cá nhân</h1>
                <form action="update-user-client" method="POST" class="edit-form">
                    <div class="form-group">
                        <input type="hidden" id="email" name="email" value="${cus.email}">
                    </div>
                    <div class="form-group">
                        <label for="name">Họ và tên:</label>
                        <input type="text" id="name" name="name" value="${cus.name}" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Số điện thoại:</label>
                        <input type="text" id="phone" name="phone" value="${cus.phone}" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ cá nhân:</label>
                        <input type="text" id="address" name="address" value="${cus.address}" required>
                    </div>

                    <div class="form-group">
                        <label for="addressShipping">Địa chỉ vận chuyển:</label>
                        <input type="text" id="addressShipping" name="addressShipping" value="${cus.addressShipping}"
                               required>
                    </div>

                    <div class="form-group">
                        <%--<label for="role">Mật khẩu:</label>--%>
                        <%--<input type="hidden" id="password" name="password" value="${cus.pass}">--%>
                        <input type="hidden" id="role" name="role" value="${cus.role}" required>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="save-btn">Lưu thay đổi</button>
                        <a type="button" class="cancel-btn" href="load-profile">Hủy
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>


