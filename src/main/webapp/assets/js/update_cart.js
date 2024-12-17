function updateCart(input) {
    const pID = $(input).data('id'); // ID của sản phẩm
    const quantity = $(input).val().trim(); // Số lượng
    // console.log(pID + "-" + quantity)

    $.ajax({
        url: "update-cart",
        method: "POST",
        data: {
            pID: pID,
            quantity: quantity,
        },
        success: function (data) {
            // Cập nhật giao diện
            // formatted trước khi cập nhật
            const fmTotalQuantity = formatNumberWithDots(data.TotalQuantity);
            const fmTotal = formatNumberWithDots(data.Total);
            const fmTotalCt = formatNumberWithDots(data.TotalCt);

            $(".subtotalQuantity").text(fmTotalQuantity);
            $(".total.number-format").text(fmTotal + "đ");
            $(`#total-price-${pID}`).text(fmTotalCt + "đ");
            // console.log($(".total-price.number-format").text(data.TotalCt))
        }
    })
}