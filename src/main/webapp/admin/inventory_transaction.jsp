<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Quản lý giao dịch kho</title>
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
      <h1>Danh sách giao dịch kho</h1>
    </div>
    <div id="all-user-container">
      <a class="btn btn-primary btn-customize px-5 py-2 mb-2"
         href="<%=request.getContextPath()%>/admin/addTransaction.jsp" role="button">Thêm giao dịch</a>

      <table  class="myTable display">
        <thead>
        <tr>
          <th>STT</th>
          <th>Loại giao dịch</th>
          <th>Sản phẩm</th>
          <th>Số lượng</th>
          <th>Đơn hàng chi tiết</th>
          <th>Mô tả</th>
          <th>Người thực hiện</th>
          <th>Thời gian</th>
          <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${transactions}" var="transaction" varStatus="i">
          <tr>
            <td>${i.index + 1}</td>
            <td>${transaction.transactionType}</td>
            <td>${transaction.productName}</td>
            <td>${transaction.quantity}</td>
            <td>${transaction.orderDetailID != null ? transaction.orderDetailID : 'N/A'}</td>
            <td>${transaction.description != null ? transaction.description : 'N/A'}</td>
            <td>${transaction.createdByName != null ? transaction.createdByName : 'N/A'}</td>
            <td>${transaction.createdAt}</td>
            <td>
              <a class="btn btn-success btn-sm" href="<%=request.getContextPath()%>/admin/editTransaction?transactionID=${transaction.transactionID}">Sửa</a>
              <a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/admin/deleteTransaction?transactionID=${transaction.transactionID}" onclick="return confirmDelete();">Xóa</a>
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
    return confirm("Bạn có chắc chắn muốn xóa giao dịch này?");
  }
</script>
</body>
</html>