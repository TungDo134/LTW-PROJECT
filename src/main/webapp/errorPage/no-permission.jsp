<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/5/2025
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vuợt mức pickeball</title>
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
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/error/no-permission.css"/>
</head>
<body>
<div class="message">Bạn không có quyền truy cập vào trang này.
</div>
<div class="message2">Vui lòng liên hệ quản trị viên nếu đây là sự nhầm lẫn hoặc
    <a class="text-info" href="<%=request.getContextPath()%>/forms/login.jsp">đăng nhập</a> nếu bạn chưa đăng nhập.
    <div class="mt-2">
        <a class="btn btn-info" onclick="history.back()">Quay về</a>
        <a class="btn btn-info" href="<%=request.getContextPath()%>/home">Trang chủ</a>
    </div>
</div>
<div class="container-content">
    <div class="neon">403</div>
    <div class="door-frame">
        <div class="door">
            <div class="rectangle">
            </div>
            <div class="handle">
            </div>
            <div class="window">
                <div class="eye">
                </div>
                <div class="eye eye2">
                </div>
                <div class="leaf">
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
