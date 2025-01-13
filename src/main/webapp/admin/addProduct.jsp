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
<%
    String message = (String) request.getAttribute("msg");
%>

<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="items-center">
            <h3>Thêm Sản Phẩm</h3>
            <h4 class="text-info"><%=message != null ? message : "" %>
            </h4>
        </div>
        <div class="addproduct-container">
            <div class="content-inner">
                <div class="content-wrap">
                    <div class="wrapper">

                        <%--    AddProductController    --%>
                        <form action="<%=request.getContextPath()%>/admin/add-product" class="form-add-product"
                              method="post">
                            <div class="wg-box">
                                <fieldset class="name">
                                    <div class="body-title">
                                        Tên sản phẩm
                                        <span>*</span>
                                    </div>
                                    <input
                                            name="productName"
                                            required=""
                                            type="text"
                                            placeholder="Vd: Bút bi xanh"
                                    />

                                </fieldset>
                                <div class="cols">
                                    <fieldset class="Category">
                                        <div class="body-title">
                                            Loại sản phẩm
                                            <span>*</span>
                                        </div>
                                        <div class="select">
                                            <select required="" name="cateID">
                                                <option value="" disabled selected>
                                                    -- Vui lòng chọn --
                                                </option>
                                                <c:forEach items="${cate}" var="o">
                                                    <option value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </fieldset>
                                    <fieldset class="Gender">
                                        <div class="body-title">
                                            Giá sản phẩm
                                            <span>*</span>
                                        </div>
                                        <div class="select">
                                            <input
                                                    name="productPrice"
                                                    required=""
                                                    type="text"
                                                    placeholder="Vd: 100000 "
                                            />
                                        </div>
                                    </fieldset>
                                </div>

                                <fieldset class="description">
                                    <div class="body-title">
                                        Mô tả
                                        <span>*</span>
                                    </div>
                                    <textarea
                                            required=""
                                            name="productDes"
                                            placeholder="Mô tả"
                                    ></textarea>

                                </fieldset>
                            </div>
                            <div class="wg-box">
                                <img id="imgCate" style="width: 150px;"
                                     src="">
                                <fieldset>
                                    <div class="body-title">Tải hình ảnh lên</div>
                                    <input id="cateImg" required="" type="file" name="productImage"
                                           multiple onchange="loadImg()"/>

                                    <div class="body-title">Tải hình ảnh chi tiết sản phẩm</div>
                                    <input
                                            class="form-control"
                                            type="file"
                                            id="formFileMultiple"

                                            multiple
                                            onchange="getData(this)"
                                    />
                                    <input type="hidden" name="subImg" id="subImg" value="">
                                    <div class="body-text">
                                        <div
                                                id="imageContainer"
                                                style="display: flex; flex-wrap: wrap; gap: 10px"
                                        ></div>
                                    </div>
                                </fieldset>
                                <div class="cols">
                                    <fieldset class="name">
                                        <div class="body-title">
                                            Thêm số lượng tổng sản phẩm trong kho <span>*</span>
                                        </div>

                                        <div class="select">
                                            <input
                                                    required=""
                                                    type="number"
                                                    name="productInventory"
                                                    id=""
                                                    placeholder="Vd: 100"
                                            />
                                        </div>
                                    </fieldset>
                                    <fieldset class="name">
                                        <div class="body-title" style="margin-bottom: 28px">
                                            Miêu tả ngắn về sản phẩm <span>*</span>
                                        </div>
                                        <div class="select">
                                            <input required="" type="text" name="shortDes"/>
                                        </div>
                                    </fieldset>

                                </div>
                                <div class="col">
                                    <button class="btn1" type="submit">Thêm sản phẩm</button>
                                    <button class="btn2" type="reset">
                                        Xóa thông tin đã nhập
                                    </button>
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

<script>
    function getData(event) {
        // Kiểm tra nếu mảng và thẻ input lưu data đã có dữ liệu, thì xóa đi
        let filesArray = [];
        $("#subImg").val('');

        // Lấy các tệp từ event
        filesArray = Array.from(event.files);


        // Duyệt qua mảng và cộng dồn tên của từng tệp vào value của ô input
        filesArray.forEach((file) => {
            let currentValue = $("#subImg").val();  // Lấy giá trị hiện tại của ô input
            // Cập nhật lại giá trị, nối tên tệp vào hiện tại
            $("#subImg").val(currentValue + file.name + ',');
        });

        // Duyệt qua từng tệp và tạo thẻ img
        const container = $("#imageContainer");
        container.innerHTML = "";
        filesArray.forEach((file) => {
            if (file.type.startsWith("image/")) { // Kiểm tra tệp có phải là ảnh không
                const reader = new FileReader();

                // Xử lý khi FileReader đọc xong tệp
                reader.onload = (e) => {
                    // Tạo thẻ img và thêm vào vùng chứa
                    $("<img>")
                        .attr("src", e.target.result) // URL hình ảnh
                        .attr("alt", file.name) // Tên tệp làm thuộc tính alt
                        .css({
                            width: "100px",
                            height: "auto",
                            margin: "5px"
                        })
                        .appendTo("#imageContainer");
                };

                // Đọc tệp dưới dạng data URL
                reader.readAsDataURL(file);
            }
        });

        // In ra giá trị cuối cùng của ô input
        console.log($("#subImg").val());
    }
</script>
</body>
</html>
