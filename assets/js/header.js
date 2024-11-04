$(document).ready(function () {
  $(document).on("click", ".btn-search", function () {
    $("#search").slideToggle("slow");
    $(".show").slideUp("slow");
  });

  $(document).on("click", ".col_icon-user", function () {
    $(".show").slideToggle("slow");
    $("#search").slideUp("slow");
  });

  $("#header .header_menu ul li a").click(function () {
    $("#header .header_menu ul li a").removeClass("active"); // Xóa class 'active' khỏi các thẻ <a> khác
    $(this).addClass("active"); // Thêm class 'active' cho thẻ <a> vừa nhấp
  });

  // Xử lý cuộn trang
  var lastScrollTop = 0;
  var header = $("#header");

  $(window).scroll(function () {
    var scrollTop = $(this).scrollTop();

    if (scrollTop > lastScrollTop) {
      // Cuộn xuống
      header.addClass("fixed");
    }

    lastScrollTop = scrollTop;
  });
});
