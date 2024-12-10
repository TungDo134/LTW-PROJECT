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
    <link rel="stylesheet" href="../assets/css/styleAdmin.css">
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
            <form action="#" class="form-search flex-grow-1">
                <div class="form-control-cus">
                    <input type="text" placeholder="Tìm kiếm" />
                </div>
            </form>
            <div class="btn-submit">
                <button><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </div>
        <div class="header-right">
            <div class="toggle-theme icon" style="padding: 8px; cursor: pointer">
                <span class="material-symbols-outlined"> sunny </span>
            </div>
            <div class="notify icon" style="display: none">
                <i class="fa-regular fa-bell"></i>
            </div>
            <div class="icon" style="display: none">
                <i class="fa-regular fa-message"></i>
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
                    <img src="../assets/pic/capy.jpg" alt="" />
                  </span>
                  <span class="d-flex flex-column align-items-baseline">
                    <span class="name body-title">Do Son Tung</span>
                    <span class="role text-tiny">Admin</span>
                  </span>
                </span>
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" href="../index.jsp"
                            ><i class="fa-regular fa-user icon-dropdown"></i>Tài
                                Khoản</a
                            >
                        </li>
                        <li>
                            <a class="dropdown-item" href="../index.jsp"
                            ><i class="fa-solid fa-headphones icon-dropdown"></i> Trang chủ</a
                            >
                        </li>
                        <li>
                            <a class="dropdown-item" href="../index.jsp"
                            ><i class="fa-solid fa-right-to-bracket icon-dropdown"></i
                            >Đăng xuất</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
            <div class="setting" style="display: none">
                <button class="btn" type="button">
                    <i class="fa-solid fa-gear icon-setting"></i>
                </button>
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
                            src="../assets/pic/logo.png"
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
                        <a href="admin.jsp">Dash Board</a>
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
                                    <a href="listProduct.jsp"
                                    >Danh sách sản phẩm</a
                                    >
                                </li>
                                <li class="sub-menu-item">
                                    <a href="addProduct.jsp">Thêm sản phẩm</a>
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
                                    <a href="listCategory.jsp"
                                    >Danh sách danh mục</a
                                    >
                                </li>

                                <li class="sub-menu-item">
                                    <a href="addCategory.jsp">Danh mục mới</a>
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
                                    <a href="order-list.jsp"
                                    >Danh sách đơn hàng</a
                                    >
                                </li>
                                <li class="sub-menu-item">
                                    <a href="order-detail.jsp"
                                    >Chi tiết đơn hàng</a
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
                                    <a href="allUser.jsp">Tất cả người dùng</a>
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
                                <a href="addPic_Index.jsp">Trang chủ</a>
                            </li>
                            <li class="sub-menu-item">
                                <a href="addPic_AboutUs.jsp">Trang về chúng tôi</a>
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
                                <a href="listVoucher.jsp">Mục mã giảm giá</a>
                            </li>
                            <li class="sub-menu-item">
                                <a href="addVoucher.jsp">Thêm mã giảm giá</a>
                            </li>
                            <li class="sub-menu-item">
                                <a href="listReviews.jsp">Danh sách đánh giá</a>
                            </li>
                            <li class="sub-menu-item">
                                <a href="listFeedback.jsp">Danh sách phản hồi </a>
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
<script src="../assets/js/admin.js"></script>
</body>
</html>
