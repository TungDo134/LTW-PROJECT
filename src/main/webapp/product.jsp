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

    <!-- Link my CSS -->
    <link rel="stylesheet" href="assets/css/styleProduct.css"/>
</head>
<body class="bg-body px-0 overflow-visible">
<jsp:include page="header.jsp"></jsp:include>


<main id="product-container" style="margin: 12rem 0px">
    <div class="container">
        <!-- Filter and Sort -->
        <div class="fs_bar py-3">
            <div class="row">
                <!-- Filter -->
                <div class="col-6">
                    <button
                            class="btn_filter"
                            type="button"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasWithBothOptions"
                            aria-controls="offcanvasWithBothOptions"
                    >
                        Filter
                        <i class="fa-solid fa-caret-down"></i>
                    </button>

                    <div
                            class="offcanvas offcanvas-start"
                            data-bs-scroll="true"
                            tabindex="-1"
                            id="offcanvasWithBothOptions"
                            aria-labelledby="offcanvasWithBothOptionsLabel"
                            style="background-color: #fffefa"
                    >
                        <div class="offcanvas-header">
                            <button
                                    type="button"
                                    class="btn-close btn-close-custom"
                                    data-bs-dismiss="offcanvas"
                                    aria-label="Close"
                            >
                                <svg
                                        width="25"
                                        height="25"
                                        viewBox="0 0 25 25"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                        class="papier-icon icon-close-display fill-current cursor-pointer"
                                        style="height: 24px; width: 24px"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M13.4119 12.001L24.0416 21.9203L21.9203 24.0416L12.0208 13.4331L2.1213 24.0416L-2.36034e-05 21.9203L10.6297 12.001L-3.05176e-05 2.12132L2.12129 2.14577e-06L12.0208 10.6511L21.9203 1.52588e-05L24.0416 2.12134L13.4119 12.001Z"
                                            fill="#1E2525"
                                            style="background: red"
                                    ></path>
                                </svg>
                            </button>
                        </div>
                        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">
                            Tất cả lọc
                        </h5>
                        <div class="offcanvas-body">
                            <form action="filter-product" method="get">
                                <!-- Lọc giá -->
                                <div class="filter-container">
                                    <div class="filter-title">Lọc bởi</div>
                                    <div class="filter-category">Giá +</div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" value="1"/> Nhỏ
                                        hơn 50,000đ
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" value="2"/>
                                        50,000đ - 100,000đ
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" value="3"/>
                                        100,000đ - 200,000đ
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" value="4"/>
                                        200,000đ - 500,000đ
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="priceRange" value="5"/> Lớn
                                        hơn 500,000đ
                                    </div>
                                </div>

                                <!-- Lọc thể loại -->
                                <div class="filter-container">
                                    <div class="filter-category">Sản phẩm +</div>

                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" value="10"/> bìa
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" value="9"/> giấy
                                        dán, giấy nhớ
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" value="8"/> sổ tay,
                                        tập
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" value="7"/> gom,
                                        thước
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" value="6"/> bút bi,
                                        bút chì
                                    </div>
                                </div>

                                <!-- Nút xóa + lọc -->
                                <div class="filter-btn-group">
                                    <a class="filter-items delete-btn">Xóa</a>
                                    <button class="filter-items" type="submit">Lọc</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- Sort -->
                <div class="col">
                    <div class="sort" style="display: inline-block">
                        <span>Sắp xếp:</span>
                        <div class="custom-select">
                            <div class="select-selected">Giá: Thấp đến cao</div>
                            <div class="select-options">
                                <div class="select-option" data-value="1">
                                    <a class="sort-btn w-100 d-inline-block"
                                       href="sort-product?choice=1">Giá: Thấp đến
                                        cao</a>
                                </div>

                                <div class="select-option" data-value="2">
                                    <a class="sort-btn w-100 d-inline-block"
                                       href="sort-product?choice=2">Giá: Cao đến
                                        thấp</a>
                                </div>

                                <div class="select-option" data-value="3">
                                    <a class="sort-btn w-100 d-inline-block"
                                       href="sort-product?choice=3">Tên: A-Z</a>
                                </div>

                                <div class="select-option" data-value="4">
                                    <a class="sort-btn w-100 d-inline-block"
                                       href="sort-product?choice=4">Tên: Z-A</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Filter and Sort -->
                <div
                        class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3"
                >
                    <c:forEach items="${products}" var="o">
                        <div class="col">
                            <div class="card border border-0">
                                <a href="detail?pid=${o.productID}" class="forward-img">
                                    <!-- ảnh sản phẩm -->
                                    <div class="wrapper-img">
                                        <img
                                                src="assets/pic/products/${o.productImage}"
                                                class="card-img-top"
                                                style="background-color: #f4eee0"
                                                alt="..."
                                        />
                                    </div>
                                    <!-- nút thêm nhanh vào giỏ hàng -->
                                    <div class="add-to-cart">


                                        <form onsubmit="getIdProduct(this); return false">
                                            <input type="hidden" value="${o.productID}" name="pID">
                                            <c:if test="${o.productStock == 0}">
                                                <p class="card-text fs-5 fw-medium text-justify text-secondary">
                                                    Hết hàng
                                                </p>
                                            </c:if>

                                            <c:if test="${o.productStock > 0}">
                                                <button class="btn" type="submit"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        data-bs-custom-class="custom-tooltip"
                                                        data-bs-title="Thêm vào giỏ hàng.">
                                                    <img src="assets/pic/shopping_cart_icon.svg" alt="ảnh"/>
                                                </button>
                                            </c:if>


                                        </form>
                                    </div>
                                </a>


                                <div class="card-body bg-body ms--15">
                                    <div class="card-header-cus">
                                        <h5 class="card-title fw-semibold">${o.productName}</h5>
                                        <h5 class="price me--15 fw-semibold number-format">
                                            <f:setLocale value="vi_VN"/>
                                            <f:formatNumber value="${o.productPrice}" type="currency"/>

                                        </h5>
                                    </div>
                                    <p class="card-text fs-7 fw-medium text-justify">
                                            ${o.shortDes}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <%--  Hiện thông báo nếu thêm vô giỏ thành công --%>
                    <span data-bs-target="#exampleModal" data-bs-toggle="modal">
    <button
            class="icon-p"
            type="button"
            style="display: none"
    ></button> </span>

                </div>
                <div class="page" style="display: none">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
    <span aria-hidden="true"
    ><i class="fa-solid fa-chevron-left"></i
    ></span>
                                </a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#" style="">1</a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
    <span aria-hidden="true"
    ><i class="fa-solid fa-chevron-right"></i
    ></span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
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


</main>

<jsp:include page="footer.jsp"></jsp:include>

<!-- Link CUSTOM JS -->
<script src="assets/js/main.js"></script>
<%--<script src="assets/js/formatNum.js"></script>--%>
<script>
    //// JS cho phần hiện tooltip khi hover vào icon giỏ hàng (bstrap) ////
    const tooltipTriggerList = document.querySelectorAll(
        '[data-bs-toggle="tooltip"]'
    );

    const tooltipList = [...tooltipTriggerList].map(
        (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl)
    );

    // Ngăn chặn sự kiện click của thẻ span không thực hiện logic của thẻ a
    $(".add-to-cart span").click(function (event) {
        event.preventDefault(); // Ngừng hành động mặc định của thẻ a (theo href)
        event.stopPropagation(); // Ngừng sự kiện nổi bọt tới thẻ a
    });
</script>

<%--AJAX add to cart--%>
<script>
    function getIdProduct(form) {
        const pID = form.querySelector('[name="pID"]').value;
        $.ajax({
            url: 'add-cart', // Servlet URL
            type: 'GET',
            data: {
                pID: pID
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

</body>
</html>
