<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán thành công</title>
    <!-- Nhúng Bootstrap CSS từ CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS cho trang -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .payment-container {
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 40px;
            text-align: center;
            max-width: 600px;
            margin: 80px auto;
        }
        .payment-container h2 {
            color: #28a745;
            font-size: 30px;
            font-weight: bold;
        }
        .payment-container .btn {
            background-color: #007bff;
            border-color: #007bff;
        }
        .payment-container .btn:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .payment-logo {
            width: 80px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="payment-container">
        <!-- Logo VNPay -->
        <img src="<%=request.getContextPath()%>/assets/pic/vnpay.jpg" alt="VNPay Logo" class="payment-logo">

        <h2>✅ Thanh toán thành công!</h2>
        <p>Cảm ơn bạn! Đơn hàng của bạn đã được thanh toán thành công qua VNPay.</p>
        <div class="mt-4">
            <a href="home" class="btn btn-lg btn-block">Quay về trang chủ</a>
        </div>
    </div>
</div>

<!-- Nhúng Bootstrap JS từ CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
