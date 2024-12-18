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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleListReviews.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Danh sách đánh giá</h1>
        </div>
        <div id="list-reviews-container">
            <div class="list-reviews">

                <table id="myTable" class="display" style="width:100%; color: #fff">
                    <thead>
                    <tr>
                        <th>Tên người dùng</th>
                        <th>Số điện thoại</th>
                        <th>Mã sản phẩm</th>
                        <th>Đánh giá</th>
                        <th>Sao</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${reviews}" var="o">
                        <tr>
                            <td>${o.customerName}</td>
                            <td></td>
                            <td>${o.productID}</td>
                            <td>${o.comment}</td>
                            <td>${o.rating}</td>
                            <td>
                                <c:if test="${o.display == 0}">
                                    <p class="text-warning mx-0 my-0"> Chưa duyệt</p>
                                </c:if>

                                <c:if test="${o.display == 1}">
                                    <p class="text-info mx-0 my-0" data-id="${o.reviewID}"> Đã duyệt</p>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${o.display == 0}">
                                    <form class="d-inline-block modify-re" data-id="${o.reviewID}"
                                          method="post">
                                        <input name="choice" type="hidden" value="1">
                                        <button type="submit" class="btn btn-info btn-customize" role="button">Duyệt
                                        </button>
                                    </form>
                                </c:if>

                                <c:if test="${o.display == 1}">
                                    <form class="d-inline-block modify-re" data-id="${o.reviewID}"
                                          method="post">
                                        <input name="choice" type="hidden" value="0">
                                        <button type="submit" class="btn btn-warning btn-customize" role="button">Ẩn
                                        </button>
                                    </form>
                                    <form class="d-inline-block modify-re" data-id="${o.reviewID}"
                                          method="post">
                                        <input name="choice" type="hidden" value="-1">
                                        <button type="submit" class="btn btn-danger btn-customize" role="button">Xóa
                                        </button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<script src="<%= request.getContextPath()%>/assets/js/search.js"></script>
<script>

    $(".modify-re").on("submit", function () {
        event.preventDefault();
        let form = $(this);
        let rID = $(this).data("id");
        let choice = parseInt($(this).find('input[name="choice"]').val());
        // console.log(rID + ' ' + choice);

        $.ajax({
            url: "modify-review",
            type: "post",
            data: {
                rID: rID,
                choice: choice
            },
            success: function (response) {
                if (response.isSuccess) {
                    location.reload()
                }
            },
            error: function (status, error) {
                console.log("Error: " + error);
            }
        })
    });

</script>
</body>
</html>
