<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Giỏ hàng</title>
    <!-- Link BOOTSRAP -->
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
    <!-- Link BOOTSRAP -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link rel="stylesheet" href="assets/css/styleShoppingCart.css" />
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>

    <main id="shopping-cart-container">
      <!-- Shopping Cart Table -->
      <div class="main-cart">
        <div class="cart-table left">
          <div class="cart-header">
            <span>Sản phẩm</span>
            <span>Số lượng</span>
            <span>Tổng</span>
          </div>
          <!-- Product Rows -->
          <div class="cart-item">
            <div class="product-info">
              <a href=""
                ><img src="assets/pic/pen" alt="T-shirt Contrast Pocket"
              /></a>
              <div>
                <p>Bút Kí Tên Chuyên Dụng</p>
                <p class="price">65.000đ</p>
              </div>
            </div>
            <div class="quantity">
              <button class="decrease">-</button>
              <input type="text" name="" id="" class="p-quantity" value="1" />
              <button class="increase">+</button>
            </div>
            <div class="total-price">65.000<span class="currency">đ</span></div>
            <div class="remove-item">
              <div class="i-container">
                <a href="#"><i class="fa fa-times"></i></a>
              </div>
            </div>
          </div>
          <div class="cart-item">
            <div class="product-info">
              <a href="">
                <img
                  src="./assets/pic/so_2_mau.avif"
                  alt="Diagonal Textured Cap"
              /></a>
              <div>
                <p>Sổ tay hình bông hoa</p>
                <p class="price">109.000đ</p>
              </div>
            </div>
            <div class="quantity">
              <button class="decrease">-</button>
              <input type="text" name="" id="" class="p-quantity" value="1" />
              <button class="increase">+</button>
            </div>
            <div class="total-price">
              109.000<span class="currency">đ</span>
            </div>
            <div class="remove-item">
              <div class="i-container">
                <a href="#"><i class="fa fa-times"></i></a>
              </div>
            </div>
          </div>
          <div class="cart-item">
            <div class="product-info">
              <a href="">
                <img
                  src="./assets/pic/notebook-flower.avif"
                  alt="Diagonal Textured Cap"
              /></a>
              <div>
                <p>Sổ tay hình bông hoa</p>
                <p class="price">109.000đ</p>
              </div>
            </div>
            <div class="quantity">
              <button class="decrease">-</button>
              <input type="text" name="" id="" class="p-quantity" value="1" />
              <button class="increase">+</button>
            </div>
            <div class="total-price">
              109.000<span class="currency">đ</span>
            </div>
            <div class="remove-item">
              <div class="i-container">
                <a href="#"><i class="fa fa-times"></i></a>
              </div>
            </div>
          </div>
          <div class="cart-item">
            <div class="product-info">
              <a href="">
                <img
                  src="./assets/pic/notebook-flower.avif"
                  alt="Diagonal Textured Cap"
              /></a>
              <div>
                <p>Sổ tay hình bông hoa</p>
                <p class="price">109.000đ</p>
              </div>
            </div>
            <div class="quantity">
              <button class="decrease">-</button>
              <input type="text" name="" id="" class="p-quantity" value="1" />
              <button class="increase">+</button>
            </div>
            <div class="total-price">
              109.000<span class="currency">đ</span>
            </div>
            <div class="remove-item">
              <div class="i-container">
                <a href="#"><i class="fa fa-times"></i></a>
              </div>
            </div>
          </div>
          <div class="cart-item">
            <div class="product-info">
              <a href="">
                <img
                  src="./assets/pic/notebook-flower.avif"
                  alt="Diagonal Textured Cap"
              /></a>
              <div>
                <p>Sổ tay hình bông hoa</p>
                <p class="price">109.000đ</p>
              </div>
            </div>
            <div class="quantity">
              <button class="decrease">-</button>
              <input type="text" name="" id="" class="p-quantity" value="1" />
              <button class="increase">+</button>
            </div>
            <div class="total-price">
              109.000<span class="currency">đ</span>
            </div>
            <div class="remove-item">
              <div class="i-container">
                <a href="#"><i class="fa fa-times"></i></a>
              </div>
            </div>
          </div>

          <!-- Cart Controls -->
          <div class="cart-controls">
            <a class="continue-shopping" href="product.jsp"
              >Tiếp tục mua sắm</a
            >
            <!-- <button class="update-cart">Update Cart</button> -->
          </div>
        </div>
        <!-- <div class="cart-table right">
          <div class="cart-header">
            <span>Khuyến mãi</span>
          </div> -->

          <!-- Discount Code Section -->
          <!-- <div class="discount-section">
            <form action="" style="display: flex" class="form-coupon">
              <input type="text" placeholder="Mã giảm giá" />
              <button class="apply-discount">Áp dụng</button>
            </form>
          </div> -->

          <!-- Cart Summary Section -->
          <form action="payment.jsp" class="form-checkout">
            <div class="cart-summary">
              <h2>Tổng đơn</h2>
              <div class="cart-total-row">
                <span>Tính trước:</span>
                <span class="subtotal"
                  >501.000<span class="currency">đ</span></span
                >
              </div>
              <div class="cart-total-row">
                <span>Tổng:</span>
                <span class="total"
                  >501.000<span class="currency">đ</span></span
                >
              </div>
              <button type="submit" class="checkout-button">
                Tiến hành thanh toán
              </button>
            </div>
          </form>
        </div>
      </div>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="assets/js/main.js"></script>
  </body>
</html>
