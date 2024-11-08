// JS cho FAQ
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

// JS cho phần giỏ hàng
$("button").click(function () {
  let upOrDown = $(this).attr("class");
  console.log(upOrDown);

  // Tìm phần tử chứa giá
  let totalPrice = $(this).parent().parent().find(".total-price");

  // Kiểm tra nếu phần tử này chưa lưu giá trị gốc, thì gán giá trị ban đầu vào `data`
  if (!totalPrice.data("originalPrice")) {
    const priceUnFormat = totalPrice.text();
    const priceFormat = parseFloat(priceUnFormat.replace(/\./g, ""));
    totalPrice.data("originalPrice", priceFormat); // Lưu giá trị ban đầu vào `data`
  }

  // Lấy giá trị ban đầu từ `data` (giữ cố định)
  const originalPrice = totalPrice.data("originalPrice");

  // Tăng số lượng hoặc giảm số lượng
  let quantity = $(this).parent();
  let value = parseInt(quantity.find(".p-quantity").val(), 10);
  if ("increase" === upOrDown) {
    value++;
  } else {
    value--;
    if (value < 0) return;
  }

  // Cập nhật số lượng
  quantity.find(".p-quantity").val(value);

  // Cập nhật tổng tiền
  let total = originalPrice * value;
  let formattedTotal = total.toLocaleString("vi-VN");

  // Hiển thị tổng tiền với định dạng và thêm đơn vị
  totalPrice.html(formattedTotal + "<span class='currency'>đ</span>");

  // Hiển thị tổng tiền của tất cả món hàng
  totalSum();
});

// JS để hiển thị bên mục xác nhận đặt hàng
function totalSum() {
  let totalSum = 0;

  $(".total-price").each(function () {
    // Lấy giá trị văn bản của thẻ có class "total-price"
    let priceText = $(this).text();

    // Loại bỏ dấu chấm (nếu có) và chuyển thành số
    let price = parseFloat(priceText.replace(/\./g, ""));

    // Cộng dồn vào tổng
    totalSum += price;
  });

  // Định dạng tổng giá trị với phân cách hàng nghìn và hiển thị
  let formattedTotal = totalSum.toLocaleString("vi-VN");
  $(".subtotal").html(formattedTotal + "<span class='currency'>đ</span>");
  $(".total").html(formattedTotal + "<span class='currency'>đ</span>");
}

//
