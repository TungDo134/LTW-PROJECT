<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đổi mới mât khẩu</title>
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


  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/styleFormSignup-login.css">
</head>
<body>
<div class="login-signup-container">
  <main class="login-signup ">
    <input type="checkbox" id="chk" aria-hidden="true"/>
    <%-- Reset password--%>
    <div class="signup">
      <%
        String msgRegister = (String) request.getAttribute("msg");

      %>
        <span style="text-align: center; display: block; color: #198754">
            ${success}</span>
      <form action="<%= request.getContextPath()%>/resetPass" method="post">

        <div class="form-group">
          <label for="chk" class="label-Signup" aria-hidden="true" style="margin-bottom: 20px; font-size: 30px"
          >Reset Password</label
          >
        </div>
<%--        <div class="form-group">--%>

<%--          <span class="form-message"></span>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--                <form action="resetPass" method="get">--%>
<%--                  <label for="email" class="form-label"></label>--%>
<%--                  <input id="email" name="email" type="email" class="form-control" value="${email}" required=""/>--%>
<%--                  <span class="form-message"></span>--%>
<%--                </form>--%>
<%--        </div>--%>
        <div class="form-group">
          <label for="password" class="form-label"> </label>
          <a class="show-hide-pass">
            <input
                    id="password"
                    name="password"
                    type="password"
                    placeholder="Mật khẩu"
                    class="form-control"
                    required=""
                    onblur="checkPass(this)"
                    onfocus="clearError()"
            />
            <i class="fa-solid fa-eye" onclick="showHidePass(this)"></i>
          </a>
          <span class="form-message"></span>
        </div>
        <div class="form-group">
          <label for="rePassword" class="form-label"> </label>
          <input
                  id="rePassword"
                  name="rePassword"
                  type="password"
                  placeholder="Nhập lại mật khẩu"
                  class="form-control"
                  required=""
                  onblur="checkRePassword(this)"
                  onfocus="clearError()"
          />

          <span class="form-message"></span>
        </div>

<%--        <!-- Google reCAPTCHA -->--%>
<%--        <div class="g-recaptcha" data-sitekey="6LdjZ_wqAAAAAF5P3or0nPOS_jw9YXaEcnic3kQg"></div>--%>
        <div class="btn-blue">
          <button type="submit">Cập nhật</button>
        </div>
        <div class="forward-login">
          <p>Bạn đã có tài khoản?</p>
          <a class="login-btn" href="login.jsp">Đăng nhập</a>
        </div>
      </form>
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

  // ktra format password
  function checkPass(input) {
    let target = input.parentElement.parentElement.querySelector(".form-message")
    if (input.value.length < 6) {
      target.textContent = 'Mật khẩu tối thiểu 6 kí tự'
    }
  }

  // ktra mật khẩu nhập lại
  function checkRePassword(input) {
    const password = document.getElementById("password").value
    let re_pass = input.value
    let error = input.parentElement.querySelector(".form-message")
    if (re_pass !== password && re_pass !== '') {
      error.textContent = 'Mật khẩu nhập lại không chính xác'
    } else {
      error.textContent = '';
    }
  }

  function clearError() {
    let messages = document.querySelectorAll(".form-message");
    messages.forEach(message => {
      message.textContent = ''; // Xóa nội dung từng phần tử
    });
  }
</script>
</body>
</html>
