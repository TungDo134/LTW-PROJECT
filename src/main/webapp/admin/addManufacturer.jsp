<%@ page import="entity.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/14/2024
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thêm nhà sản xuất</title>
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

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- Font Awesome (cho các icon) -->
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer"
  />
  <!-- Google Icon -->
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
  />
  <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/admin/styleAddManufacturer.css">
</head>
<body class="dark-theme">
<jsp:include page="header-admin.jsp"></jsp:include>
<%
  int manuID = (request.getAttribute("manuID") != null) ? (Integer) request.getAttribute("manuID") : 0;
  String supplierName = (String) request.getAttribute("supplierName");
  String brand = (String) request.getAttribute("brand");
  String brandOrigin = (String) request.getAttribute("brandOrigin");
  String manufactureLocation = (String) request.getAttribute("manufactureLocation");
  String color = (String) request.getAttribute("color");
  String material = (String) request.getAttribute("material");
  double weight = (request.getAttribute("weight") != null) ? (Double) request.getAttribute("weight") : 0.0;
  String dimensions = (String) request.getAttribute("dimensions");
  boolean bestSeller = (request.getAttribute("bestSeller") != null) ? (Boolean) request.getAttribute("bestSeller") : false;
%>



<main id="main-content">
  <div class="main-container">
    <div class="container">
      <h1>Thêm nhà sản xuất</h1>
      <span class="text-info" id="message"></span>

      <%-- AddManu --%>
      <form id="manufacturerForm">

        <label for="manuName">Tên nhà sản xuất</label>
        <input type="text" id="manuName" name="manuName"
               value="<%= supplierName == null ? "" : supplierName %>"
               placeholder="Nhập tên nhà sản xuất" required>


        <label for="brandOrigin">Xuất xứ thương hiệu</label>
        <input type="text" id="brandOrigin" name="brandOrigin"
               value="<%= brandOrigin == null ? "" : brandOrigin %>"
               placeholder="Nhập xuất xứ thương hiệu">

        <label for="manufactureLocation">Nơi sản xuất</label>
        <input type="text" id="manufactureLocation" name="manufactureLocation"
               value="<%= manufactureLocation == null ? "" : manufactureLocation %>"
               placeholder="Nhập nơi sản xuất">

        <button type="submit">Thêm nhà sản xuất</button>
        <a href="<%=request.getContextPath()%>/admin/all-manufacturer" id="btnAddManufacturer" class="text-decoration-none text-white p-2 text-center bg-success mt-2 rounded" hidden>
          Quay lại
        </a>

      </form>




    </div>
  </div>
</main>

<script>
  // Add user (ajax)
  document.querySelector('#manufacturerForm').addEventListener('submit', async function (e) {
    e.preventDefault()

    // lấy data từ form
    let formData = new URLSearchParams(new FormData(this))
    let url = '<%= request.getContextPath() %>/admin/AddManufacturer';


    try {
      let response = await fetch(url, {
        method: 'Post',
        headers: {
          'Content-type': 'application/x-www-form-urlencoded'
        },
        body: formData
      })

      // xử lí logic
      let rs = await response.json();
      if (rs.isSuccess) {
        notify(rs.isSuccess, this)
      } else {
        notify(rs.isSuccess, rs.msg, this)
      }
    } catch (error) {
      console.log(error)
    }

  })

  // hàm thông báo trạng thái cập nhật
  // true trong addEventListener kích hoạt sự kiện trong capture phase, giúp focus trên input lan đến form.
  function notify(valid, msg, form) {
    if (valid) {
      document.getElementById("message").textContent = 'Thêm thành công'
      toggleHidden()
      form.addEventListener('focus', function () {
        document.getElementById("message").textContent = "";
      }, true)
    } else {
      document.getElementById("message").classList.replace("text-info", "text-danger");
      document.getElementById("message").textContent = msg
      form.addEventListener('focus', function () {
        document.getElementById("message").classList.replace("text-danger", "text-info");
        document.getElementById("message").textContent = "";
      }, true)
    }
  }

  // ẩn hiển thẻ quay lại
  function toggleHidden() {
    let link = document.getElementById("btnAddManufacturer");
    link.hidden = !link.hidden; // Đảo ngược trạng thái hidden
  }

</script>
</body>

</html>
