<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
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


    <link rel="stylesheet" href="../assets/css/admin/styleAddProduct.css" />
  </head>
  <body class="dark-theme">
  <jsp:include page="header-admin.jsp"></jsp:include>
    <div id="main-content">
      <div class="main-container">
        <div class="items-center">
          <h3>Thêm Sản Phẩm</h3>
          <ul>
            <li>
              <a href="#">Trang chủ</a>
            </li>
            <li>
              <i class="fa-solid fa-chevron-right"></i>
            </li>
            <li>
              <a href="#">Sản phẩm</a>
            </li>
            <li>
              <i class="fa-solid fa-chevron-right"></i>
            </li>
            <li>
              <p>Thêm sản phẩm</p>
            </li>
          </ul>
        </div>
        <div class="addproduct-container">
          <div class="content-inner">
            <div class="content-wrap">
              <div class="wrapper">
                <form action="" class="form-add-product">
                  <div class="wg-box">
                    <fieldset class="name">
                      <div class="body-title">
                        Tên sản phẩm
                        <span>*</span>
                      </div>
                      <input
                        required=""
                        type="text"
                        placeholder="Vd: Bút bi xanh"
                      />
                      <p>Không vượt quá 20 ký tự khi nhập tên sản phẩm.</p>
                    </fieldset>
                    <div class="cols">
                      <fieldset class="Category">
                        <div class="body-title">
                          Loại sản phẩm
                          <span>*</span>
                        </div>
                        <div class="select">
                          <select required="" name="select">
                            <option value="" disabled selected>
                              -- Vui lòng chọn --
                            </option>
                            <option value="2">Bút</option>
                            <option value="3">Gôm thước</option>
                            <option value="4">Sổ tay, tập</option>
                            <option value="5">Bìa còng</option>
                            <option value="6">
                              Bút lông bản, bút lông dầu
                            </option>
                          </select>
                        </div>
                      </fieldset>
                      <fieldset class="Gender">
                        <div class="body-title">
                          Giá sản phẩm
                          <span>*</span>
                        </div>
                        <div class="select">
                          <input
                            required=""
                            type="text"
                            placeholder="Vd: 100.000 "
                          />
                        </div>
                      </fieldset>
                    </div>

                    <fieldset class="description">
                      <div class="body-title">
                        Mô tả
                        <span>*</span>
                      </div>
                      <textarea
                        required=""
                        name="description"
                        placeholder="Mô tả"
                      ></textarea>
                      <p>Không vượt quá 100 ký tự khi nhập tên sản phẩm.</p>
                    </fieldset>
                  </div>
                  <div class="wg-box">
                    <fieldset>
                      <div class="body-title">Tải hình ảnh lên</div>
                      <div class="upload-img">
                        <div class="item">
                          <img src="/assets/pic/pen" alt="" />
                        </div>
                        <div class="item">
                          <img src="/assets/pic/pen" alt="" />
                        </div>
                        <div class="item-upload">
                          <label class="uploadfile" for="myFile"> </label>
                          <input required="" type="file" id="myFile" />
                          <i class="fa-solid fa-cloud-arrow-up"></i>
                          <p>
                            Thả hình ảnh của bạn vào đây hoặc chọn
                            <span>bấm để duyệt</span>
                          </p>
                        </div>
                      </div>
                      <div class="body-text">
                        <p>
                          Bạn cần thêm 3 hình ảnh. Hãy chú ý đến chất lượng hình
                          ảnh bạn thêm vào, tuân thủ các tiêu chuẩn về màu nền.
                          Hình ảnh phải có kích thước nhất định. Lưu ý rằng sản
                          phẩm hiển thị tất cả các chi tiết
                        </p>
                      </div>
                    </fieldset>
                    <div class="cols">
                      <fieldset class="name">
                        <div class="body-title">
                          Thêm số lượng <span>*</span>
                        </div>

                        <div class="select">
                          <input
                            required=""
                            type="text"
                            name=""
                            id=""
                            placeholder="Vd: 100"
                          />
                        </div>
                      </fieldset>
                      <fieldset class="name">
                        <div class="body-title">
                          Miêu tả ngắn về công dụng <span>*</span>
                        </div>
                        <div class="select">
                          <input required="" type="text" name="short-des" />
                        </div>
                      </fieldset>
                    </div>
                    <div class="col">
                      <button class="btn1" type="submit">Thêm sản phẩm</button>
                      <button class="btn2" type="reset">
                        Xóa thông tin đã nhập
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </body>
</html>
