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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleFeedback.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách phản hồi</h1>
        </div>

        <div id="list-feedback-container">
            <div class="list-feedback">
                <table id="myTable" class="display" style="width:100%;color: #fff">
                    <thead>
                    <tr>
                        <th>Nguời gửi phản hồi</th>
                        <th>Email</th>
                        <th>Phản hồi</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listF}" var="o">
                        <tr data-id=${o.fID}>
                            <td>${o.customerName}</td>
                            <td>${o.email}</td>
                            <td> ${o.fContent}</td>
                            <td>
                                    <%-- DeleteFeedback--%>
                                <a class="btn btn-danger btn-customize"
                                    <%--  href="<%=request.getContextPath()%>/admin/delete-feedback?fID=${o.fID}"--%>
                                   onclick="confirmDelete(${o.fID}, this)"
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

<%--Ajax delete feedback--%>
<script>
    async function confirmDelete(id, button) {
        if (!confirm("Bạn có chắc chắn muốn xóa không?")) return;
        let url = `${pageContext.request.contextPath}/admin/delete-feedback?fID=` + id;
        try {
            let response = await fetch(url, {method: 'Get'});
            let data = await response.json();
            if (data.isSuccess) {
                let table = $("#myTable").DataTable();
                let row = table.row("tr[data-id='" + id + "']");
                row.remove().draw(false);
                alert("Xóa thành công!");
            } else {
                alert("Có lỗi xảy ra!");
            }
        } catch (error) {
            console.error("Có lỗi xảy ra:", error);
        } finally {
            button.disabled = false;
            button.innerText = "Xóa";
        }
    }
</script>
</body>
</html>
