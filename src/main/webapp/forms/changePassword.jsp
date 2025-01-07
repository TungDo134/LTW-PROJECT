<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đăng Ký</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styleChangePass.css"/>
</head>
<body>
<div class="login-signup-container">
    <main class="login-signup">
        <div class="signup">
            <label class="title">
                Đổi mật khẩu
            </label>
            <form action="<%= request.getContextPath() %>/change-password" method="post" class="form">
                <div class="form-group">
                    <input id="password" name="password" type="password" placeholder="Mật khẩu cũ" class="form-control"
                           required/>
                </div>
                <div class="form-group">

                    <input id="newPassword" name="newPassword" type="password" placeholder="Mật khẩu mới"
                           class="form-control" required/>
                </div>
                <div class="form-group">
                    <input id="rePassword" name="rePassword" type="password" placeholder="Nhập lại mật khẩu"
                           class="form-control" required/>
                </div>
                <button type="submit">Đổi mật khẩu</button>
                <span style="color: darkred;">
                    <%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %>
                </span>
            </form>

        </div>
    </main>
</div>
</body>
</html>
