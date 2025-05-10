// ADD CART
function getIdProduct(form) {
    const pID = form.querySelector('[name="pID"]').value;
    console.log(pID)
    $.ajax({
        url: 'add-cart', // Servlet URL
        type: 'GET',
        data: {
            pID: pID
        },
        success: function (response) {
            const button = document.querySelector('.icon-p');
            if (button) {
                button.click(); // Kích hoạt sự kiện click
                increaseQuantity();
            }
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText)
            alert('Error: ' + xhr.responseText);
        }
    });
}

// UPDATE CART
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
            // Cập nhật số lượng hiển thị cho sản phẩm đó
            $(`#total-price-${pID}`).text(formatCurrency(data.TotalCt));

            // Cập nhật lại giá trị mới vào checkbox
            const checkbox = $(`.cart-item[data-id='${pID}'] .check-item`);
            checkbox.attr("data-quantity", data.Quantity);
            checkbox.attr("data-price", data.TotalCt);

            // Gọi lại hàm tính tổng theo sản phẩm được chọn
            updateSummary();

            function formatCurrency(value) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
            }

            updateQuantity(data.TotalQuantity)
        }
    })
}

// REMOVE CART
function removeCart(remove_btn) {
    let pID = $(remove_btn).data('id'); // Lấy ID sản phẩm
    console.log("Sản phẩm cần xóa có ID là: " + pID);

    if (confirm("Bạn có chắc chắn muốn xóa không?")) {
        $.ajax({
            url: "remove-cart",
            data: {
                pID: pID,
            },
            success: function (response) {
                console.log(response)
                if (response.isSuccess) {
                    // Xóa khỏi DOM
                    $(`div[data-id="${pID}"]`).remove();

                    // Gọi lại hàm tính tổng dựa trên các checkbox đang được chọn
                    updateSummary();

                    let value = response.TotalQuantity; // toàn bộ giỏ hàng
                    updateQuantity(value); // cập nhật icon giỏ chẳng hạn
                } else {
                    alert("Xóa sản phẩm không thành công.");
                }
            },
            error: function () {
                alert("Lỗi xảy ra trong quá trình xóa sản phẩm.");
            }
        });
    }
}

// UPDATE CART QUANTITY SESSION
function increaseQuantity() {
    let target = Number.parseFloat(document.querySelector('.quantity-bag').textContent)
    document.querySelector('.quantity-bag').textContent = target + 1
}

// UPDATE SLG GIỎ HÀNG
function updateQuantity(num) {
    // document.querySelector('.subtotalQuantity').textContent = num
    document.querySelector('.quantity-bag').textContent = num
}

// UPDATE SLG GIỎ HÀNG (detail)
function updateDetailQuantity(num) {
    let target = Number.parseFloat(document.querySelector('.quantity-bag').textContent)
    document.querySelector('.quantity-bag').textContent = parseInt(num) + target
}