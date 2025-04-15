<%@ page import="entity.Customer" %>
<%@ page import="entity.Manufacturer" %><%--
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



      <h2>Chỉnh sửa Nhà Sản Xuất</h2>
      <form method="post" action="<%=request.getContextPath()%>/admin/update-manufacturer">
        <input type="hidden" name="manuID" value="<%=manuID%>"/>

        <label>Supplier Name:</label>
        <input type="text" name="supplierName" value="<%= supplierName%>" required />

        <label>Brand:</label>
        <input type="text" name="brand" value="<%=brand %>" required />

        <label>Brand Origin:</label>
        <input type="text" name="brandOrigin" value="<%= brandOrigin %>" required />

        <label>Manufacture Location:</label>
        <input type="text" name="manufactureLocation" value="<%= manufactureLocation %>" required />

        <label>Color:</label>
        <input type="text" name="color" value="<%= color %>" required />

        <label>Material:</label>
        <input type="text" name="material" value="<%= material %>" required />

        <label>Weight (kg):</label>
        <input type="text" step="0.01" name="weight" value="<%= weight %>" required />

        <label>Dimensions:</label>
        <input type="text" name="dimensions" value="<%= dimensions %>" required />

        <label>
          <input type="checkbox" name="bestSeller" <%= bestSeller ? "checked" : "" %> />
          Best Seller
        </label>

        <button type="submit" >Cập nhật</button>
      </form>



    </div>
  </div>
</main>


</body>

</html>
