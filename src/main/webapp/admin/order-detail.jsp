<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleOrderDetail.css"/>
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<div id="main-content">
    <div class="main-container">
        <div class="header">
            <h1>Chi tiết đơn hàng</h1>
        </div>
        <div class="wg-order-detail">
            <div class="flex-grow">
                <div class="wg-box">
                    <div class="table-order">
                        <ul class="flex-column">
                            <c:forEach items="${listOD}" var="o">
                                <li class="product-item">
                                    <img src="<%= request.getContextPath()%>/assets/pic/products/${o.productImage}"/>
                                    <div class="items-center">
                                        <div class="name">
                                            <div class="text-tiny">Tên sản phẩm</div>
                                            <a href="#">${o.productName}</a>
                                        </div>
                                        <div class="name">
                                            <div class="text-tiny">Số lượng</div>
                                            <a href="#">${o.quantity}</a>
                                        </div>
                                        <div class="name">
                                            <div class="text-tiny">Tổng giá</div>
                                            <f:setLocale value="vi_VN"/>
                                            <a href="#"> <f:formatNumber value="${o.price}" type="currency"/></a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="wg-box" style="gap: 10px">
                    <div class="body-title text-uppercase">Thông tin</div>
                    <div class="summary-item">
                        <div class="body-text">ID đơn hàng:</div>
                        <div class="body-title"><%=request.getAttribute("oID")%>
                        </div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">ID khách hàng:</div>
                        <div class="body-title">${cus.id}</div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Tên khách hàng:</div>
                        <div class="body-title">${cus.name}</div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Thông tin liên lạc:</div>
                        <div class="body-title" style="width: unset"> ${cus.email}</div>
                        <div class="body-title" style="width: unset">${cus.phone}</div>
                    </div>

                    <div class="summary-item">
                        <div class="body-text">Ngày tạo đơn:</div>
                        <div class="body-title"><%=request.getAttribute("date")%>
                        </div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Địa chỉ giao hàng:</div>
                        <div class="body-title">
                            ${cus.addressShipping}
                        </div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Trạng thái vận chuyển:</div>
                        <div class="body-title">
                            <%=request.getAttribute("shipping")%>
                        </div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Phương thức thanh toán:</div>
                        <div class="body-title">
                            <%=request.getAttribute("payment")%>
                        </div>
                    </div>
                    <div class="summary-item">
                        <div class="body-text">Tổng cộng</div>
                        <div class="tf-color-1">
                            <f:setLocale value="vi_VN"/>
                            <c:set var="balance" value='<%= request.getAttribute("total") %>'/>
                            <f:formatNumber value="${balance}" type="currency"/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div><a href="all-order" class="btn bg-success px-4 py-2 float-end">Quay lại</a></div>
    </div>
</div>

</body>
</html>
