
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
            <form id="myForm">
                <div class="row">
                    <p id="message" class="text-info"></p>
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
                <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm">Thêm mã</button>
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
                        <tr data-id="${o.couponId}">
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
                                    <%--  href="<%=request.getContextPath()%>/admin/delete-voucher?vID=${o.couponId}"--%>
                                   onclick="confirmDelete(this,${o.couponId})"
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
    const url = `${pageContext.request.contextPath}/admin/add-coupon`
    const url_custom = `${pageContext.request.contextPath}/admin/get-voucher?vID=`
    const url_delete = `${pageContext.request.contextPath}/admin/delete-voucher?vID=`

    document.getElementById("myForm").addEventListener("submit", async function (event) {
        event.preventDefault();

        // lấy data từ form
        let formData = new URLSearchParams(new FormData(this));


        // Duyệt qua cặp key-value trong FormData

        try {
            let response = await fetch(url, {
                method: 'Post',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: formData,
            })

            if (response.ok) {
                let result = await response.json();
                let vId = result.vId;
                let table = $("#myTable").DataTable();
                let actionButtons =
                    "<a class='btn btn-success btn-customize' role='button'>Chỉnh sửa</a> " +
                    "<a class='btn btn-danger btn-customize' onclick='confirmDelete(this, " + vId + ")' role='button'>Xóa</a>"
                let newData = [
                    document.getElementById("code").value.toUpperCase(),
                    document.getElementById("discount").value,
                    actionButtons
                ];
                table.row.add(newData).draw(false);
                document.getElementById("message").textContent = "Thêm thành công"
            } else {

            }
        } catch (error) {
            console.error("Lỗi khi gửi request:", error);
        }
    })


</script>

<script>
    async function confirmDelete(button, vId) {
        if (!confirm("Bạn có chắc chắn muốn xóa không?")) return;
        let url = `${pageContext.request.contextPath}/admin/delete-voucher?vID=` + vId;
        let target = button.parentElement.parentElement
        try {
            let response = await fetch(url, {method: 'Get'});
            let data = await response.json();
            if (data.isSuccess) {
                let table = $("#myTable").DataTable();
                let row = table.row(target);
                row.remove().draw(false);
                alert("Xóa thành công!");
            } else {
                alert("Có lỗi xảy ra!");
            }
        } catch (error) {
            console.error("Có lỗi xảy ra:", error);
        }
    }
</script>
</body>
</html>
