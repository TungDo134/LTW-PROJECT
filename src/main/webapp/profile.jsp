<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sản Phẩm</title>
    <!-- Link FONTAWSOME -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <!-- Link my CSS -->
    <link rel="stylesheet" href="assets/css/styleProfile.css" />
  </head>
  <body>
    <div class="Page-profile">
      <main class="container-profile">
        <div class="sidebar-profile">
          <nav class="breadcrumb">
            <a href="index.html" style="color: #338dbc">Trang chủ</a>
            &gt;
            <span>Thông tin cá nhân</span>
          </nav>
          <div class="user-info">
            <div class="avatar">
              <img class="avt-pic" src="assets/pic/capy.jpg" alt="" />
            </div>
            <div class="username">
              <span> Tài khoản của </span>
              <h3 style="margin-right: 8px">Trần Khải</h3>
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
              <h1 class="title-profile">BẢNG THÔNG TIN CỦA TÔI</h1>
              <div class="info-section">
                <h2 class="title-section">Thông tin tài khoản</h2>
                <div class="info-box">
                  <p><strong>Họ và tên:</strong> Trần Khải</p>
                  <p><strong>Email:</strong> khaingaolol@gmail.com</p>
                  <button style="width: 10%">
                    <a href="index.html">Đăng xuất</a>
                  </button>
                </div>
              </div>

              <div class="order-section">
                <h2 class="title-section">Các đơn hàng vừa đặt</h2>
                <p class="no-orders">Bạn chưa đặt mua sản phẩm nào!...</p>
              </div>

              <div class="address-section">
                <h2 class="title-section">Số địa chỉ</h2>
                <div class="address-box">
                  <p>
                    Trần Khải
                    <span class="default-label">Mặc định</span>
                  </p>
                  <p><strong>Địa chỉ:</strong> , Vietnam</p>
                  <p><strong>Điện thoại:</strong></p>
                  <div class="action-buttons">
                    <button class="edit-btn">Sửa</button>
                    <button class="delete-btn">Xóa</button>
                  </div>
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
                            <h2>Order ID: DU00017</h2>
                            <p>Order Date: October 03, 2023, at 6:31 PM <span class="status">Paid</span></p>
                            
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
                                    <tr>
                                        <td><img src="assets/pic/but-ki-ten.jpg" alt="Women Shoes">Bút kí tên</td>
                                        <td>5</td>
                                        <td>25000</td>
                                    </tr>
                                    <tr>
                                        <td><img src="assets/pic/but-ki-ten.jpg" alt="Black Round Sunglasses">Bút kí tên</td>
                                        <td>1</td>
                                        <td>5000</td>
                                    </tr>
                                    <tr>
                                        <td><img src="assets/pic/but-ki-ten.jpg" alt="Shoulder Bag">Bút kí tên</td>
                                        <td>4</td>
                                        <td>20000</td>
                                    </tr>
                                    <tr>
                                        <td><img src="assets/pic/but-ki-ten.jpg" alt="Vintage Perfume">Bút kí tên</td>
                                        <td>3</td>
                                        <td>15000</td>
                                    </tr>
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
                            <li>Tạm tính: <span>65000đ</span></li>
                            <li>Discount (DIS15%): <span>10%</span></li>
                            <li>Shipping Charge: <span>20000đ</span></li>
                            <li><strong>Tổng tiền:</strong> <span><strong>78500đ</strong></span></li>
                          </ul>
                        </div>
                    
                        <!-- Phương thức thanh toán -->
                        <div class="payment-method">
                          <h4>Phương thức thanh toán</h4>
                          <ul>
                            <li>Mã giao dịch: <span>#DU444</span></li>
                            <li>Phương thức: <span>Momo</span></li>
                            <li>Khách hàng: <span>Trần Khải</span></li>
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
