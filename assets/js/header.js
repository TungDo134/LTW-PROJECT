$(document).ready(function () {
  $(".btn-search").on("click", function () {
    $("#search").slideToggle("normal");
    $(".show").slideUp("normal");
  });

  $(document).on("click", ".col_icon-user", function () {
    $(".show").slideToggle("normal");
    $("#search").slideUp("normal");
  });

  $("#header .header_menu ul li a").click(function () {
    $("#header .header_menu ul li a").removeClass("active"); // Xóa class 'active' khỏi các thẻ <a> khác
    $(this).addClass("active"); // Thêm class 'active' cho thẻ <a> vừa nhấp
  });

  // Xử lý cuộn trang (slide)
  var lastScrollTop = 0;
  var $header = $("#header");

  $(window).scroll(function () {
    var scrollTop = $(this).scrollTop();

    if (scrollTop === 0) {
      $header.show();
    } else if (scrollTop > lastScrollTop) {
      // $header.addClass("fixed");
      $header.slideUp("3000");
    } else {
      // $header.removeClass("fixed");
      $header.slideDown("1000");
    }

    lastScrollTop = scrollTop;
  });

  // Xử lý hiệu ứng khi click vào menu dropdown
  $(".nav-link.dropdown-toggle").on("click", function () {
    $(this).children("i").toggleClass("rotate");
  });
});
