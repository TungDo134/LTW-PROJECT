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
            // formatted trước khi cập nhật
            $(".subtotalQuantity").text(data.TotalQuantity);
            $(".total.number-format").text(formatCurrency(data.Total) + " VND");
            $(`#total-price-${pID}`).text(formatCurrency(data.TotalCt) + " VND");

            function formatCurrency(value) {
                return new Intl.NumberFormat('en-US').format(value);
            }

        }
    })
}