<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Thêm lô hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAllInventory.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
  <div class="main-container">
    <div class="header">
      <h1>Thêm lô hàng</h1>
    </div>
    <form action="<%=request.getContextPath()%>/admin/addBatch" method="post">
      <div class="mb-3">
        <label for="productID" class="form-label">Sản phẩm</label>
        <select class="form-select" id="productID" name="productID" required>
          <c:forEach items="${products}" var="product">
            <option value="${product.productID}">${product.productName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="mb-3">
        <label for="batchNumber" class="form-label">Mã lô</label>
        <input type="text" class="form-control" id="batchNumber" name="batchNumber" required/>
      </div>
      <div class="mb-3">
        <label for="quantity" class="form-label">Số lượng</label>
        <input type="number" class="form-control" id="quantity" name="quantity" required/>
      </div>
      <div class="mb-3">
        <label for="importDate" class="form-label">Ngày nhập</label>
        <input type="date" class="form-control" id="importDate" name="importDate" required/>
      </div>
      <div class="mb-3">
        <label for="expiryDate" class="form-label">Hạn sử dụng</label>
        <input type="date" class="form-control" id="expiryDate" name="expiryDate"/>
      </div>
      <div class="mb-3">
        <label for="supplierID" class="form-label">Nhà cung cấp</label>
        <select class="form-select" id="supplierID" name="supplierID">
          <option value="">Không có</option>
          <c:forEach items="${suppliers}" var="supplier">
            <option value="${supplier.supplierID}">${supplier.supplierName}</option>
          </c:forEach>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Thêm lô hàng</button>
    </form>
  </div>
</div>
</body>
</html>