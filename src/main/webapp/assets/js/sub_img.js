// Lấy src từ các ảnh trong Swiper
let imgSrc1 = $(".swiper-slide img").eq(0).attr("src");
let imgSrc2 = $(".swiper-slide img").eq(1).attr("src");
let imgSrc3 = $(".swiper-slide img").eq(2).attr("src");
const images = [
    imgSrc1 ,
    imgSrc2,
    imgSrc3
];
new Swiper(".mySwiper", {
    spaceBetween: 30,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        renderBullet: function (index, className) {
            // Sử dụng index do Swiper truyền vào
            return `<span class="${className}">
                  <img src="${images[index]}" alt="Thumbnail ${index + 1}" style="width: 68px;" />
                </span>`;
        },
    },
});