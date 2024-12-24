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
                        <!-- Order Details -->
                        <div class="order-details">
                            <div class="order-header">
                                <h2>Mã đơn hàng: ${order.orderID}</h2>
                                <p>Ngày tạo đơn: ${order.date} <span class="status">${order.status} </span></p>

                            </div>
                            <div class="product-list">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listOrd}" var="o">
                                        <tr>
                                            <td><img src="assets/pic/products/${o.productImage}"
                                                     alt="Women Shoes">${o.productName}</td>
                                            <td>${o.quantity}</td>
                                            <td>
                                                <f:setLocale value="vi_VN"/>
                                                <f:formatNumber value="  ${o.price}" type="currency"/>

                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="order-summary">
                            <h3>Hóa đơn và Thanh toán</h3>
                            <div class="invoice-payment">
                                <!-- Hóa đơn -->
                                <div class="invoice">
                                    <h4>Hóa đơn</h4>
                                    <ul>
                                        <li>Tạm tính: <span> <f:setLocale value="vi_VN"/>
                                            <f:formatNumber value=" ${order.totalPrice}" type="currency"/></span></li>
                                        <%--                            <li>Discount (DIS15%): <span>10%</span></li>--%>
                                        <%--                            <li>Shipping Charge: <span>20000đ</span></li>--%>
                                        <li><strong>Tổng tiền:</strong>
                                            <span><strong>
                                                  <f:setLocale value="vi_VN"/>
                                            <f:formatNumber value=" ${order.totalPrice}" type="currency"/>
                                            </strong></span></li>
                                    </ul>
                                </div>

                                <!-- Phương thức thanh toán -->
                                <div class="payment-method">
                                    <h4>Phương thức thanh toán</h4>
                                    <ul>
                                        <li>Phương thức: <span>${pay.payMethods}</span></li>
                                        <li>Khách hàng: <span>${sessionScope.customer.name}</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Shipping Progress -->
                    <!-- <div class="shipping-progress">
                        <h3>Tiến trình giao hàng</h3>
                        <div class="progress-container">
                            <div class="step active">
                                <div class="icon">
                                    <i class="fas fa-home"></i>
                                </div>
                                <p>Chờ xác nhận</p>
                            </div>
                            <div class="connector"></div>
                            <div class="step active">
                                <div class="icon">
                                    <i class="fas fa-box"></i>
                                </div>
                                <p>Chuẩn bị hàng</p>
                            </div>
                            <div class="connector"></div>
                            <div class="step active">
                                <div class="icon">
                                    <i class="fas fa-truck"></i>
                                </div>
                                <p>Vận chuyển</p>
                            </div>

                            <div class="connector"></div>
                            <div class="step active">
                                <div class="icon">
                                    <i class="fas fa-check-circle"></i>
                                </div>
                                <p>Hoàn thành</p>
                            </div>
                        </div>
                    </div> -->
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
