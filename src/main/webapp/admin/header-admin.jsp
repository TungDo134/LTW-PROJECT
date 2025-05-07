<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/3/2024
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- Datatable -->
    <link
            rel="stylesheet"
            href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css"
    />
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/styleAdmin.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/styleDataTable.css">
</head>
<body>
<header id="header-dashboard">
    <div class="header-content">
        <div class="header-left">
            <div class="button-show-hide">
                <a
                        id="open-sub-menu"
                        href="#"
                        type="button"
                        data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasScrolling"
                        aria-controls="offcanvasScrolling"
                ><i class="fa-solid fa-bars"></i>
                </a>
            </div>
            <div class="user icon">
                <div class="dropdown">
                    <button
                            class="btn btn-secondary dropdown-toggle border-0 p-0 bg-transparent"
                            type="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            style="outline: none"
                    >
                <span class="header-user wg-user">
                  <span class="image">
                    <img src="<%=request.getContextPath()%>/assets/pic/defaul_ava.jpg" alt=""/>
                  </span>
                  <span class="d-flex flex-column align-items-baseline">
                    <span class="name body-title"><a class="text-decoration-none text-"
                                                     href="#">${sessionScope.customer.name}</a></span>
                    <span class="role text-tiny">Admin</span>
                  </span>
                </span>
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath()%>/load-profile"
                            ><i class="fa-regular fa-user icon-dropdown"></i>Tài
                                Khoản</a
                            >
                        </li>
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath()%>/home"
                            ><i class="fa-solid fa-headphones icon-dropdown"></i> Trang chủ</a
                            >
                        </li>
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath()%>/logout"
                            ><i class="fa-solid fa-right-to-bracket icon-dropdown"></i
                            >Đăng xuất</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div id="sub-header">
        <div
                class="offcanvas offcanvas-start show"
                data-bs-scroll="true"
                data-bs-backdrop="false"
                tabindex="-1"
                id="offcanvasScrolling"
                aria-labelledby="offcanvasScrollingLabel"
        >
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasScrollingLabel">
                    <img
                            id="logoName"
                            src="<%= request.getContextPath()%>/assets/pic/logo.png"
                            alt="Logo"
                            style="width: 100%; background: var(--logo-color)"
                    />
                </h5>
                <div class="button-show-hide button-show-hide-custom">
                    <a
                            id="close-sub-menu"
                            href="#"
                            type="button"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasScrolling"
                            aria-controls="offcanvasScrolling"
                    ><i class="fa-solid fa-bars"></i>
                    </a>
                </div>
            </div>
            <div class="offcanvas-body">
                <div
                        class="wrapper-header"
                        style="padding: 20px 20px 0px 20px; margin-bottom: -1rem"
                >
                    <h3 class="title">Trang Chủ</h3>

                    <div class="d-flex main-home">
                        <span class="material-symbols-outlined pr-10"> grid_view </span>
                        <a href="<%= request.getContextPath()%>/admin/admin.jsp">Dash Board</a>
                    </div>
                </div>

                <!-- Item -->
                <nav id="nav-submenu">
                    <h3 class="title">Tất cả trang</h3>
                    <ul class="menu-main-menu">
                        <!-- <li class="item"><a href="#">Dasb Board</a></li> -->
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      shopping_cart
                    </span>
                                <a href="#">Sản phẩm</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">

                                    <%--  LoadProductAdmin --%>
                                    <a href="<%= request.getContextPath()%>/admin/load-pAdmin">Danh sách sản phẩm</a>

                                </li>
                                <%--  ShowAddProduct --%>
                                <li class="sub-menu-item">
                                    <a href="<%= request.getContextPath()%>/admin/show-add-product">Thêm sản phẩm</a>
                                </li>


                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <!-- <i class="fa-solid fa-layer-group pr-10"></i> -->
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      stacks
                    </span>
                                <a href="#">Danh mục</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">
                                    <%-- GetAllCate --%>
                                    <a href="<%= request.getContextPath()%>/admin/get-all-cate">Danh sách danh mục</a>
                                </li>


                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      note_add
                    </span>
                                <a href="#">Đơn hàng</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">

                                    <%-- GetAllOrder --%>
                                    <a href="<%= request.getContextPath()%>/admin/all-order"
                                    >Danh sách đơn hàng</a
                                    >
                                </li>
                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      person
                    </span>
                                <a href="#">Người dùng</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">

                                    <%-- getAllUserController--%>
                                    <a href="<%= request.getContextPath()%>/admin/all-user">Tất cả người dùng</a>


                                </li>
                                <li class="sub-menu-item">
                                    <a href="<%= request.getContextPath()%>/admin/addUser.jsp">Thêm người dùng</a>
                                </li>

                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      add_photo_alternate
                    </span>
                                <a href="#">Chỉnh ảnh</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">
                                    <%--   GetAllHomePic --%>
                                    <a href="<%= request.getContextPath()%>/admin/all-homePic">Trang chủ</a>
                                </li>
                                <li class="sub-menu-item">
                                    <%--   GetAllAboutUsPic --%>
                                    <a href="<%= request.getContextPath()%>/admin/all-aboutUs">Trang giới thiệu</a>
                                </li>

                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                                <span class="material-symbols-outlined pr-10">
                                     inventory_2
                                </span>
                                <a href="#">Kho hàng</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">

                                    <%-- getAllManuController--%>
                                    <a href="<%= request.getContextPath()%>/admin/list-warehouse">Danh sách kho hàng</a>


                                </li>


                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
                      edit_document
                    </span>
                                <a href="#"> Quản lý thông tin </a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">
                                    <a href="<%= request.getContextPath()%>/admin/all-coupon">Mã giảm giá cho đơn
                                        hàng</a>
                                </li>
                                <li class="sub-menu-item">
                                    <%--GetAllReview--%>
                                    <a href="<%= request.getContextPath()%>/admin/all-review">Danh sách đánh
                                        giá</a>
                                </li>
                                <li class="sub-menu-item">
                                    <%--  GetAllFeedback--%>
                                    <a href="<%= request.getContextPath()%>/admin/all-feedback">Danh sách phản
                                        hồi </a>
                                </li>
                                <%-- LoadDiscount  --%>
                                <li class="sub-menu-item">
                                    <%-- <a href="<%= request.getContextPath()%>/admin/">Giảm giá sản phẩm</a>--%>
                                    <a href="<%= request.getContextPath()%>/admin/load-discount">Giảm giá sản phẩm hàng
                                        loạt</a>
                                </li>
                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                                <span class="material-symbols-outlined pr-10">
                                    warehouse
                                    </span>
                                <a href="#">Nhà sản xuất</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">

                                    <%-- getAllManuController--%>
                                    <a href="<%= request.getContextPath()%>/admin/all-manufacturer">Tất cả nhà sản
                                        xuất</a>


                                </li>
                                <li class="sub-menu-item">
                                    <a href="<%= request.getContextPath()%>/admin/addManufacturer.jsp">Thêm nhà sản
                                        xuất</a>
                                </li>

                            </ul>
                        </li>
                        <li class="item item-dropdown">
                            <div class="d-flex">
                    <span class="material-symbols-outlined pr-10">
