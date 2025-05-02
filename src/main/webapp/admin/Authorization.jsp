<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phân quyền</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
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
</head>
<body class="">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Hiển thị danh mục</h1>
        </div>
        <div class="container mt-5">
            <h2>Quản lý phân quyền hệ thống</h2>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="role-permission-tab" data-bs-toggle="tab"
                            data-bs-target="#role-permission" type="button" role="tab">Gán quyền
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="user-role-tab" data-bs-toggle="tab" data-bs-target="#user-role"
                            type="button"
                            role="tab">Gán vai trò
                    </button>
                </li>
            </ul>

            <div class="tab-content pt-3">
                <!-- GÁN QUYỀN CHO ROLE -->
                <div class="tab-pane fade show active" id="role-permission" role="tabpanel">
                    <form method="post" action="<%=request.getContextPath()%>/admin/show-auth">
                        <div class="mb-3">
                            <label>Chọn vai trò:</label>
                            <select name="roleID" class="form-select w-50" onchange="this.form.submit()">
                                <option disabled selected class="text-center">---Vui lòng chọn---</option>
                                <c:forEach var="r" items="${roles}">
                                    <option value="${r.roleID}" ${r.roleID == selectedRoleID ? 'selected' : ''}>${r.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <table class="table table-bordered">
                            <thead class="table-light">
                            <tr>
                                <th>Chức năng</th>
                                <c:forEach var="act" items="${actions}">
                                    <th>${act.name}</th>
                                </c:forEach>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="func" items="${functions}">
                                <tr>
                                    <td>${func}</td>
                                    <c:forEach var="act" items="${actions}">
                                        <td>
                                            <c:set var="permID" value=""/>
                                            <c:forEach var="perm" items="${allPermissions}">
                                                <c:if test="${perm.functionName == func && perm.actionID == act.actionID}">
                                                    <c:set var="permID" value="${perm.permissionID}"/>
                                                </c:if>
                                            </c:forEach>

                                            <c:set var="isChecked" value="false"/>
                                            <c:forEach var="ap" items="${assignedPermissions}">
                                                <c:if test="${ap.permissionID == permID}">
                                                    <c:set var="isChecked" value="true"/>
                                                </c:if>
                                            </c:forEach>

                                            <input type="checkbox" name="permissions" value="${permID}"
                                                   <c:if test="${isChecked}">checked</c:if> />

                                        </td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                        <button type="submit" class="btn btn-primary">Lưu quyền</button>
                    </form>
                </div>

                <!-- GÁN ROLE CHO USER -->
                <%--        <div class="tab-pane fade" id="user-role" role="tabpanel">--%>
                <%--            <form method="post" action="/admin/assign-role">--%>
                <%--                <div class="mb-3">--%>
                <%--                    <label>Chọn người dùng:</label>--%>
                <%--                    <select name="customerID" class="form-select w-50">--%>
                <%--                        <c:forEach var="cus" items="${customers}">--%>
                <%--                            <option value="${cus.customerID}" ${cus.customerID == selectedCustomerID ? 'selected' : ''}>${cus.username}</option>--%>
                <%--                        </c:forEach>--%>
                <%--                    </select>--%>
                <%--                </div>--%>

                <%--                <div class="mb-3">--%>
                <%--                    <label>Chọn vai trò:</label><br />--%>
                <%--                    <c:forEach var="r" items="${roles}">--%>
                <%--                        <div class="form-check">--%>
                <%--                            <input class="form-check-input" type="checkbox" name="roleIDs" value="${r.roleID}"--%>
                <%--                                   <c:if test="${fn:contains(customerRoleIDs, r.roleID)}">checked</c:if> />--%>
                <%--                            <label class="form-check-label">${r.name}</label>--%>
                <%--                        </div>--%>
                <%--                    </c:forEach>--%>
                <%--                </div>--%>

                <%--                <button type="submit" class="btn btn-primary">Gán vai trò</button>--%>
                <%--            </form>--%>
                <%--        </div>--%>
            </div>

            <div class="my-3">
                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkAll(true)">Chọn tất cả
                </button>
                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="checkAll(false)">Bỏ chọn tất
                    cả
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function checkAll(checked) {
        document.querySelectorAll('#role-permission input[type="checkbox"]').forEach(cb => cb.checked = checked);
    }
</script>
</body>
</html>
