// JS cho FAQ (Contact Us)
function toggleFAQ(para) {
    const $answer = $(para).find(".answer");
    const $icon = $(para).find(".icon-down");

    if ($icon.css("transform") == "matrix(1, 0, 0, 1, 0, 0)") {
        $icon.css("transform", "rotateX(180deg)");
        $answer.slideToggle("normal");
    } else {
        $icon.css("transform", "rotateX(0deg)");
        $answer.slideToggle("normal");
    }
}

// JS cho phần tăng giảm số lượng sp ng dùng chọn
$("button").click(function () {
    let upOrDown = $(this).attr("class");
    console.log(upOrDown);

    // Tăng số lượng hoặc giảm số lượng
    let quantity = $(this).parent();
    let value = parseInt(quantity.find(".p-quantity").val(), 10);
    if ("increase" === upOrDown) {
        value++;
    } else {
        value--;
        if (value < 1) return;
    }
    // Cập nhật số lượng
    quantity.find(".p-quantity").val(value);
});

// JS cho phần drop down để SORT (product)
$(".select-selected").click(function (e) {
    e.stopPropagation();
    $(this).css("border-color", "#000");
    $(this).next(".select-options").slideToggle("normal");
});

// cập nhật text mà ng dùng chọn
$(".select-option").click(function () {
    const selectedText = $(this).text();
    $(this)
        .closest(".custom-select")
        .find(".select-selected")
        .css("border-color", "#ccc");
    $(this).closest(".custom-select").find(".select-selected").text(selectedText);

    // đóng dropdown
    $(this).closest(".custom-select").find(".select-options").slideUp("1000");

});

// Close dropdown if clicking outside
$(document).click(function () {
    let target = $(".custom-select");
    target.find(".select-selected").css("border-color", "#ccc");
    target.find(".select-options").slideUp("1000");
    // $(".custom-select").removeClass("active");
});
