<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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


    <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleOrderDetail.css" />
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
                  <li class="product-item">
                    <img src="<%= request.getContextPath()%>/assets/pic/highlights_pen.avif" />
                    <div class="items-center">
                      <div class="name">
                        <div class="text-tiny">Product name</div>
                        <a href="#">Bút highlights</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Số lượng</div>
                        <a href="#">1</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Giá</div>
                        <a href="#">15.000đ</a>
                      </div>
                    </div>
                  </li>
                  <li class="product-item">
                    <img src="<%= request.getContextPath()%>/assets/pic/highlights_pen.avif" />
                    <div class="items-center">
                      <div class="name">
                        <div class="text-tiny">Product name</div>
                        <a href="#">Bút highlights</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Số lượng</div>
                        <a href="#">1</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Giá</div>
                        <a href="#">15.000đ</a>
                      </div>
                    </div>
                  </li>
                  <li class="product-item">
                    <img src="<%= request.getContextPath()%>/assets/pic/highlights_pen.avif" />
                    <div class="items-center">
                      <div class="name">
                        <div class="text-tiny">Product name</div>
                        <a href="#">Bút highlights</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Số lượng</div>
                        <a href="#">1</a>
                      </div>
                      <div class="name">
                        <div class="text-tiny">Giá</div>
                        <a href="#">15.000đ</a>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="right">
            <div class="wg-box" style="gap: 10px">
              <div class="body-title">Thông tin</div>
              <div class="summary-item">
                <div class="body-text">ID đơn hàng</div>
                <div class="body-title">#192847</div>
              </div>
              <div class="summary-item">
                <div class="body-text">ID khách hàng</div>
                <div class="body-title">#192847</div>
              </div>
              <div class="summary-item">
                <div class="body-text">Tên khách hàng</div>
                <div class="body-title">Tùng Đỗ</div>
              </div>
              <div class="summary-item">
                <div class="body-text">Ngày tạo đơn</div>
                <div class="body-title">20 tháng 11 năm 2023</div>
              </div>
              <div class="summary-item">
                <div class="body-text">Địa chỉ giao hàng</div>
                <div class="body-title">
                  13C chung cư Hiệp Bình Chánh, đường số 23 Phạm Văn Đồng, Thành
                  phố Thủ Đức
                </div>
              </div>
              <div class="summary-item">
                <div class="body-text">Tổng cộng</div>
                <div class="tf-color-1">710.000đ</div>
              </div>
            </div>
            <!-- <div class="wg-box" style="gap: 10px; margin-top: 38px">
              <div class="body-title"></div>
              <div class="body-text"></div>
            </div> -->
            <!-- <div class="wg-box" style="gap: 10px">
              <div class="body-title">Phương thức thanh toán</div>
              <div class="body-text" style="width: 300px">COD</div>
            </div> -->
            <!-- <div class="wg-box" style="gap: 10px; display: none">
              <div class="body-title">Ngày giao hàng dự kiến</div>
              <div class="tf-color-2">22 tháng 11 năm 2023</div>
              <a class="tf-button" href="#">
                <i class="fa-solid fa-truck"></i>
                theo dõi đơn hàng
              </a>
            </div> -->
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