passkey
</span>
                                <a href="#">Quản lí phân quyền</a>
                            </div>
                            <ul class="sub-menu">
                                <li class="sub-menu-item">
                                    <%--  <a href="<%= request.getContextPath()%>/admin/addManufacturer.jsp">Phân quyền</a>--%>
                                    <a href="<%= request.getContextPath()%>/admin/show-auth">Phân quyền</a>
                                </li>

                            </ul>
                        </li>

                    </ul>
                </nav>
                <div class="container_social">
                    <h4 class="mb-3 title">Liên hệ với chúng tôi</h4>
                    <div class="social-icons">
                        <a href="#" class="btn btn-outline-primary mx-1">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <!-- Thay đổi biểu tượng Twitter thành X -->
                        <a href="#" class="btn btn-outline-info mx-1">
                            <i class="fa-brands fa-x-twitter"></i>
                            <!-- Biểu tượng "X" -->
                        </a>
                        <a href="#" class="btn btn-outline-primary mx-1">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#" class="btn btn-outline-danger mx-1">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<script src="<%= request.getContextPath()%>/assets/js/admin.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/header_admin.js"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<script src="<%= request.getContextPath()%>/assets/js/datatable.js"></script>
<script>
    function loadLogo() {
        $.ajax({
            url: "${pageContext.request.contextPath}/load-logo",
            type: "get",
            success: function (data) {
                // console.log(data)
                const contextPath = "<%=request.getContextPath()%>";
                let imgSrc = contextPath + "/assets/pic/homePage/" + data.logoName
                $("#logoName").attr("src", imgSrc)
            },
            error: function () {
                console.log("co loi")
            }
        })
    }

    loadLogo();
</script>

</body>
</html>
