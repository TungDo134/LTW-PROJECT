<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chi tiết sản phẩm</title>

    <!-- Link FONTAWSOME -->
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
<body class="px-0 overflow-visible">

<jsp:include page="header.jsp"></jsp:include>

<div id="product-detail-container">
    <section id="product-detail">
        <div class="productPage">
            <div class="container">
                <div class="pro_content">
                    <div class="col_product_1">
                        <!-- <div class="slider-image">
                          <div class="flexslider">
                            <a href=""
                              ><img
                                src="/assets/pic/sample_pic_bestseller"
                                alt="Sổ tay 2 màu"
                            /></a>
                          </div>
                          <div class="carousel">
                            <ul class="sub-pic">
                              <li>
                                <img
                                  src="/assets/pic/sample_pic_bestseller"
                                  alt="Sổ tay 2 màu"
                                />
                              </li>
                              <li>
                                <img
                                  src="/assets/pic/sample_pic_bestseller"
                                  alt="Sổ tay 2 màu"
                                />
                              </li>
                            </ul>
                          </div>
                        </div> -->

                        <!-- Slider by Swiper -->
                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <!-- Content -->
                                <div class="swiper-slide">

                                    <a href=""
                                    ><img src="assets/pic/products/${detail.productImage}" alt=""
                                    /></a>
                                </div>
