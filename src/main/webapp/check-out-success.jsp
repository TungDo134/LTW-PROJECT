<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/10/2025
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đặt hàng thành công</title>
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
</head>
<body>

<main class="checkout-page m-5">
    <div class="container ">

        <!-- Checkout content -->
        <div class="checkout-container text-center mt-5">
            <div class="row gy-xl-3 justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="success-box p-5 rounded shadow-sm d-flex flex-column align-items-center gap-2" >
                    <h1 class="text-success display-4 mb-4" style="align-content:center;font-size:25px;padding-top:50px;">🎉 Đặt hàng thành công!</h1>
                    <p class="fs-4 fw-light" style="align-content:center;font-size:25px;">
                        Cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi. Đơn hàng của bạn đang được xử lý.
                    </p>
                    <img src="<%=request.getContextPath()%>/assets/pic/thank.png" alt="Cảm ơn" style="width:150px;height:auto;margin-top:50px;"/>
                  <div class="d-flex gap-2 justify-content-between mt-3  " style="cursor: pointer">
                      <a class="btn btn-primary" href="home">Quay về trang chủ</a>
                      <a class="btn btn-primary" href="products">Tiếp tục mua sắm</a>
                  </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</main>

</body>
</html>
