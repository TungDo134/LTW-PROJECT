<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Kho</title>

    <!-- Bootstrap  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"/>

    <!-- Google Icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"/>

    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAllInventory.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách Sản phẩm kho</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
               href="<%=request.getContextPath()%>/admin/addWarehouse.jsp" role="button">Thêm</a>

            <table id="myTable" class="">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Sản phẩm</th>
                    <th>Hàng tồn kho</th>
                    <th>Đã Bán</th>
                    <th>Đang xử lý</th>
                    <th>Đề Xuất Nhập Kho</th>
                    <th>Thời gian cập nhật</th>
                    <th>Trạng thái</th>

                </tr>
                </thead>
                <tbody>
                <!-- Lặp qua danh sách nhà sản xuất -->
                <c:forEach items="${inventories}" var="in" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${in.productName}</td>
                        <td>${in.quantityInStock}</td>
                        <td>${in.quantitySold}</td>
                        <td>${in.quantityReserved}</td>
                        <td>${in.reorderLevel}</td>
                        <td>${in.lastUpdated}</td>

                        <td>
                            <a class="btn btn-warning btn-sm" href="<%=request.getContextPath()%>/admin/add-stock-page?productID=${in.productID}">Nhập kho</a>
                            <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/admin/edit-warehouse?productID=${in.productID}">Sửa</a>
                            <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/admin/deleteInventoryItem?productID=${in.productID}" onclick="return confirmDelete();">Xoá</a>
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
        return confirm("Bạn có chắc chắn muốn xoá sản phẩm này ra khỏi kho?");
    }
</script>
</body>
</html>
