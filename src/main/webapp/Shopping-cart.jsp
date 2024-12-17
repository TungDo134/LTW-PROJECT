<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="entity.Cart" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>--%>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />
    <link rel="stylesheet" href="assets/css/styleShoppingCart.css"/>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<main id="shopping-cart-container">

    <!-- Shopping Cart Table -->
    <div class="main-cart">

        <div class="cart-table left">
            <table>
                <thead>
                <tr>
                    <th>Ảnh</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Tổng</th>
                    <th>Xóa</th>
                </tr>
                </thead>


                <tbody>

                <c:forEach items="${sessionScope.cart.list}" var="cp">
                    <tr>
                        <td><img src="<%=request.getContextPath()%>/assets/pic/products/${cp.img}" alt="Sản phẩm 1">
                        </td>
                        <td><p>${cp.title}</p></td>
                        <td><input type="text" name="quantity" class="p-quantity" value="${cp.quantity}"/></td>
                        <td><p class="price">${cp.price}đ</p></td>
                        <td><a href="remove-cart?pID=${cp.id}"><i class="fa fa-times"></i></a></td>
                    </tr>
                </c:forEach>
                <!-- Thêm các dòng sản phẩm khác nếu cần -->
                </tbody>
            </table>
            <div class="cart-controls">
                <a class="continue-shopping" href="products"
                >Tiếp tục mua sắm</a
                >
                <!-- <button class="update-cart">Update Cart</button> -->
            </div>

        </div>
        <div class="cart-table right">
            <div class="cart-header">
                <span>Khuyến mãi</span>
            </div>

            <!-- Discount Code Section -->
            <div class="discount-section">
                <form action="" style="display: flex" class="form-coupon">
                    <input type="text" placeholder="Mã giảm giá"/>
                    <button class="apply-discount">Áp dụng</button>
                </form>
            </div>

            <!-- Cart Summary Section -->
            <form action="payment.jsp" class="form-checkout">
                <div class="cart-summary">
                    <h2>Tổng đơn</h2>
                    <div class="cart-total-row">
                        <span>Số lượng sản phẩm:</span>

                        <%
                            Cart c = (Cart) session.getAttribute("cart");
                        %>
                        <span> <%= c == null ? "" : c.getTotalQuantity()%></span>

                    </div>
                    <div class="cart-total-row">
                        <span>Tổng tiền:</span>
                        <span class="total"
                        >
                        <%= c == null ? "" : c.getTotal() %>
                            <span class="currency">đ</span></span>
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
<%--<script src="assets/js/main.js"></script>--%>
</body>
</html>
