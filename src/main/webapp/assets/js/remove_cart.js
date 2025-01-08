function removeCart(remove_btn) {
    let pID = $(remove_btn).data('id'); // Lấy ID sản phẩm
    console.log("Sản phẩm cần xóa có ID là: " + pID);
    $.ajax({
        url: "remove-cart",
        data: {
            pID: pID,
        },
        success: function (response) {
            console.log(response)
            if (response.isSuccess) {
                $(`div[data-id="${pID}"]`).remove();
                // formatted trước khi cập nhật
                $(".subtotalQuantity").text(response.TotalQuantity);
                $(".total.number-format").text(formatCurrency(response.Total));

                function formatCurrency(value) {
                    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(value);
                }
            } else {
                alert("Xóa sản phẩm không thành công.");
            }
        },
        error: function () {
            alert("Lỗi xảy ra trong quá trình xóa sản phẩm.");
        }
    });
}
