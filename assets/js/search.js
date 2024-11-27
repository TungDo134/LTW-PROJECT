//// JS cho phần search ////
// Tìm kiếm //
$(".mini-search").on("keyup", function () {
  var value = $(this).val().toLowerCase();
  $(".list-cate li").filter(function () {
    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
  });
});
