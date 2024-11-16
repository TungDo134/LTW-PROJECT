$("#open-sub-menu").on("click", function () {
  $("#header-dashboard").addClass("open");
  $(this).hide();
  $("#main-content").css("padding-left", "300px");
});

$("#close-sub-menu").on("click", function () {
  $("#header-dashboard").removeClass("open");
  $("#open-sub-menu").show();
  $("#main-content").css("padding-left", "20px");
});
