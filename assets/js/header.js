$(".btn-search").click(function () {
  $("#search").slideToggle("slow");
  $(".show").slideUp("slow");
});

$(".col_icon-user").click(function () {
  $(".show").slideToggle("slow");
  $("#search").slideUp("slow");
});
