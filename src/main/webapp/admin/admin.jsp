<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header Example</title>
    <!-- Bootstrap  -->
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

    <!-- jQuery  -->
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

    <link rel="stylesheet" href="../assets/css/styleAdmin.css" />
  </head>
  <body class="dark-theme">
    <jsp:include page="header-admin.jsp"></jsp:include>
    <div id="main-content">
      <div class="main-container">
        <!--  Start Content  -->
        <div class="tf-section-4">
          <!-- <div class="wg-chart">
            <div class="items-center">
              <div class="flex">
                <svg
                  fill="#22C55E"
                  viewBox="-192 -192 2304.00 2304.00"
                  xmlns="http://www.w3.org/2000/svg"
                  transform="matrix(1, 0, 0, 1, 0, 0)"
                >
                  <g id="SVGRepo_bgCarrier" stroke-width="0">
                    <path
                      transform="translate(-192, -192), scale(144)"
                      fill="#22C55E"
                      d="M9.166.33a2.25 2.25 0 00-2.332 0l-5.25 3.182A2.25 2.25 0 00.5 5.436v5.128a2.25 2.25 0 001.084 1.924l5.25 3.182a2.25 2.25 0 002.332 0l5.25-3.182a2.25 2.25 0 001.084-1.924V5.436a2.25 2.25 0 00-1.084-1.924L9.166.33z"
                      strokewidth="0"
                    ></path>
                  </g>
                  <g
                    id="SVGRepo_tracerCarrier"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></g>
                  <g id="SVGRepo_iconCarrier">
                    <path
                      d="M960.36.011 109 508.785v902.442L960.36 1920l851.475-508.773V508.785z"
                      fill-rule="evenodd"
                    ></path>
                  </g>
                </svg>
                <i class="fa-solid fa-bag-shopping icon-shape"></i>
                <div>
                  <div class="body-text">Tổng doanh thu</div>
                  <h4>34.945</h4>
                </div>
              </div>
              <div class="box-icon">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <div class="body-title">1,56%</div>
              </div>
            </div>
          </div> -->
          <div class="wg-chart">
            <div class="items-center">
              <div class="flex">
                <svg
                  fill="#ff5200"
                  viewBox="-192 -192 2304.00 2304.00"
                  xmlns="http://www.w3.org/2000/svg"
                  transform="matrix(1, 0, 0, 1, 0, 0)"
                >
                  <g id="SVGRepo_bgCarrier" stroke-width="0">
                    <path
                      transform="translate(-192, -192), scale(144)"
                      fill="#ff5200"
                      d="M9.166.33a2.25 2.25 0 00-2.332 0l-5.25 3.182A2.25 2.25 0 00.5 5.436v5.128a2.25 2.25 0 001.084 1.924l5.25 3.182a2.25 2.25 0 002.332 0l5.25-3.182a2.25 2.25 0 001.084-1.924V5.436a2.25 2.25 0 00-1.084-1.924L9.166.33z"
                      strokewidth="0"
                    ></path>
                  </g>
                  <g
                    id="SVGRepo_tracerCarrier"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></g>
                  <g id="SVGRepo_iconCarrier">
                    <path
                      d="M960.36.011 109 508.785v902.442L960.36 1920l851.475-508.773V508.785z"
                      fill-rule="evenodd"
                    ></path>
                  </g>
                </svg>
                <i class="fa-solid fa-dollar-sign icon-shape"></i>
                <div>
                  <div class="body-text">Tổng Doanh thu</div>
                  <h4>1.000.000đ</h4>
                </div>
              </div>
              <div class="box-icon">
                <i
                  class="fa-solid fa-arrow-trend-down"
                  style="color: var(--bs-danger)"
                ></i>
                <div class="body-title">1,56%</div>
              </div>
            </div>
          </div>
          <div class="wg-chart">
            <div class="items-center">
              <div class="flex">
                <svg
                  fill="#cbd5e1"
                  viewBox="-192 -192 2304.00 2304.00"
                  xmlns="http://www.w3.org/2000/svg"
                  transform="matrix(1, 0, 0, 1, 0, 0)"
                >
                  <g id="SVGRepo_bgCarrier" stroke-width="0">
                    <path
                      transform="translate(-192, -192), scale(144)"
                      fill="#cbd5e1"
                      d="M9.166.33a2.25 2.25 0 00-2.332 0l-5.25 3.182A2.25 2.25 0 00.5 5.436v5.128a2.25 2.25 0 001.084 1.924l5.25 3.182a2.25 2.25 0 002.332 0l5.25-3.182a2.25 2.25 0 001.084-1.924V5.436a2.25 2.25 0 00-1.084-1.924L9.166.33z"
                      strokewidth="0"
                    ></path>
                  </g>
                  <g
                    id="SVGRepo_tracerCarrier"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></g>
                  <g id="SVGRepo_iconCarrier">
                    <path
                      d="M960.36.011 109 508.785v902.442L960.36 1920l851.475-508.773V508.785z"
                      fill-rule="evenodd"
                    ></path>
                  </g>
                </svg>
                <i class="fa-regular fa-file icon-shape"></i>
                <div>
                  <div class="body-text">Đơn hàng đã thanh toán</div>
                  <h4>34.945</h4>
                </div>
              </div>
              <div class="box-icon">
                <i
                  class="fa-solid fa-arrow-trend-up"
                  style="color: var(--Body-Text)"
                ></i>
                <div class="body-title">0,00%</div>
              </div>
            </div>
          </div>
          <div class="wg-chart">
            <div class="items-center">
              <div class="flex">
                <svg
                  fill="#2377fc"
                  viewBox="-192 -192 2304.00 2304.00"
                  xmlns="http://www.w3.org/2000/svg"
                  transform="matrix(1, 0, 0, 1, 0, 0)"
                >
                  <g id="SVGRepo_bgCarrier" stroke-width="0">
                    <path
                      transform="translate(-192, -192), scale(144)"
                      fill="#2377fc"
                      d="M9.166.33a2.25 2.25 0 00-2.332 0l-5.25 3.182A2.25 2.25 0 00.5 5.436v5.128a2.25 2.25 0 001.084 1.924l5.25 3.182a2.25 2.25 0 002.332 0l5.25-3.182a2.25 2.25 0 001.084-1.924V5.436a2.25 2.25 0 00-1.084-1.924L9.166.33z"
                      strokewidth="0"
                    ></path>
                  </g>
                  <g
                    id="SVGRepo_tracerCarrier"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  ></g>
                  <g id="SVGRepo_iconCarrier">
                    <path
                      d="M960.36.011 109 508.785v902.442L960.36 1920l851.475-508.773V508.785z"
                      fill-rule="evenodd"
                    ></path>
                  </g>
                </svg>
                <i
                  class="fa-solid fa-user-group icon-shape"
                  style="padding: 14px"
                ></i>
                <div>
                  <div class="body-text">Tổng số khách truy cập</div>
                  <h4>34.945</h4>
                </div>
              </div>
              <div class="box-icon">
                <i class="fa-solid fa-arrow-trend-up"></i>
                <div class="body-title">1,56%</div>
              </div>
            </div>
          </div>
        </div>
        <!--  Start Content  -->
      </div>
    </div>

  </body>
</html>
