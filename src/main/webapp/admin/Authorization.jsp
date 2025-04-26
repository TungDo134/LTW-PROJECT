<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/25/2025
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phân quyền</title>
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
    <style>
        .nav-tabs .nav-link.active {
            color: var(--bs-nav-tabs-link-active-color) !important;
        }

        .tab-pane.fade > h4 {
            color: var(--Heading);
        }

        #roleSelect {
            background: transparent;
            color: var(--Heading);
        }
    </style>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="container header">
            <h1>Quản lý phân quyền theo chức năng</h1>
        </div>
        <div class="container py-4">
            <!-- Tabs -->
            <ul class="nav nav-tabs mb-3" id="permissionTabs">
                <li class="nav-item">
                    <a class="nav-link text-white active" data-bs-toggle="tab" href="#roles">Vai trò</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" data-bs-toggle="tab" href="#permissions">Quyền hạn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" data-bs-toggle="tab" href="#assign">Gán quyền</a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- Quản lí vai trò -->
                <div class="tab-pane fade show active" id="roles">
                    <h4>Danh sách vai trò</h4>
                    <table id="myTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên vai trò</th>
                            <th>Mô tả</th>
                        </tr>
                        </thead>
                        <tbody id="roleTable">
                        <!-- Data from backend -->
                        <c:forEach items="${roles}" var="r">
                            <tr data-id="${r.id}">
                                <td>${r.id}</td>
                                <td>${r.name}</td>
                                <td>${r.description}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <button class="btn btn-primary">Thêm Vai Trò</button>
                </div>

                <!-- Quản lí quyền -->
                <div class="tab-pane fade" id="permissions">
                    <h4>Danh sách các quyền của hệ thống</h4>
                    <table id="myTable2">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên chức năng</th>
                            <th>Mô tả</th>
                        </tr>
                        </thead>
                        <tbody id="permissionTable">
                        <!-- Data from backend -->
                        <c:forEach items="${permissions}" var="p">
                            <tr data-id="${p.id}">
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.description}</td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                    <button class="btn btn-primary">Thêm Chức Năng</button>
                </div>

                <!-- Phân quyền -->
                <div class="tab-pane fade" id="assign">
                    <h4>Gán quyền cho vai trò</h4>
                    <form id="assignForm">
                        <div class="mb-3">
                            <label for="roleSelect" class="form-label">Vai trò:</label>
                            <select class="form-select" id="roleSelect">
                                <!-- Dynamic roles -->
                                <c:forEach items="${roles}" var="r">
                                    <option value="${r.id}"> ${r.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Chức năng:</label>
                            <div id="permissionCheckboxes">
                                <!-- Dynamic checkboxes -->
                                <table class="myTable">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>ID</th>
                                        <th>Tên chức năng</th>
                                        <th>Mô tả</th>
                                    </tr>
                                    </thead>
                                    <tbody id="productTable">
                                    <c:forEach items="${permissions}" var="p">
                                        <tr data-id="${p.id}">
                                            <td><input type="checkbox"></td>
                                            <td>${p.id}</td>
                                            <td>${p.name}</td>
                                            <td>${p.description}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Lưu gán quyền</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
