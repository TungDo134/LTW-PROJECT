//// SUB MENU ////

// Ngăn sự kiện nổi bọt khi click vào các phần tử bên trong .sub-menu
$(".sub-menu").on("click", function (event) {
    event.stopPropagation();
});
// mở đóng sub menu cho các lựa chọn
$(".item-dropdown").on("click", function () {
    $(this).find(".sub-menu").toggle();
    $(this).toggleClass("rotate");
});

$(".sub-menu-item a").on("click", function () {
    // Loại bỏ CSS màu sắc trước đó khỏi tất cả các thẻ <a>
    $(".sub-menu-item a").css("color", "");

    // Áp dụng CSS màu sắc chỉ cho thẻ <a> được click
    $(this).css("color", "#0a58ca");
});

//// SUB MENU ////

//
var current_component=localStorage.getItem("submenuItem");
console.log(current_component);

$(".sub-menu > li > a").on("click", function () {
    let component = $(this).text();
    localStorage.setItem('submenuItem', component);
})




