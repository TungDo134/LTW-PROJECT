<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/3/2024
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <!-- Link FontAwesome -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- Link GG Icon -->

    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=shopping_bag"
    />
    <!-- Link jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



    <link rel="stylesheet" href="assets/css/styleHeader.css"/>
</head>
<body>
<div id="header" class="fixed">
<%--    <div class="mau">--%>
<%--        <div class="top-message">--%>
<%--            <span>CHRISTMAS SALE! 🦌</span>--%>
<%--            <span>TẬN HƯỞNG GIẢM GIÁ TỪ 20%</span>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- BOOTSTRAP -->

    <nav
            class="navbar navbar-expand-lg bg-body-tertiary"
            style="
        background-color: #faf7f0 !important;
        box-shadow: 0 0 5px 0 rgba(102, 102, 102, 0.4);
        padding: 16px 8px;
      "
    >
        <div class="container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div
                    class="offcanvas offcanvas-end"
                    tabindex="-1"
                    id="offcanvasNavbar"
                    aria-labelledby="offcanvasNavbarLabel"
            >
                <div class="offcanvas-header">
                    <!-- <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5> -->
                    <img
                            class="offcanvas-title"
                            id="offcanvasNavbarLabel"
                            src="assets/pic/logo.png"
                            alt=""
                            style="width: 70%; margin-left: 8px"
                    />
                    <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="offcanvas"
                            aria-label="Close"
                    ></button>
                </div>
                <div class="ct ct-sub-menu d-lg-none d-block" id="search-custom">
                    <form action="search-control" method="post" class="form-search">
                        <div class="form-input">
                            <input name="txt" type="text" placeholder="Tìm kiếm..." />
                            <button type="submit">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="offcanvas-body align-items-center justify-content-evenly">
                    <a
                            class="navbar-brand d-none d-lg-block nav-brand-custom"
                            href="index.jsp"
                    ><img src="assets/pic/logo.png" alt="" style="width: 100%"
                    /></a>

                    <ul class="navbar-nav align-items-start">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="home"
                            >Trang Chủ</a
                            >
                        </li>
                        <li class="nav-item dropdown w-100 custom-width-lg">
                            <a
                                    class="nav-link dropdown-toggle"
                                    href="products"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                            >
                                Sản phẩm
                                <i class="fa-solid fa-chevron-down d-lg-none"></i>
                            </a>
                            <ul id="myNav" class="dropdown-menu">
                                <!-- Các mục mặc định -->

                            </ul>

                        </li>
                        <li class="nav-item dropdown w-100 custom-width-lg">
                            <a
                                    class="nav-link"
                                    href="#"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                            >
                                Pages<i class="fa-solid fa-chevron-down d-lg-none"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="product-detail.jsp"
                                    >Shop-Detail</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" href="Shopping-cart.jsp"
                                    >Shop-Cart</a
                                    >
                                </li>
                                <li>
                                    <a class="dropdown-item" href="payment.jsp">Check-Out</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AboutUsPicController">Về chúng tôi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact-us.jsp">Liên hệ</a>
                        </li>
                    </ul>

                    <!-- Icon -->
                    <div class="col_icon d-none d-lg-flex">
                        <!-- Search input -->
                        <div class="search">
                            <button class="btn-search">
                                <img
                                        src="https://theme.hstatic.net/1000348721/1000449307/14/pic-search.png?v=652"
                                        alt=""
                                />
                            </button>
                            <div class="ct" id="search">
                                <form
                                        action="search-control"
                                        method="post"
                                        class="form-search"
                                >
                                    <div class="form-input">
                                        <input name="txt" type="text" placeholder="Tìm kiếm..." />
                                        <button type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Admin -->
                        <div class="col_icon col_icon-user">
                            <button><i class="fa-regular fa-user"></i></button>
                            <div class="show">
                                <ul class="show-option">

                                    <li class="items">
                                        <a href="admin/admin.jsp" style="color: #000"
                                        >Admin</a
                                        >
                                    </li>
                                    <li class="items">
                                        <a href="profile.jsp" style="color: #000"
                                        >Thông tin tài khoản</a
                                        >
                                    </li>
                                    <li class="items">
                                        <a
                                                href="forms/signup-login.jsp"
                                                style="color: #000"
                                        >Đăng nhập</a
                                        >
                                    </li>
                                    <li class="items">
                                        <a
                                                href="logout"
                                                style="color: #000"
                                        >Đăng xuất</a
                                        >
                                    </li>
                                    <li class="items">
                                        <a
                                                href="forms/changePassword.jsp"
                                                style="color: #000"
                                        >Đổi mât khẩu</a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Shopping bag -->
                        <a href="show-cart"
                        ><span
                                class="material-symbols-outlined"
                                style="line-height: normal; color: #333333cc"
                        >
                  shopping_bag
                </span></a
                        >
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
</body>
<script src="assets/js/header.js"></script>

<script>
    $(document).ready(function () {
        $(".nav-link.dropdown-toggle").on("click", function (e) {
            // Kiểm tra nếu màn hình là kích thước lớn (lg) trở lên
            if (window.innerWidth >= 992) {
                // Cho phép liên kết hoạt động
                window.location.href = $(this).attr("href");
            } else {
                // Ngăn hành vi mặc định để mở dropdown
                e.preventDefault();
            }
        });

        function loadSubMenuHead(){
            $.ajax({
                url: "${pageContext.request.contextPath}/head-control",
                type:"get",
                success:function (data){
                    $("#myNav").append(data);
                },
                error:function (){
                }
            })
        }
        loadSubMenuHead();
    });
</script>

