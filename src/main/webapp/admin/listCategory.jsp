<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Danh sách danh mục</title>
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
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleListCate.css"/>
</head>
<body class="dark-theme">
<%
    String message = (String) request.getAttribute("msg");
%>
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Hiển thị danh mục</h1>
        </div>
        <div class="add-voucher" style="margin-bottom: 1rem">
            <form action="<%= request.getContextPath()%>/add-newCate" method="post">
                <div class="row">
                    <p class="text-danger"><%=message != null ? message : "" %>
                    </p>
                    <div class="col col-2">
                        <label class="pb-2" id="nameCate" for="nameCate">Tên danh mục</label>
                        <input name="nameCate" type="text" class="form-control" placeholder="Tên danh mục"
                               aria-label="Last name">
                    </div>
                    <div class="col col-2">
                        <label class="pb-2" for="imgCate">Tên danh mục</label>
                        <input id="imgCate" name="imgCate" type="file" class="form-control" placeholder="Ảnh danh mục"
                               aria-label="First name">
                    </div>

                </div>
                <button style="margin-top: 1rem" type="submit" class="btn btn-primary btn-sm">Thêm danh mục</button>
            </form>
        </div>
        <div id="list-cate-container">
            <div class="cate-list">
                <table id="myTable" class="display" style="width:100%">
                    <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Danh mục</th>
                        <th>ID danh mục</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listC}" var="o">
                        <tr>
                            <td><img src="<%=request.getContextPath()%>/assets/pic/products/${o.cateImg}" alt=""></td>
                            <td>${o.name}</td>
                            <td>${o.id}</td>
                            <td>
                                <a class="btn btn-success btn-customize"
                                    <%-- GetOneCategory --%>
                                   href="<%=request.getContextPath()%>/admin/get-cate?cID=${o.id}" role="button">Chỉnh
                                    sửa</a>

                                    <%-- DeleteCate --%>
                                <a class="btn btn-danger btn-customize"
                                   href="<%=request.getContextPath()%>/admin/delete-cate?cID=${o.id}"
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
        if (!confirm("Bạn có chắc chắn muốn thực hiện hành động này?" +'\n'+
            "Điều này sẽ xóa hết sản phẩm có thể loại này")) {
            event.preventDefault(); // Hủy bỏ hành động mặc định
        }
    }

</script>
</body>
</html>
