function formatNumberWithDots(number) {
    // Loại bỏ ".0" nếu có, sau đó thêm dấu chấm phân tách
    number = parseFloat(number).toFixed(0);
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

$(document).ready(function () {
    // Duyệt qua tất cả các phần tử có class 'number-format'
    $(".number-format").each(function () {
        // Chỉ lấy nội dung văn bản của phần tử (không lấy thẻ con)
        let text = $(this).clone() // Clone phần tử để giữ nguyên cấu trúc
            .children()            // Tìm tất cả thẻ con (như <span>)
            .remove()              // Loại bỏ các thẻ con tạm thời
            .end()                 // Quay lại phần tử gốc
            .text()                // Lấy nội dung văn bản
            .trim();               // Loại bỏ khoảng trắng thừa

        // Kiểm tra nếu giá trị là số hợp lệ
        if (!isNaN(text) && text !== "") {
            // Định dạng số
            const formattedNumber = formatNumberWithDots(text);

            // Cập nhật lại nội dung văn bản, giữ nguyên thẻ con
            $(this).html(formattedNumber + $(this).children().prop('outerHTML'));
        }
    });
});