<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Filter by Price</title>

    <!-- Link Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
  </head>
  <body>
    <div class="filter-container">
      <div class="filter-title">Filter by</div>
      <div class="filter-category">Giá +</div>
      <ul class="filter-options">
        <li>
          <div class="checkbox-circle">
            <i class="fa-solid fa-check fa-xl"></i>
          </div>
          <span class="filter-option-text">Nhỏ hơn 50,000đ</span>
        </li>
        <li>
          <div class="checkbox-circle">
            <i class="fa-solid fa-check fa-xl"></i>
          </div>
          <span class="filter-option-text">50,000đ - 100,000đ</span>
        </li>
        <li>
          <div class="checkbox-circle">
            <i class="fa-solid fa-check fa-xl"></i>
          </div>
          <span class="filter-option-text">100,000đ - 200,000đ</span>
        </li>
        <li>
          <div class="checkbox-circle">
            <i class="fa-solid fa-check fa-xl"></i>
          </div>
          <span class="filter-option-text">200,000đ - 500,000đ</span>
        </li>
        <li>
          <div class="checkbox-circle">
            <i class="fa-solid fa-check fa-xl"></i>
          </div>
          <span class="filter-option-text">Lớn hơn 500,000đ</span>
        </li>
      </ul>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script></script>
  </body>
</html>
