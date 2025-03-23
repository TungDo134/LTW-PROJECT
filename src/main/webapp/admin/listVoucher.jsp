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
    <title>Header Example</title>
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
            <h1>Danh sách mã giảm giá</h1>
        </div>
        <div class="add-voucher" style="margin-bottom: 1rem">
            <form id="voucherForm">
                <div class="row">
                    <p class="text-Info"><%=message != null ? message : "" %>
                    </p>
                    <div class="col col-2 ">
                        <label for="code" class="pb-2">Tên mã giảm</label>
                        <input id="code" name="code" type="text" class="form-control" placeholder="Mã giảm"
                               aria-label="First name">
                    </div>
                    <div class="col col-2 ">
                        <label for="discount" class="pb-2">Tỉ lệ giảm</label>
                        <input id="discount" name="discount" type="text" class="form-control"
                               placeholder="Phần trăm giảm "
                               aria-label="Last name">
                    </div>
                </div>
                <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm" >Thêm mã</button>
            </form>
        </div>
        <div id="list-reviews-container">

            <div class="list-reviews">

                <table id="myTable" class="display" style="width:100%; color: #fff">
                    <thead>
                    <tr>
                        <th>Mã giảm giá</th>
                        <th>Tỉ lệ giảm giá</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listV}" var="o">
                        <tr>
                            <td>${o.code}</td>
                            <td>${o.discount}</td>
                            <td>
                                <a class="btn btn-success btn-customize"
                                    <%--  GetOneVoucher--%>
                                   href="<%=request.getContextPath()%>/admin/get-voucher?vID=${o.couponId}"
                                   role="button">Chỉnh
                                    sửa</a>
                                <a class="btn btn-danger btn-customize"
                                    <%-- DeleteVoucher--%>
                                   href="<%=request.getContextPath()%>/admin/delete-voucher?vID=${o.couponId}"
                                   onclick="confirmDelete(this)"
                                   role="button">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>


            </div>

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
<script>
    document.getElementById("voucherForm").addEventListener("submit", async function (event) {
        event.preventDefault(); // Ngăn chặn gửi form mặc định

        const code = document.getElementById("code").value;
        const discount = document.getElementById("discount").value;

        try {
            const response = await fetch('<%= request.getContextPath()%>/admin/add-coupon', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ code, discount })
            });

            if (!response.ok) throw new Error("Lỗi khi thêm mã giảm giá");

            alert("Thêm mã giảm giá thành công!");
            location.reload(); // Reload lại danh sách mã giảm giá
        } catch (error) {
            alert('Lỗi: ' + error.message);
        }
    });


</script>

</body>
</html>