<%--                                <div class="swiper-slide">--%>
<%--                                    <a href=""--%>
<%--                                    ><img--%>
<%--                                            src="assets/pic/sample_sub1.avif"--%>
<%--                                            alt=""--%>
<%--                                    /></a>--%>
<%--                                </div>--%>
<%--                                <div class="swiper-slide">--%>
<%--                                    <a href=""--%>
<%--                                    ><img--%>
<%--                                            src="assets/pic/sample_subpicseller_2.avif"--%>
<%--                                            alt=""--%>
<%--                                    /></a>--%>
<%--                                </div>--%>

                            </div>
                            <!-- Pagination -->
                            <div class="swiper-pagination"></div>
                        </div>
                        <!-- Slider by Swiper -->
                    </div>
                    <div class="col_product_2">
                        <h1>${detail.productName}</h1>
                        <div class="price_pdPrice">
                            <div class="pro_price">
                                <h3>
                                    <f:setLocale value="vi_VN"/>
                                    <f:formatNumber value=" ${detail.productPrice}" type="currency"/>

                                </h3>
                            </div>
                            <div class="item_1">
                                <p>${detail.shortDes}</p>
                            </div>
                            <div class="item_2">
                                <i class="fa-solid fa-tags"></i>
                                <p><strong>Giảm giá từ 20%</strong></p>
                            </div>
                        </div>
                        <div class="cate">
                            <p>Trạng thái:</p>
                            <c:if test="${detail.productInventory ==0}">
                                <p>Hết hàng</p>
                            </c:if>
                            <c:if test="${detail.productInventory >=1}">
                                <p>Còn hàng</p>
                            </c:if>
                        </div>
                        <div class="shortDesc">
                            <p style="margin: 0; color: #111111; font-weight: 700">
                                Mô tả:
                            </p>
                            <p>
                                ${detail.productDes}
                            </p>
                        </div>
                        <div class="qty-cart">
                            <form id="form_pro" action="#">
                                <div class="quantity">
                                    <button type="button" class="decrease">-</button>
                                    <input
                                            type="text"
                                            name=""

                                            class="p-quantity"
                                            value="1"
                                    />

                                    <button type="button" class="increase">+</button>
                                </div>
                                <div class="select-swatch">

                                    <a style="cursor: pointer" onclick="getIdProduct(this)"
                                       data-id="${detail.productID}" class="add-to-cart">
                                        Thêm vào giỏ
                                    </a>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <button
                style="display: none"
                type="button"
                class="btn btn-primary btn_add icon-p "
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
        >
        </button>
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
                                data-bs-dismiss="modal"
                        >
                            <a
                                    href="Shopping-cart.jsp"
                                    style="color: #fff; font-size: 14px; font-weight: 600"
                            >XEM GIỎ HÀNG</a
                            >
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <!-- Thông tin -->
        <div id="bottom_detail-container">
            <div class="bottom_detail">
                <div class="bottom_detail_content">
                    <div class="left-section">
                        <div class="left-section-items">
                            <h5>Giao hàng</h5>
                            <p>
                                Đặt hàng ngay và nhận hàng trong khoảng
                                <strong>từ 3 tới 5 ngày</strong>
                            </p>
                            <p style="margin: 0">
                                Sản phẩm của chúng tôi được hoàn thiện với cái tâm trong
                                nghề.
                                <!-- <a href="#"> Find out more</a> -->
                            </p>
                        </div>
                        <div class="left-section-items">
                            <h5>Đổi trả</h5>
                            <p>
                                Do tính chất cá nhân hóa của các sản phẩm này, chúng tôi
                                thường không chấp nhận trả hàng. Tuy nhiên, nếu bạn không
                                hài lòng 100% với đơn hàng của mình, hãy liên hệ với chúng
                                tôi trong vòng 30 ngày kể từ ngày đặt hàng và chúng tôi sẽ
                                giải quyết.
                            </p>
                        </div>
                        <!-- <div class="left-section-items">
                          <h5>Address Book</h5>
                          <p>
                            Swap forgetfulness for thoughtfulness. Our personalized
                            address books have quick-find A to Z pages for loved ones’
                            details and space for your noteworthy dates. Keep in touch
                            effortlessly, never miss a friend’s birthday, and make sure
                            all the right people get the invite to your next party. No
                            more digital chaos. The address book is back in fashion –
                            and it’s here to stay.
                          </p>
                        </div> -->
                    </div>

                    <div class="right-section">
                        <div class="right-section-items">
                            <h3 class="right-item-title">Chúng tôi đem lại</h3>
                            <ul>
                                <li>
                                    Các sản phẩm thiết yếu như giấy, bút, bìa tài liệu, sổ
                                    tay, và các dụng cụ hỗ trợ công việc và học tập.
                                </li>
                                <li>
                                    Các sản phẩm giúp tổ chức thông tin, ghi chép, lưu trữ và
                                    quản lý thời gian hiệu quả
                                </li>
                                <li>
                                    Các vật dụng cá nhân hóa như sổ địa chỉ và danh sách quà
                                    tặng giúp kết nối và theo dõi các dịp quan trọng.
                                </li>
                                <li>
                                    Sản phẩm của chúng tôi tạo ra không gian làm việc chuyên
                                    nghiệp, giúp tăng cường hiệu quả công việc và tổ chức.
                                </li>
                            </ul>
                        </div>
                        <div class="right-section-items">
                            <h3 class="right-item-title">Có thể làm quà?</h3>
                            <p>
                                Dĩ nhiên, bạn hoàn toàn có thể sử dụng sản phẩm này làm quà
                                tặng cho người thân, bạn bè.
                            </p>
                        </div>
                        <div class="right-section-items">
                            <h3 class="right-item-title">Tính bền vững</h3>
                            <p>
                                Sản phẩm của chúng tôi tập trung rất nhiều vào chất lượng
                                nên bạn hoàn toàn có thể đặt niềm tin vào chúng tôi.
                            </p>
                            <!-- <a href="#" style="color: #1e2525; text-decoration: underline"
                              >Learn more</a
                            > -->
                        </div>
                    </div>
                </div>
                <div class="read-more">
                    <a href="" style="color: #1e2525">Xem thêm</a>
                </div>
            </div>
        </div>
    </section>

    <!-- sản phẩm liên quan -->
    <div class="container">
        <h2 class="text-center my-5">Có thể bạn sẽ thích</h2>
        <div id="layout">
            <div
                    class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-5"
            >
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card border border-0">
                        <a href="product-detail.jsp" class="forward-img">
                            <!-- ảnh sản phẩm -->
                            <div class="wrapper-img">
                                <img
                                        src="assets/pic/pen"
                                        class="card-img-top"
                                        style="background-color: #f4eee0; vertical-align: middle"
                                        alt="..."
                                />
                            </div>
                        </a>

                        <div class="card-body bg-body ms--15">
                            <div class="card-header-cus">
                                <h5 class="card-title fw-semibold">Card title</h5>
                                <h5 class="price me--15 fw-semibold">
                                    300.000<span class="currency">đ</span>
                                </h5>
                            </div>
                            <p class="card-text fs-7 fw-medium text-justify">
                                Rollerball Pen
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- review detail-product -->
    <section id="review-container">
        <div class="review">
            <div class="list-container">
                <div class="list-header">
                    <p>Đánh giá của khách hàng</p>
                </div>
                <div class="list-body">
                    <div class="list-aside">
                        <div class="summary-distribution">
                            <div class="average-header">
                                <h1>4.9</h1>
                                <div class="rating-star">
                                    <div class="star-icon">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <p>9 đánh giá</p>
                                </div>
                            </div>
                            <div class="average-body">
                                <div class="average-progress">
                                    <div class="average-progress-item-1">
                                        <p>5</p>
                                        <i class="fa-solid fa-star"></i>
                                        <div class="bar-rating">
                                            <div class="rating-percent"></div>
                                        </div>
                                    </div>
                                    <div class="average-progress-item-2">
                                        <p>4</p>
                                        <i class="fa-solid fa-star"></i>
                                        <div class="bar-rating">
                                            <div class="rating-percent"></div>
                                        </div>
                                    </div>
                                    <div class="average-progress-item-3">
                                        <p>3</p>
                                        <i class="fa-solid fa-star"></i>
                                        <div class="bar-rating">
                                            <div class="rating-percent"></div>
                                        </div>
                                    </div>
                                    <div class="average-progress-item-4">
                                        <p>2</p>
                                        <i class="fa-solid fa-star"></i>
                                        <div class="bar-rating">
                                            <div class="rating-percent"></div>
                                        </div>
                                    </div>
                                    <div class="average-progress-item-5">
                                        <p>1</p>
                                        <i class="fa-solid fa-star"></i>
                                        <div class="bar-rating">
                                            <div class="rating-percent"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="average-number">
                                    <p>8</p>
                                    <p>0</p>
                                    <p>1</p>
                                    <p>0</p>
                                    <p>0</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-main">
                        <div class="review-pane">
                            <div class="review-filter">
                                <button>Viết đánh giá</button>
                            </div>
                            <div class="review-comment">
                                <form class="form-comment">
                                    <div class="review-form">Đánh giá của bạn</div>
                                    <textarea name="" id=""></textarea>
                                    <div class="rating">
                                        <h2>Xếp hạng</h2>
                                        <div class="rating-stars">
                                            <input
                                                    type="radio"
                                                    id="star1"
                                                    name="rating"
                                                    value="1"
                                            />
                                            <label for="star1"
                                            ><i class="fa-solid fa-star color-star"></i
                                            ></label>

                                            <input
                                                    type="radio"
                                                    id="star2"
                                                    name="rating"
                                                    value="2"
                                            />
                                            <label for="star2"
                                            ><i class="fa-solid fa-star color-star"></i
                                            ></label>

                                            <input
                                                    type="radio"
                                                    id="star3"
                                                    name="rating"
                                                    value="3"
                                            />
                                            <label for="star3"
                                            ><i class="fa-solid fa-star color-star"></i
                                            ></label>

                                            <input
                                                    type="radio"
                                                    id="star4"
                                                    name="rating"
                                                    value="4"
                                            />
                                            <label for="star4"
                                            ><i class="fa-solid fa-star color-star"></i
                                            ></label>

                                            <input
                                                    type="radio"
                                                    id="star5"
                                                    name="rating"
                                                    value="5"
                                            />
                                            <label for="star5"
                                            ><i class="fa-solid fa-star color-star"></i
                                            ></label>
                                        </div>
                                        <span class="score">0/5</span>
                                    </div>
                                    <button type="submit">Gửi</button>
                                </form>
                            </div>

                            <c:forEach items="${reviews}" var="o">
                                <div class="review-list">
                                    <div class="review-item">
                                        <div class="item-desktop">
                                            <div class="review-header">
                                                <div class="item-left">
                                                    <div class="item-top">
                                                        <!-- <img src="./assets/pic/capyyyy.jpg" alt="avt" /> -->
                                                        <div class="item-details">
                                                            <p>${o.customerName}</p>
                                                            <p>${o.date}</p>
                                                        </div>
                                                    </div>
                                                    <div class="item-bottom">
                                                        <p>${o.comment}.</p>
                                                    </div>
                                                </div>
                                                <div class="item-right">
                                                    <p>Rating: ${o.rating}/5</p>
                                                    <p>★★★★★</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Đóng thẻ review-pane -->
                        </div>
                        <!-- Đóng thẻ list-main -->
                    </div>
                    <!-- Đóng thẻ list-body -->
                </div>
                <!-- Đóng thẻ list-container -->
            </div>
        </div>
        <!-- Đóng thẻ review -->
    </section>
    <!-- Đóng thẻ section -->
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

<%--  Add to cart AJAX (Detail Product) --%>
<script>
    function getIdProduct(tag) {
        const pID = $(tag).data('id');
        const quantity = $(".p-quantity").val().trim();
        console.log(pID + ' ' + quantity)
        $.ajax({
            url: 'add-card-dp', // Servlet URL
            type: 'GET',
            data: {
                pID: pID,
                quantity: quantity
            },
            success: function (response) {
                const button = document.querySelector('.icon-p');
                if (button) {
                    button.click(); // Kích hoạt sự kiện click
                }
            },
            error: function (xhr, status, error) {
                alert('Error: ' + xhr.responseText);
            }
        });
    }
</script>


<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<!-- Khởi tạo Swiper -->
<script src="assets/js/sub_img.js">
</script>
</body>
</html>
