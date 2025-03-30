<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Tất cả người dùng</title>
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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAllUser.css"/>
</head>

<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Tất cả người dùng</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
               href="<%=request.getContextPath()%>/admin/addUser.jsp" role="button">Thêm</a>
            <table id="myTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th></th>
                    <th>Người dùng</th>
                    <th>ID người dùng</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ cá nhân</th>
                    <th>Địa chỉ vận chuyển</th>
                    <th>Vai trò</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listC}" var="o">
                    <tr>
                        <td><img src="<%= request.getContextPath()%>/assets/pic/capy.jpg" alt=""/></td>
                        <td>${o.name}</td>
                        <td>${o.id}</td>
                        <td>${o.phone}</td>
                        <td>${o.email}</td>
                        <td> ${o.address} </td>
                        <td> ${o.addressShipping} </td>
                        <td>
                            <c:if test="${o.role == 1}">
                                <p style="padding: 4px" class="bg-info text-dark text-center mx-0 my-0 rounded">
                                    Admin</p>
                            </c:if>
                            <c:if test="${o.role == 0}">
                                Người dùng
                            </c:if>
                        </td>
                        <td style="width: 200px">
                                <%--   EditUser --%>
                            <a class="btn btn-success btn-customize"
                               href="<%= request.getContextPath()%>/admin/edit-user?cusID=${o.id}" role="button">Chỉnh
                                sửa</a>
                                <%--   DeleteUser--%>
                            <a class="btn btn-danger btn-customize"
                               href="<%= request.getContextPath()%>/admin/delete-user?cID=${o.id}"
                               onclick="confirmDelete(this)" role="button">Khóa</a>

                                <%--   ResetPassword --%>
                                <%--   Đưa mk về 0 --%>
<%--                            <a class="btn btn-warning btn-customize"--%>
<%--                               href="<%= request.getContextPath()%>/admin/reset-password?cID=${o.id}"--%>
<%--                               onclick="confirmDelete(this)" role="button">Reset pass</a>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>
    </div>
</div>

<script>
    function confirmDelete(param) {
        if (!confirm("Bạn có chắc chắn muốn thực hiện hành động này?")) {
            event.preventDefault(); // Hủy bỏ hành động mặc định
        }
    }

</script>
</body>
</html>
