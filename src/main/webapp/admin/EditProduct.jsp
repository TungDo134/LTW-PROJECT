<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddProduct.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>

<div id="main-content">
    <div class="main-container">
        <div class="items-center">
            <h3>Chỉnh sửa Sản Phẩm</h3>
            <h4 class="text-danger"><%=request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %>
            </h4>
        </div>
        <div class="addproduct-container">
            <div class="content-inner">
                <div class="content-wrap">
                    <div class="wrapper">
                        <%--    UpdateProduct  --%>
                        <form action="<%=request.getContextPath()%>/admin/update-product" class="form-add-product"
                              method="post">
                            <div class="wg-box">
                                <fieldset class="name">
                                    <div class="body-title">
                                        Tên sản phẩm

                                    </div>
                                    <input
                                            value="${p.productName}"
                                            name="productName"

                                            type="text"
                                            placeholder="Vd: Bút bi xanh"
                                    />

                                </fieldset>
                                <input type="hidden" value="${p.productID} " name="id">
                                <div class="cols">
                                    <fieldset class="Category">

                                        <div class="select">
                                            <label class="body-title" for="cateID">Vai trò </label>
                                            <select name="cateID" id="cateID">
                                                <c:forEach items="${listCate}" var="c">

                                                    <option value="${c.id}" <c:choose>
                                                        <c:when test="${c.id == cateP}">selected="selected"</c:when>

                                                    </c:choose>>
                                                            ${c.name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </fieldset>
                                    <fieldset class="Gender">
                                        <div class="body-title">
                                            Giá sản phẩm

                                        </div>
                                        <div class="select">
                                            <input
                                                    name="productPrice"
                                                    type="text"
                                                    placeholder="Vd: 100000"
                                                    value="${p.productPrice}"
                                            />
                                        </div>
                                    </fieldset>
                                </div>

                                <fieldset class="description">
                                    <div class="body-title">
                                        Mô tả

                                    </div>
                                    <textarea

                                            name="productDes"
                                            placeholder="Mô tả"
                                    > ${des}</textarea>

                                </fieldset>
                            </div>
                            <div class="wg-box">
                                <img id="imgCate" style="width: 150px;"
                                     src="<%=request.getContextPath()%>/assets/pic/products/${p.productImage}">
                                <fieldset>
                                    <div class="body-title">Tải hình ảnh lên</div>
                                    <input id="cateImg" type="file" name="productImage" value="" onchange="loadImg()"/>
                                    <input type="hidden" name="oldImg" value="${p.productImage}">
                                    <div class="body-text">

                                    </div>
                                </fieldset>
                                <div class="cols">
                                    <fieldset class="name">
                                        <div class="body-title">
                                            Tổng sản phẩm
                                        </div>

                                        <div class="select">
                                            <input

                                                    type="text"
                                                    name="productInventory"
                                                    value="${p.productInventory}"
                                                    id=""
                                                    placeholder="Vd: 100"
                                            />
                                        </div>
                                    </fieldset>
                                    <fieldset class="name">
                                        <div class="body-title">
                                            Miêu tả ngắn về sản phẩm
                                        </div>
                                        <div class="select">
                                            <input type="text" name="shortDes" value="${p.shortDes }"/>
                                        </div>
                                    </fieldset>

                                    <fieldset class="name">
                                        <div class="body-title">
                                            số hàng đã đặt
                                        </div>
                                        <div class="select">
                                            <input type="text" name="productOrder"
                                                   value="${p.productOrder }"/>
                                        </div>
                                    </fieldset>

                                    <fieldset class="name">
                                        <div class="body-title">
                                            Tồn kho
                                        </div>
                                        <div class="select">
                                            <input type="text" name="productStock"
                                                   value="${p.productStock }"/>
                                        </div>
                                    </fieldset>

                                </div>
                                <div class="col">
                                    <button class="btn1" type="submit">Cập nhật sản phẩm</button>
                                    <%--  LoadProductAdmin --%>
                                    <a href="load-pAdmin" class="btn1 text-white bg-success" type="submit">Quay lại</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function loadImg() {
        const contextPath = "<%=request.getContextPath()%>";
        let preImg = $("#cateImg").val().trim().split("\\").pop();
        let imgSrc = contextPath + "/assets/pic/products/" + preImg
        $("#imgCate").attr("src", imgSrc)
    }
</script>
</body>
</html>
