<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Ký</title>

    <link rel="stylesheet" href="../assets/css/styleFormSignup-login.css" />
  </head>
  <body>
    <div class="login-signup-container">
      <main class="login-signup">
        <div class="signup">
          <form>
            <div class="form-group">
              <label for="chk" class="label-Signup" aria-hidden="true"
                >Đổi mật khẩu</label
              >
            </div>

            <div class="form-group">
              <label for="password" class="form-label"> </label>
              <input
                id="password"
                name="password"
                type="password"
                placeholder="Mật khẩu cũ"
                class="form-control"
                required=""
              />
              <span class="form-message"></span>
            </div>
            <div class="form-group">
              <label for="newPassword" class="form-label"> </label>
              <input
                id="newPassword"
                name="newPassword"
                type="password"
                placeholder="Mật khẩu mới"
                class="form-control"
                required=""
              />
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
              />
              <span class="form-message"></span>
            </div>
            <button>Đổi mật khẩu</button>
          </form>
        </div>
      </main>
    </div>
  </body>
</html>
