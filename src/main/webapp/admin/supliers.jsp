
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý nhà cung cấp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAllInventory.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách nhà cung cấp</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
               href="<%=request.getContextPath()%>/admin/addSupplier.jsp" role="button">Thêm nhà cung cấp</a>

            <table class="myTable display">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên nhà cung cấp</th>
                    <th>Thông tin liên hệ</th>
                    <th>Địa chỉ</th>
                    <th>Thời gian tạo</th>
                    <th>Thời gian cập nhật</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${suppliers}" var="supplier" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${supplier.supplierName}</td>
                        <td>${supplier.contactInfo != null ? supplier.contactInfo : 'N/A'}</td>
                        <td>${supplier.address != null ? supplier.address : 'N/A'}</td>
                        <td>${supplier.createdAt}</td>
                        <td>${supplier.updatedAt}</td>
                        <td>
                            <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/admin/editSupplier?supplierID=${supplier.supplierID}">Sửa</a>
                            <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/admin/deleteSupplier?supplierID=${supplier.supplierID}" onclick="return confirmDelete();">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function confirmDelete() {
        return confirm("Bạn có chắc chắn muốn xóa nhà cung cấp này?");
    }
</script>
</body>
</html>
