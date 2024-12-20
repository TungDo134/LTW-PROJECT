<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="assets/css/stylePayment.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
  </head>
  <body style="background-color: #faf7f0">
    <!-- Phần Thông tin giao hàng -->
    <main id="checkout-container">
      <!-- Navigation Path -->
      <div class="col-right-payment">
        <div class="breadcrumb-frame">
          <nav class="breadcrumb">
            <h1>TÊN SHOP</h1>
            <a href="shopping-cart.html" style="color: #338dbc">Giỏ hàng</a>
            &gt;
            <span>Thanh toán</span>
          </nav>
        </div>
        <form class="column shipping-info">
          <!-- Phần Thông tin giao hàng -->
          <h2>THÔNG TIN GIAO HÀNG</h2>
          <div class="form-group">
            <input type="text" name="name" placeholder="Họ và Tên" required />
          </div>
          <div class="email-phone">
            <div class="form-group">
              <input
                class="email"
                type="email"
                name="email"
                placeholder="Email"
                required
              />
            </div>
            <div class="form-group">
              <input
                class="numberPhone"
                type="tel"
                name="numberPhone"
                placeholder="Số Điện Thoại"
                required
              />
            </div>
          </div>
          <div class="form-group">
            <input type="text" placeholder="Số Nhà, Tên Đường" />
          </div>
          <div class="select-address">
            <div class="form-group">
              <select id="city" aria-label=".form-select-sm">
                <option value="" selected>Chọn tỉnh thành</option>
                <!-- Thêm các tỉnh/thành phố khác -->
              </select>
            </div>
            <div class="form-group">
              <select id="district" aria-label=".form-select-sm">
                <option value="" selected>Chọn quận / huyện</option>
              </select>
            </div>
            <div class="form-group">
              <select id="ward" aria-label=".form-select-sm">
                <option value="" selected>Chọn phường / xã</option>
              </select>
            </div>
          </div>
          <div class="column payment-method">
            <!-- Phần Phương thức thanh toán -->
            <h2>PHƯƠNG THỨC THANH TOÁN</h2>
            <div class="method">
              <input type="radio" id="atm" name="payment" value="ATM" />
              <div class="icon-pay">
                <img src="assets/pic/ATM.png" alt="ATM icon" />
              </div>
              <label for="atm"> Thanh toán thẻ (ATM, Visa) </label>
            </div>
            <div class="method">
              <input type="radio" id="momo" name="payment" value="MoMo" />
              <div class="icon-pay">
                <img src="assets/pic/momo.webp" alt="MoMo icon" />
              </div>
              <label for="momo"> Thanh toán bằng MoMo </label>
            </div>
            <div class="method">
              <input type="radio" id="cod" name="payment" value="COD" />
              <div class="icon-pay">
                <img src="assets/pic/truck.svg" alt="COD icon" />
              </div>
              <label for="cod"> Thanh toán khi nhận hàng (COD) </label>
            </div>
          </div>
          <div class="finish">
            <a
              href="shopping-cart.html"
              class=""
              style="color: #338dbc; text-decoration: none"
              >Giỏ hàng</a
            >
            <button class="btn-total">Hoàn tất đơn hàng</button>
          </div>
        </form>
      </div>

      <div class="order-summary">
        <!-- Danh sách sản phẩm -->
        <table class="product-list">
          <tbody class="body-list">
            <tr class="product-item">
              <td class="item-img">
                <div class="pic-img">
                  <img
                    src="assets/pic/notebook-flower.avif"
                    alt="Product Image"
                    class="img-product"
                  />
                  <span>1</span>
                </div>
                <h2>Sổ tay hình hoa Lavender</h2>
              </td>

              <td class="item-price">
                <h2>160.000đ</h2>
              </td>
            </tr>
            <tr class="product-item">
              <td class="item-img">
                <div class="pic-img">
                  <img
                    src="assets/pic/notebook-flower.avif"
                    alt="Product Image"
                    class="img-product"
                  />
                  <span>1</span>
                </div>
                <h2>Sổ tay hình hoa Lavender</h2>
              </td>
              <td class="item-price">
                <h2>160.000đ</h2>
              </td>
            </tr>
            <tr class="product-item">
              <td class="item-img">
                <div class="pic-img">
                  <img
                    src="assets/pic/notebook-flower.avif"
                    alt="Product Image"
                    class="img-product"
                  />
                  <span>1</span>
                </div>
                <h2>Sổ tay hình hoa Lavender</h2>
              </td>
              <td class="item-price">
                <h2>160.000đ</h2>
              </td>
            </tr>
          </tbody>
        </table>

        <!-- Voucher Section -->
        <div class="voucher-section">
          <form action="post" class="form-voucher">
            <input
              class="id-voucher"
              name="voucher"
              id="voucher"
              type="text"
              placeholder="Mã giảm giá"
            />
            <button class="apply-voucher-btn"><p>Sử dụng</p></button>
          </form>
        </div>

        <!-- Tổng tiền -->
        <div class="provisional">
          <div class="row">
            <span>Tạm tính</span>
            <span>480,000đ</span>
          </div>
          <div class="row">
            <span>Phí vận chuyển</span>
            <span>—</span>
          </div>
        </div>
        <div class="total-section">
          <span>Tổng cộng</span>
          <span
            ><span style="font-size: 16px; margin-right: 6px; color: #9a9a9a"
              >VND</span
            >
            480,000đ</span
          >
        </div>
      </div>
    </main>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script>
      var citis = document.getElementById("city");
      var districts = document.getElementById("district");
      var wards = document.getElementById("ward");
      var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
      };
      var promise = axios(Parameter);
      promise.then(function (result) {
        renderCity(result.data);
      });

      function renderCity(data) {
        for (const x of data) {
          citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
          district.length = 1;
          ward.length = 1;
          if (this.value != "") {
            const result = data.filter((n) => n.Id === this.value);

            for (const k of result[0].Districts) {
              district.options[district.options.length] = new Option(
                k.Name,
                k.Id
              );
            }
          }
        };
        district.onchange = function () {
          ward.length = 1;
          const dataCity = data.filter((n) => n.Id === citis.value);
          if (this.value != "") {
            const dataWards = dataCity[0].Districts.filter(
              (n) => n.Id === this.value
            )[0].Wards;

            for (const w of dataWards) {
              wards.options[wards.options.length] = new Option(w.Name, w.Id);
            }
          }
        };
      }
    </script>
  </body>
</html>




