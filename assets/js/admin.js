// load dữ liệu (không tải lại trang)
$(document).ready(function () {
  // Bắt sự kiện click trên các mục menu
  $(".sub-menu-item").on("click", function (e) {
    e.preventDefault(); // Ngăn chặn hành vi mặc định của thẻ <a>

    var targetFile = $(this).data("target"); // Lấy giá trị file từ thuộc tính data-target

    // Sử dụng AJAX để tải nội dung từ file HTML tương ứng
    $(".main-container").load(targetFile);
  });
});

$("#open-sub-menu").on("click", function () {
  $("#header-dashboard").removeClass("open");
  $(this).hide();
  $("#main-content").css("padding-left", "300px");
});

$("#close-sub-menu").on("click", function () {
  $("#header-dashboard").addClass("open");
  $("#open-sub-menu").show();
  $("#main-content").css("padding-left", "20px");
});

// mở đóng sub menu cho các lựa chọn
$(".item-dropdown").on("click", function () {
  $(this).find(".sub-menu").toggle();
  $(this).toggleClass("rotate");
});

// Chuyển theme
$(".toggle-theme").on("click", function () {
  // đổi icon sáng tối
  const spanElement = $(this).find(".material-symbols-outlined");

  // Kiểm tra nội dung hiện tại và thay đổi thành 'bedtime'
  if (spanElement.text().trim() === "sunny") {
    spanElement.text("bedtime");
    spanElement.css("color", "#000");
  } else {
    // Nếu nội dung hiện tại là 'bedtime', chuyển lại thành 'sunny'
    spanElement.text("sunny");
    spanElement.css("color", "#cccccc");
  }

  // Kiểm tra xem đanmg dùng theme nào
  if ($("body").hasClass("dark-theme")) {
    // Nếu đang ở dark theme, chuyển sang white theme
    $("body").removeClass("dark-theme").addClass("white-theme");
  } else {
    // Nếu đang ở white theme, chuyển sang dark theme
    $("body").removeClass("white-theme").addClass("dark-theme");
  }
});
