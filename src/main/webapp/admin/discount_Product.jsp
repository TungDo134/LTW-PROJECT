<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/3/2025
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giảm giá sản phẩm</title>
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

    <!-- Css -->
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleDiscountProduct.css">
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <%--        <div class="header">--%>
        <%--            <h1>Danh sách sản phẩm được giảm giá</h1>--%>
        <%--        </div>--%>
        <div class="container mt-4">
            <h2 class="mb-4">Quản lý Giảm Giá Sản Phẩm</h2>

            <label for="discountSelect" class="form-label">Chọn mã giảm giá:</label>
            <select id="discountSelect" class="form-select mb-3">
                <option value="" disabled selected>
                    Tất cả mã giảm
                </option>
                <option value="custom">NHẬP MÃ MỚI</option>
                <c:forEach items="${list_discount}" var="d">
                    <c:choose>

                        <c:when test="${d.discountType == 'Percent'}">
                            <option value="${d.discountID}"> Giảm ${d.discountValue} %</option>
                        </c:when>

                        <c:when test="${d.discountType == 'FixedAmount'}">
                            <f:setLocale value="vi_VN"/>

                            <option value="${d.discountID}">
                                Giảm <f:formatNumber value="${d.discountValue}" type="currency"/>
                            </option>
                        </c:when>
                    </c:choose>

                </c:forEach>

            </select>

            <div id="customDiscountDiv" class="mb-3 d-none">
                <input type="text" id="customDiscount" class="form-control" placeholder="Nhập mã giảm giá mới">
            </div>

            <label for="categorySelect" class="form-label">Chọn danh mục:</label>
            <select required="" id="categorySelect" class="form-select mb-3">
                <option value="" disabled selected>
                    Tất cả danh mục
                </option>
                <c:forEach items="${list_cate}" var="o">
                    <option value="${o.id}">${o.name}</option>
                </c:forEach>

            </select>

            <table  class="table table-bordered">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll"></th>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Danh mục</th>
                </tr>
                </thead>
                <tbody id="productTable">
                <tr data-category="1">
                    <td><input type="checkbox" class="product-checkbox" value="1"></td>
                    <td>Áo Thun</td>
                    <td>200,000 VND</td>
                    <td>Áo Thun</td>
                </tr>
                </tbody>
            </table>

            <button class="btn btn-primary" id="applyDiscountBtn">Áp dụng</button>
        </div>
    </div>
</div>
<script>
    document.getElementById("discountSelect").addEventListener("change", function () {
        document.getElementById("customDiscountDiv").classList.toggle("d-none", this.value !== "custom");
    });

    document.getElementById("selectAll").addEventListener("change", function () {
        document.querySelectorAll(".product-checkbox").forEach(cb => cb.checked = this.checked);
    });

    document.getElementById("categorySelect").addEventListener("change", async function () {
        let cateId = document.getElementById("categorySelect").value;
        let url = `${pageContext.request.contextPath}/admin/load-cate-discount`;
        console.log(cateId);


        let response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "cateId=" + encodeURIComponent(cateId),
        });

        let product = await response.json();
        // Gọi hàm cập nhật giao diện
        updateProductTable(product,cateId);

        // try {
        //     if (result.isSuccess) {
        //         alert("Gửi về servlet thành công");
        //     } else {
        //         alert(result.error);
        //     }
        // } catch (error) {
        //     alert(error)
        // }
    });
</script>
<script src="../assets/js/load-productbycate-discount.js"></script>
</body>
</html>
