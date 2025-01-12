<%@ page import="entity.Order" %>
<%@ page import="entity.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Payment" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Sản Phẩm</title>
    <!-- Link FONTAWSOME -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <!-- Link my CSS -->
    <link rel="stylesheet" href="assets/css/styleProfile.css"/>
</head>
<body>

<div class="Page-profile">
    <main class="container-profile">
        <div class="sidebar-profile">
            <nav class="breadcrumb">
                <a href="home" style="color: #338dbc">Trang chủ</a>
                &gt;
                <span>Thông tin cá nhân</span>
            </nav>
            <div class="user-info">

                <div class="username">
                    <span> Tài khoản của </span>
                    <h3 style="margin-right: 8px"><Strong>${cus.name}</Strong></h3>
                </div>
            </div>
            <ul class="menu">
                <li data-frame="frame1" class="menu-item active">
                    Thông tin chung
                </li>
                <li data-frame="frame3" class="menu-item">Đơn hàng của tôi</li>
            </ul>
        </div>
        <div class="content">
            <div id="frame1" class="frame active">
                <div class="main-profile-container">
                    <h1 class="title-profile" style="text-transform: uppercase"> thông tin cá nhân</h1>
                    <div class="info-section">
                        <h2 class="title-section">Thông tin tài khoản</h2>
                        <div class="info-box">
                            <p>Họ và tên: <Strong>${cus.name}</Strong></p>
                            <p>Email: <Strong>${cus.email}</Strong></p>
                            <button style="width: 10%">
                                <a href="logout">Đăng xuất</a>
                            </button>
                            <button style="width: 15%">
                                <a
                                        href="forms/changePassword.jsp"

                                >Đổi mât khẩu</a>
                            </button>
                        </div>
                    </div>


                    <div class="address-section">
                        <h2 class="title-section">Số địa chỉ</h2>
                        <div class="address-box">
                            <p>
                                ${cus.name}
                                <span class="default-label">Mặc định</span>
                            </p>
                            <p>Địa chỉ cá nhân:<Strong> ${cus.address}</Strong></p>
                            <p>Địa chỉ vận chuyển:<Strong> ${cus.addressShipping}</Strong></p>
                            <p>Điện thoại: <Strong> ${cus.phone}</Strong></p>
                            <a href="load-profile?code=1" class="action-buttons">
                                <button class="edit-btn">Sửa</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Details and Tracking Section -->
            <div id="frame3" class="frame order">
                <div class="container-frameOrder">
                    <!-- Order Details and Summary -->
                    <div class="order-container">
                        <div class="product-list">
                            <div class="order-content">
                                <c:if test="${orders==null}">
                                    <h3>Bạn chưa mua hàng</h3>
                                </c:if>
                                <c:forEach items="${orders}" var="o">
                                    <div class="order_Customer bg-white p-3 rounded">
                                        <div>
                                            <h4>Mã đơn hàng: </h4>
                                            <h4>${o.orderID}</h4>
                                        </div>

                                        <div>
                                            <h4>Số lượng: </h4>
                                            <h4>${o.quantity}</h4>
                                        </div>


                                        <div>
                                            <h4>Tổng tiền: </h4>
                                            <h4>
                                                <f:setLocale value="vi_VN"/>
                                                <f:formatNumber value="  ${o.totalPrice}" type="currency"/>

                                            </h4>
                                        </div>

                                        <div>
                                            <h4>Ngày tạo đơn: </h4>
                                            <h4>${o.date}</h4>
                                        </div>
                                        <div>
                                            <h4>Địa chỉ giao hàng: </h4>
                                            <h4>${addressShip}</h4>
                                        </div>

                                        <div>
                                            <h4>Tình trạng thanh toán: </h4>
                                            <h4>${o.status}</h4>
                                        </div>
                                        <div>
                                            <a style="color: #000;text-decoration: none"
                                               href="load-detail-ord-cus?oID=${o.orderID}" class="detail-order">Xem chi
                                                tiết</a>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>
    </main>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const menuItems = document.querySelectorAll(".menu-item");
        const frames = document.querySelectorAll(".frame");

        menuItems.forEach((item) => {
            item.addEventListener("click", () => {
                // Xóa class active khỏi tất cả menu items
                menuItems.forEach((i) => i.classList.remove("active"));

                // Xóa class active khỏi tất cả frames
                frames.forEach((frame) => frame.classList.remove("active"));

                // Thêm class active vào menu item được click
                item.classList.add("active");

                // Hiển thị frame tương ứng
                const targetFrame = document.getElementById(
                    item.getAttribute("data-frame")
                );
                if (targetFrame) {
                    targetFrame.classList.add("active");
                }
            });
        });
    });
</script>
</body>
</html>
