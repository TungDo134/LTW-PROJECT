<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="entity.Cart" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
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

    <!-- Link jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
            <div class="cart-header">
                <span>Sản phẩm</span>
                <span>Số lượng</span>
                <span>Tổng tiền (VND)</span>
                <span>Hành động</span>
            </div>
            <c:forEach items="${sessionScope.cart.list}" var="cp">
                <!-- Product Rows -->
                <div class="cart-item" data-id="${cp.id}">
                    <div class="product-info">
                        <a href="detail?pid=${cp.id}">
                            <img src="<%=request.getContextPath()%>/assets/pic/products/${cp.img}" alt="Sản phẩm 1"></a>
                        <div>
                            <p>${cp.title}</p>
                            <p class="price number-format">
                                    <%-- <f:parseNumber value="${cp.price}" type="number" var="parsedNumber"/>&ndash;%&gt;--%>
                                <f:formatNumber value="${cp.price}"/>
                                <span class="currency">đ</span></p>
                        </div>
                    </div>
                    <div class="quantity" style="width: 100px">
                        <input onblur="updateCart(this)" name="quantity" id="" class="p-quantity"
                               data-id="${cp.id}" value="${cp.quantity}"/>
                    </div>
                    <div class="total-price number-format" id="total-price-${cp.id}">
                            <%-- <f:parseNumber value="${cp.totalCt}" type="number" var="parsedNumber"/>--%>
                        <f:formatNumber value="${cp.totalCt}"/>
                        <span>VND</span>
                    </div>
                    <div class="remove-item">
                        <div class="i-container">
                            <a href="remove-cart?pID=${cp.id}"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Cart Controls -->
            <div class="cart-controls">
                <a class="continue-shopping" href="products">Tiếp tục mua sắm</a>
                <!-- <button class="update-cart">Update Cart</button> -->
            </div>
        </div>

        <%--Cart Summary Section--%>
        <form action="payment.jsp" class="form-checkout">
            <div class="cart-summary">
                <h2>Tổng đơn</h2>
                <div class="cart-total-row">
                    <span>Tổng sản phẩm:</span>
                    <span class="subtotalQuantity">
                         <% Cart c = (Cart) session.getAttribute("cart");%>
                         <%= c == null ? "" : c.getTotalQuantity()%>
                    </span>
                </div>
                <div class="cart-total-row">
                    <span>Tổng tiền:</span>
                    <span class="total number-format">
                        <c:set var="balance" value="<%= c == null ? 0 : c.getTotal() %>"/>
<%-- <f:parseNumber value="${balance}" type="number" var="parsedNumber"/>--%>
                         <f:formatNumber value="${balance}"/>
                        <span>VND</span>
                    </span>
                </div>
                <button type="submit" class="checkout-button">
                    Tiến hành thanh toán
                </button>
            </div>
        </form>
    </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>

<%--<script src="assets/js/formatNum.js"></script>--%>

<%--Update cart--%>
<script src="assets/js/update_cart.js"></script>
</body>
</html>