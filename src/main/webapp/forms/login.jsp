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
        <%--  Đăng nhập--%>
        <div class="login">
            <%
                String msgLogin = (String) request.getAttribute("error");
            %>
            <form id="login-form" method="post" action="<%=request.getContextPath()%>/login">
                <label class="label-Login" aria-hidden="true" style="margin-bottom: 20px"
                >Đăng nhập</label
                >

                <span style="text-align: center; display: block; color: darkred">
                        <%=msgLogin != null ? msgLogin : ""%></span>
                <span style="text-align: center; display: block; color: #198754">
                    ${success}</span>

                <label for="email-login" class="form-label"> </label>
                <input id="email-login" type="email" name="email-login" placeholder="Email" required=""/>

                <label for="password-login" class="form-label"> </label>
                <a class="show-hide-pass">
                    <input
                            id="password-login"
                            type="password"
                            name="password-login"
                            placeholder="Password"
                            required=""
                    />
                    <i class="fa-solid fa-eye" onclick="showHidePass(this)"></i>
                </a>

                <a class="signup-image-link" href="forgotPassword.jsp"
                >Quên mật khẩu?</a
                >

                <!-- Google reCAPTCHA -->
                <div class="g-recaptcha" data-sitekey="6LdjZ_wqAAAAAF5P3or0nPOS_jw9YXaEcnic3kQg"></div>

                <button type="submit">Login</button>
            </form>
            <hr class="my-4" style="margin-top: 13px">

            <a style="text-decoration: none"
               href="http://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/Gradle___org_example___Project_LTW_1_0_SNAPSHOT_war/login&response_type=code&client_id=809996787821-dr6g65vj9cbhn9ppk1ca7olan47ld6au.apps.googleusercontent.com&approval_prompt=force">
                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-lg btn-block btn-primary"
                        style="background-color: #dd4b39; border: none"
                        type="submit"><i class="fab fa-google me-2"></i> Sign in with google
                </button>
            </a>
            <div class="forward-login">
                <p>Bạn chưa có tài khoản?</p>
                <a class="login-btn" href="signup.jsp">Đăng ký ngay</a>
            </div>
        </div>
    </main>
</div>
<script>
    // ẩn hiển mật khẩu
    function showHidePass(icon) {
        const input = icon.parentElement.querySelector("input");
        if (input.type === "password") {
            input.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            input.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    }
</script>
</body>
</html>
