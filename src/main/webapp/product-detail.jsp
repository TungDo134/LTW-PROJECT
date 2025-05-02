<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entity.Product, entity.SubImgProduct, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chi tiết sản phẩm</title>

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    />

    <!-- Link JQUERY-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Link BOOTSTRAP -->
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
    <!-- Link BOOTSTRAP -->

    <!-- Link Swiper's CSS -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <!-- Link MY CSS -->
    <link rel="stylesheet" href="assets/css/styleProductDetail.css"/>
</head>

<body class="bg-body px-0 overflow-visible">
<jsp:include page="header.jsp"></jsp:include>
<%--<div class="breadcrumb">--%>
<%--    <a href="#">VĂN PHÒNG PHẨM - DỤNG CỤ HỌC SINH</a> &gt;--%>
<%--    <a href="#">SẢN PHẨM VỀ GIẤY</a> &gt;--%>
<%--    <a href="#">SỔ CÁC LOẠI</a>--%>
<%--</div>--%>
<div class="container">
    <div class="container_Info">

        <%
            Product product = (Product) request.getAttribute("detail");
            SubImgProduct subImgP = (SubImgProduct) request.getAttribute("listSubImg");
            List<Product> products = (List<Product>) request.getAttribute("products");
        %>

        <div class="left-column">
            <div class="detailProduct ">
                <div class="product-images">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <!-- Content -->
                            <div class="swiper-slide">
                                <a href=""
                                ><img src="assets/pic/products/${detail.productImage}" alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg1} "

                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg2}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg3}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg4}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg5}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg6}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg7}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg8}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg9}"
                                        alt=""
                                /></a>
                            </div>

                            <div class="swiper-slide">
                                <a href=""
                                ><img
                                        src="assets/pic/subP/${listSubImg.subImg10}"
                                        alt=""
                                /></a>
                            </div>

                        </div>
                        <!-- Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>


                <div class="product-info">
                    <h1 class="product-title"><%= product.getProductName() %>
                    </h1>
                    <p class="price">
                        Giá ne:
                        <f:setLocale value="vi_VN"/>
                        <c:choose>
                            <c:when test="<%= product.getIsDiscount()==1 %>">
                                                       <span class="text-danger fw-bold">
                                                    <f:formatNumber value="<%= product.getDiscountPrice() %>"
                                                                    type="currency"/>
                                                    </span>
                                <del class="text-muted me-2" style="font-size: 14px">
                                    <f:formatNumber value="<%= product.getProductPrice() %>" type="currency"/>
                                </del>

                            </c:when>
                            <c:otherwise>
                                                <span class="text-dark fw-bold">
                                            <f:formatNumber value="<%= product.getProductPrice() %>"
                                                            type="currency"/></span>
                            </c:otherwise>
                        </c:choose>
                        <%--                        <f:formatNumber value="<%= product.getProductPrice() %>" type="currency"/>--%>
                    </p>


                    <div class="btn-container">
                        <button type="button" class="btn addBtn btn-primary add-to-cart"
                        <%-- form="add-to-cart-form"--%>

                                data-id="<%= product.getProductID() %>">
                            Thêm vào giỏ hàng
                        </button>
                        <button class="btn btn-buy">Mua ngay</button>
                    </div>
                    <%--  Hiện thông báo nếu thêm vô giỏ thành công --%>
                    <span data-bs-target="#exampleModal" data-bs-toggle="modal">
                    <button
                            class="icon-p"
                            type="button"
                            style="display: none"
                    ></button> </span>

                    <div class="policy">
                        <h2>Chính sách ưu đãi:</h2>
                        <p><strong>🕒 Thời gian giao hàng:</strong> Giao nhanh và uy tín</p>
                        <p><strong>🔄 Chính sách đổi trả:</strong> Đổi trả miễn phí toàn quốc</p>
                        <p><strong>🎁 Chính sách khách sỉ:</strong> Ưu đãi khi mua số lượng lớn</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="right-column">
            <div class="infoPro">
                <h2>
                    <button class="new">MỚI</button>
                    <%= product.getProductName() %>
                </h2>
                <p>Nhà cung cấp: <strong>${manufacturer.manuName}</strong></p>
                <p>Xuất xứ: <strong>${manufacturer.brandOrigin}</strong></p>
                <div class="frameRatingSell">
                    <div class="rating">
                        <p><i class="fa-regular fa-star"></i></p>
                        <p><i class="fa-regular fa-star"></i></p>
                        <p><i class="fa-regular fa-star"></i></p>
                        <p><i class="fa-regular fa-star"></i></p>
                        <p><i class="fa-regular fa-star"></i></p>
                        <p>Đánh giá</p>
                    </div>
                    <div class="sell">
                        Đã bán: <%= product.getProductOrder() %>
                    </div>
                </div>
                <p class="price">
                    <f:setLocale value="vi_VN"/>
                    <c:choose>
                        <c:when test="<%= product.getIsDiscount()==1 %>">
                                                       <span class="text-danger fw-bold">
                                                    <f:formatNumber value="<%= product.getDiscountPrice() %>"
                                                                    type="currency"/>
                                                    </span>
                            <del class="text-muted me-2" style="font-size: 14px">
                                <f:formatNumber value="<%= product.getProductPrice() %>" type="currency"/>
                            </del>

                        </c:when>
                        <c:otherwise>
                                                <span class="text-dark fw-bold">
                                            <f:formatNumber value="<%= product.getProductPrice() %>"
                                                            type="currency"/></span>
                        </c:otherwise>
                    </c:choose>
                    <%--                    <f:formatNumber value="<%= product.getProductPrice() %>" type="currency"/>--%>
                </p>

            </div>
            <div class="infoShip">
                <h2>Thông tin vận chuyển</h2>
                <p>giao hàng đến: <strong>Phường Bến Nghé, Quận 1, Hồ Chí Minh</strong></p>
                <a href=""> Thay đổi</a>
                <div class="delivery_Details">
                    <div class="deliveryDetail">
                        <i class="fa-solid fa-truck-fast"></i>
                    </div>
                    <div class="expected_delivery-details">
                        <strong>Giao hàng tiêu chuẩn</strong>
                        <p>Dự kiến giao: <strong>Thứ năm, 27/03</strong></p>
                    </div>
                </div>
                <div class="Voucher">
                    <h2>Ưu đãi liên quan <a href="">Xem thêm ></a></h2>
                    <div class="voucher_code">
                        <div class="code">
                            <p><i class="fa-solid fa-ticket"></i> Mã giảm giá 10k TOPPING</p>
                        </div>

                        <div class="code">
                            <p><i class="fa-solid fa-ticket"></i> Mã giảm giá 10k TOPPING</p>
                        </div>
                        <div class="code">
                            <p><i class="fa-solid fa-ticket"></i> Mã giảm giá 10k TOPPING</p>
                        </div>
                        <div class="code">
                            <p><i class="fa-solid fa-ticket"></i> Mã giảm giá 10k TOPPING</p>
                        </div>

                    </div>

                </div>
                <div class="product-view-configuable-desktop">
                    <div><strong>Phân loại:</strong></div>
                    <div>
                        <ul class="product-view-configuable-list">
                            <li data-id="">Vàng</li>
                            <li data-id="">Xanh</li>
                            <li data-id="">Tím</li>
                            <li data-id="">Hồng</li>
                        </ul>
                    </div>
                </div>
                <c:if test="${detail.productStock >0}">
                    <form id="add-to-cart-form" class="quantity">
                        <div><strong>Số lượng:</strong></div>
                        <div class="change_quantity">
                            <button class="decrease">-</button>
                            <input
                                    type="text"
                                    name=""
                                    id="quantity-input"
                                    class="p-quantity"
                                    value="1"
                            />

                            <button class="increase">+</button>
                        </div>
                    </form>
                </c:if>
            </div>
            <div class="detailInfo">
                <!-- Thông tin sản phẩm -->
                <h2>${product.name}</h2>
                <p>Giá: ${product.price}</p>
                <p>Mô tả: ${product.description}</p>

                <h3>Thông tin nhà sản xuất</h3>


                <c:if test="${not empty detail}">
                    <table class="product-table">
                        <tbody>
                        <tr>
                            <th scope="row">Mã hàng</th>
                            <td>${detail.productID}</td>
                        </tr>
                        <tr>
                            <th scope="row">Tên Nhà Cung Cấp</th>
                            <td>${manufacturer.manuName}</td>
                        </tr>
                        <tr>
                            <th scope="row">Thương Hiệu</th>
                            <td>${detail.brand}</td>
                        </tr>
                        <tr>
                            <th scope="row">Xuất Xứ Thương Hiệu</th>
                            <td>${manufacturer.brandOrigin}</td>
                        </tr>
                        <tr>
                            <th scope="row">Nơi Gia Công & Sản Xuất</th>
                            <td>${manufacturer.manufactureLocation}</td>
                        </tr>
                        <tr>
                            <th scope="row">Màu sắc</th>
                            <td>${detail.color}</td>
                        </tr>
                        <tr>
                            <th scope="row">Chất liệu</th>
                            <td>${detail.material}</td>
                        </tr>
                        <tr>
                            <th scope="row">Trọng lượng (gr)</th>
                            <td>${detail.weight}</td>
                        </tr>
                        <tr>
                            <th scope="row">Kích Thước Bao Bì</th>
                            <td>${detail.dimensions}</td>
                        </tr>
                        <tr>
                            <th scope="row">Sản phẩm bán chạy nhất</th>
                            <td>
                                <c:choose>
                                    <c:when test="${detail.bestSeller}">
                                        Top 100 sản phẩm Sổ Các Loại bán chạy của tháng
                                    </c:when>
                                    <c:otherwise>
                                        Không nổi bật
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </c:if>





                <p>Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm,
                    hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận
                    chuyển, phụ phí hàng cồng kềnh,...</p>
                <p style="color: brown;">Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách
                    Fahasa trên toàn quốc</p>
            </div>
            <div class="describe">
                <h2><strong>Mô tả sản phẩm</strong></h2>
                <p><%= product.getProductDes()%>
                </p>
            </div>
        </div>
    </div>

    <div class="rating-container">
        <!-- Hàng 1: 3 cột -->
        <div class="rating-row">
            <!-- Cột 1: Điểm trung bình -->
            <div class="left_rate">
                <h2>Đánh giá sản phẩm</h2>
                <div class="score_rating">
                    <div class="rating-score"><%= request.getAttribute("averageRating") %><span>/5</span></div>
                    <div class="stars">
                        <% int avgRating = (int) Math.round((double) request.getAttribute("averageRating")); %>
                        <% for (int i = 0; i < avgRating; i++) { %> ★ <% } %>
                        <% for (int i = avgRating; i < 5; i++) { %> ☆ <% } %>
                        <span>(<%= request.getAttribute("totalReviews") %> đánh giá)</span>
                    </div>
                </div>
            </div>

            <!-- Cột 2: Thanh đánh giá theo % -->
            <div class="right_rating">
                <div class="rating-bars">
                    <% double[] ratingPercentages = (double[]) request.getAttribute("ratingPercentages"); %>
                    <% int[] ratingCounts = (int[]) request.getAttribute("ratingCounts"); %>
                    <% for (int i = 5; i >= 1; i--) { %>
                    <div class="rating-bar">
                        <span><%= i %> sao</span>
                        <div class="bar">
                            <div class="bar-filled" style="width: <%= ratingPercentages[i - 1] %>%"></div>
                        </div>
                        <span><%= ratingCounts[i - 1] %></span>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Cột 3: Form gửi đánh giá -->
            <div class="review-comment">
                <form action="add-review" method="post">
                    <input type="hidden" name="productID" value="${detail.productID}" required/>
                    <input type="text" name="customerName" placeholder="Tên" required/>
                    <input type="text" name="comment" placeholder="Đánh giá của bạn" required/>
                    <div class="rating">
                        <h2>Xếp hạng</h2>
                        <div class="rating-stars">
                            <% for (int i = 1; i <= 5; i++) { %>
                            <input type="radio" id="star<%= i %>" name="rating" value="<%= i %>"
                                   onclick="updateRating(<%= i %>)"/>
                            <label for="star<%= i %>"><i class="fa-solid fa-star"></i></label>
                            <% } %>
                        </div>
                        <p id="selected-rating">Chưa chọn</p>
                    </div>
                    <button type="submit" class="btn btn-primary"><a class="m-auto text-white">
                        Gửi đánh giá
                    </a></button>
                </form>
            </div>
        </div>

        <!-- Hàng 2: Danh sách bình luận -->
        <div class="review-list">
            <c:forEach items="${reviews}" var="o">
                <div class="review-item">
                    <div class="review-header">
                        <div class="item-details">
                            <p>${o.customerName}</p>
                            <p>${o.date}</p>
                        </div>
                    </div>
                    <div class="review-content">
                        <c:choose>
                            <c:when test="${o.display == 0}">
                                <p>Bình luận đang được kiểm duyệt</p>
                            </c:when>
                            <c:otherwise>
                                <p>${o.comment}</p>
                                <div class="review-stars">
                                    <c:forEach var="i" begin="1" end="5">
                                        <c:choose>
                                            <c:when test="${i <= o.rating}">
                                                <span class="star">★</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="star">☆</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div class="product-section">
        <h2>FAHASA GIỚI THIỆU</h2>
        <div class="product-list">
            <!-- Sản phẩm 1 -->
            <div class="product-item">
                <img src="https://cdn0.fahasa.com/media/catalog/product/8/8/8809387693926-mau3.jpg"
                     alt="Sổ Bonicrew A5">
                <p class="product-name">Sổ Bonicrew A5 - Giấy Trơn - 64 Trang - Oxford SWN1A5 - Màu Tím</p>
                <div class="product-price">
                    <span class="sale-price">20.700 đ</span>
                    <span class="original-price">23.000 đ</span>
                    <span class="discount">-10%</span>
                </div>
                <div class="rating">★★★★★ (0)</div>
            </div>

            <!-- Sản phẩm 2 -->
            <div class="product-item">
                <img src="https://cdn0.fahasa.com/media/catalog/product/8/8/8809387693926-mau3.jpg"
                     alt="Sổ Bonicrew A5">
                <p class="product-name">Sổ Bonicrew A5 - Giấy Trơn - 64 Trang - Oxford SWN1A5 - Màu Xanh</p>
                <div class="product-price">
                    <span class="sale-price">20.700 đ</span>
                    <span class="original-price">23.000 đ</span>
                    <span class="discount">-10%</span>
                </div>
                <div class="rating">★★★★★ (0)</div>
            </div>

            <!-- Sản phẩm 3 -->
            <div class="product-item">
                <img src="https://cdn0.fahasa.com/media/catalog/product/8/8/8809387693926-mau3.jpg"
                     alt="Sổ Bonicrew A5">
                <p class="product-name">Sổ Bonicrew A5 - Giấy Trơn - 64 Trang - Oxford SWN1A5 - Màu Đỏ</p>
                <div class="product-price">
                    <span class="sale-price">20.700 đ</span>
                    <span class="original-price">23.000 đ</span>
                    <span class="discount">-10%</span>
                </div>
                <div class="rating">★★★★★ (0)</div>
            </div>

            <!-- Sản phẩm 4 -->
            <div class="product-item">
                <img src="https://cdn0.fahasa.com/media/catalog/product/8/8/8809387693926-mau3.jpg"
                     alt="Sổ Bonicrew A5">
                <p class="product-name">Sổ Bonicrew A5 - Giấy Trơn - 64 Trang - Oxford SWN1A5 - Màu Vàng</p>
                <div class="product-price">
                    <span class="sale-price">20.700 đ</span>
                    <span class="original-price">23.000 đ</span>
                    <span class="discount">-10%</span>
                </div>
                <div class="rating">★★★★★ (0)</div>
            </div>

            <!-- Sản phẩm 5 -->
            <div class="product-item">
                <img src="https://cdn0.fahasa.com/media/catalog/product/8/8/8809387693926-mau3.jpg" alt="Sổ Lò Xo">
                <p class="product-name">Sổ Lò Xo Design B5 80 Trang - Oxford DR01B5 - Màu Đỏ</p>
                <div class="product-price">
                    <span class="sale-price">24.000 đ</span>
                    <span class="original-price">32.000 đ</span>
                    <span class="discount">-25%</span>
                </div>
                <div class="rating">★★★★★ (0)</div>
            </div>
        </div>

        <!-- Nút xem thêm -->
        <div class="view-more">
            <button>Xem thêm</button>
        </div>
    </div>

    <div class="suggested-section">
        <h2>✨ Gợi ý cho bạn ✨</h2>
        <div class="suggested-list">
            <c:forEach items="${products}" var="o">
                <!-- Sản phẩm 1 -->
                <a href="detail?pid=${o.productID}&cID=${o.cateID}" class="suggested-item">
                    <img src="assets/pic/products/${o.productImage}" alt="${o.productName}">
                    <p class="product-name">${o.productName}</p>
                    <div class="product-price">
                        <span class="sale-price">20.700 đ</span>

                        <span class="original-price"><f:setLocale value="vi_VN"/>
                        <f:formatNumber value="${o.productPrice}" type="currency"/></span>
                        <span class="discount">-10%</span>
                    </div>
                </a>
            </c:forEach>
            <!-- Modal -->
            <div
                    class="modal fade"
                    id="exampleModal"
                    tabindex="-1"
                    aria-labelledby="exampleModalLabel"
                    aria-hidden="true"
            >
                <div class="modal-dialog modal-sm" style="margin-top: 10rem">
                    <div class="modal-content rounded-0">
                        <div
                                class="modal-header bg-dark border border-0 rounded-0"
                                style="height: 25px; padding: 20px 0px"
                        >
                            <h1
                                    class="modal-title fs-6 fw- text-light text-center w-100 ps-2"
                                    id="exampleModalLabel"
                            >
                                THÔNG BÁO
                            </h1>
                            <button
                                    type="button"
                                    class="btn-close btn-custom"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                            ></button>
                        </div>
                        <div
                                class="modal-body text-center text-secondary-emphasis fst-italic"
                                style="height: 20px"
                        >
                            Thêm vào giỏ hàng thành công...
                        </div>
                        <div class="modal-footer border border-0">
                            <button
                                    type="button"
                                    class="btn btn-secondary w-50 mx-auto bg-dark rounded-0"
                                    style="display: unset;
                                    padding: 6px 12px"
                                    data-bs-dismiss="modal"
                            >
                                <a
                                        href="show-cart"
                                        style="color: #fff; font-size: 14px; font-weight: 600"
                                >XEM GIỎ HÀNG</a
                                >
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
<!-- sản phẩm liên quan -->


</div>

<!--  -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- JS -->
<script src="assets/js/main.js"></script>
<script>
    // JS cho phần click vào sub img
    $("li img").on("click", function () {
        $("li img").removeClass("active-carousel-img");
        $(this).toggleClass("active-carousel-img");
    });

    // JS cho phần show less
    $(".read-more a").on("click", function (e) {
        e.preventDefault();
        let target = $(document).find(".bottom_detail");
        target.toggleClass("show-less");

        // đổi lại text
        if (target.hasClass("show-less")) {
            $(this).text("Xem ít hơn");
        } else {
            $(this).text("Xem thêm");
        }
    });

    // Xử lí phần đóng mở ô review
    $(".review-filter button").on("click", function () {
        $(".review-comment").css("display", "flex");
    });

    //xử lý rating
    document.querySelectorAll(".rating-stars input").forEach((input) => {
        input.addEventListener("change", (event) => {
            let value = event.target.value; // Lấy giá trị đã chọn
            const stars = document.querySelectorAll(".rating-stars label i");

            // Đánh dấu sao theo giá trị
            stars.forEach((star, index) => {
                if (index < value) {
                    star.style.color = "#f5c518"; // Màu sao được chọn
                } else {
                    star.style.color = "#ccc"; // Màu sao chưa chọn
                }
            });

            // Hiển thị điểm số
            console.log(value);
            document.querySelector(".score").textContent = value + '/5';
        });
    });
</script>

<script>
    function updateRating(stars) {
        document.getElementById("selected-rating").innerText = `Bạn chọn ${stars} sao`;
    }

</script>
<%--Add sản phẩm vào giỏ hàng ajax--%>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const addToCartBtn = document.querySelector(".add-to-cart");
        const quantityInput = document.querySelector("#quantity-input");
        const increaseBtn = document.querySelector(".increase");
        const decreaseBtn = document.querySelector(".decrease");

        // Xử lý sự kiện tăng giảm số lượng
        if (increaseBtn) {
            increaseBtn.addEventListener("click", function (event) {
                event.preventDefault(); // Ngừng hành động mặc định của nút
                let quantity = parseInt(quantityInput.value, 10) || 1;
                quantityInput.value = value + 1; // Tăng số lượng
            });
        }

        if (decreaseBtn) {
            decreaseBtn.addEventListener("click", function (event) {
                event.preventDefault(); // Ngừng hành động mặc định của nút
                let quantity = parseInt(quantityInput.value, 10) || 1;
                if (quantity > 1) {
                    quantityInput.value = value - 1; // Giảm số lượng
                }
            });
        }

        // Xử lý sự kiện click để thêm sản phẩm vào giỏ hàng
        if (addToCartBtn) {
            addToCartBtn.addEventListener("click", function (event) {
                event.preventDefault(); // Ngừng hành động mặc định của nút

                const productId = addToCartBtn.getAttribute("data-id");
                const quantity = quantityInput.value;

                if (quantity <= 0 || isNaN(quantity)) {
                    alert("Vui lòng nhập số lượng hợp lệ!");
                    return;
                }

                $.ajax({
                    url: "add-card-dp",
                    type: "GET",
                    data: {pID: productId, quantity},
                    success: function () {
                        // alert("Sản phẩm đã thêm vào giỏ hàng!");
                        const button = document.querySelector('.icon-p');
                        if (button) {
                            button.click(); // Kích hoạt sự kiện click
                        }
                    },
                    error: function (xhr) {
                        console.error("Lỗi:", xhr.responseText);
                    }
                });
            });
        }
    });

</script>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- Khởi tạo Swiper -->
<script src="assets/js/sub_img.js"></script>

</body>
</html>
