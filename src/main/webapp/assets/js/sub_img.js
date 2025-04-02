const images = [];

// Duyệt qua tất cả các phần tử có class 'swiper-slide img'
$('.swiper-slide img').each(function () {
    // Lấy src của từng thẻ img và thêm vào mảng images
    var imgSrc = $(this).attr('src');
    images.push(imgSrc);
});

new Swiper(".mySwiper", {
    spaceBetween: 30,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        renderBullet: function (index, className) {
            // Sử dụng index do Swiper truyền vào
            return `<span class="${className}">
                  <img src="${images[index]}"  onerror="hideParent(this)" style="width: 68px;" />
                </span>`;
        },
    },
});



function hideParent(img) {
    // Khi xảy ra lỗi, tìm phần tử cha chứa thẻ img và ẩn đi
    let errorEle = $(img).parent();
    errorEle.hide();
}