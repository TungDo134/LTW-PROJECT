<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 3/24/2025
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css"
          integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer"
  />

  <script
          src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
          integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer"
  ></script>
  <!-- Load reCAPTCHA script -->
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>

  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/styleFormSignup-login.css">
</head>
<body>
<div class="login-signup-container">
  <main class="login-signup login">
    <%--  Quên mật khẩu--%>
    <div class="forgot-pass">
      <%
        String msgLogin = (String) request.getAttribute("error");
      %>
      <form id="forgotPass-form" method="post" action="<%=request.getContextPath()%>/forgotPass">
        <label class="label-Login" aria-hidden="true" style="margin-bottom: 20px;font-size: 30px;display: flex;justify-content: center;color: #000;">Quên mật khẩu </label>

        <span style="text-align: center; display: block; color: darkred">
                        ${error}</span>
          <span style="text-align: center; display: block; color: green">
              ${success}
          </span>
          <label for="email" class="form-label"> </label>
        <input id="email" type="email" name="email" placeholder="Email" required=""/>



        <!-- Google reCAPTCHA -->
        <div class="g-recaptcha" data-sitekey="6LdjZ_wqAAAAAF5P3or0nPOS_jw9YXaEcnic3kQg"></div>

        <button type="submit">Gửi yêu cầu</button>
        <div class="forward-login">
          <p>Bạn chưa có tài khoản?</p>
          <a class="login-btn" href="signup.jsp">Đăng ký ngay</a>
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>
