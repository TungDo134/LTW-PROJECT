
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Quản lý lô hàng</title>
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
            <h1>Danh sách lô hàng</h1>
        </div>
        <div id="all-user-container">
            <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
               href="<%=request.getContextPath()%>/admin/addBatch" role="button">Thêm lô hàng</a>

            <table class="myTable display">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã lô</th>
                    <th>Sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Ngày nhập</th>
                    <th>Hạn sử dụng</th>
                    <th>Nhà cung cấp</th>
                    <th>Thời gian tạo</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${batches}" var="batch" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${batch.batchNumber}</td>
                        <td>${batch.productName}</td>
                        <td>${batch.quantity}</td>
                        <td>${batch.importDate}</td>
                        <td>${batch.expiryDate}</td>
                        <td>${batch.supplierName != null ? batch.supplierName : 'N/A'}</td>
                        <td>${batch.createdAt}</td>
                        <td>
                            <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/admin/editBatch?batchID=${batch.batchID}">Sửa</a>
                            <form action="<%=request.getContextPath()%>/admin/deleteBatch" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                                <input type="hidden" name="batchID" value="${batch.batchID}"/>
                                <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                            </form>

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
        return confirm("Bạn có chắc chắn muốn xóa lô hàng này?");
    }
</script>
</body>
</html>
