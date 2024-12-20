<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2024
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Home Img </title>
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

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleVoucher.css"/>
</head>
<body class="dark-theme">
<%
    String message = (String) request.getAttribute("msg");
%>

<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách ảnh trang chủ</h1>
        </div>
        <div id="list-reviews-container">

            <div class="list-reviews">

                <table id="myTable" class="display" style="width:100%; color: #fff">
                    <thead>
                    <tr>
                        <th>Ảnh banner</th>
                        <th>Ảnh 1</th>
                        <th>Ảnh 2</th>
                        <th>Ảnh 3</th>
                        <th>Ảnh 4</th>
                        <th>Ảnh 5</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listH}" var="o">
                        <tr>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.bannerImg}"/></td>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.img1}"/></td>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.img2}"/></td>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.img3}"/></td>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.img4}"/></td>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/${o.img5}"/></td>
                            <td>
                                <a class="btn btn-success btn-customize"
                                   href="#" role="button">Chỉnh
                                    sửa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


            </div>

        </div>
    </div>
</div>

<script src="<%= request.getContextPath()%>/assets/js/search.js"></script>
</body>
</html>
