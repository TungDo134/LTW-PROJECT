// hiển thị sản phẩm theo danh mục
document.getElementById("categorySelect").addEventListener("change", async function () {
    let cateId = document.getElementById("categorySelect").value;
    let url = `${contextPath}/admin/load-cate-discount`;

    let response = await fetch(url, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "cateId=" + encodeURIComponent(cateId),
    });

    let result = await response.json();
    try {
        if (result.isSuccess) {
            // Gọi hàm cập nhật giao diện
            updateProductTable(result.products, cateId);
        } else {
            alert(result.error);
        }
    } catch (error) {
        alert(error)
    }
});

// cập nhật bảng
function updateProductTable(products, cateId) {
    let table = $('#myTable').DataTable();
    table.clear(); // Xóa dữ liệu cũ

    products.forEach(product => {
        table.row.add([
            `<input type="checkbox" class="product-checkbox" value="${product.productID}">`,
            product.productID,
            product.productName,
            product.productPrice.toLocaleString() + " VND",
            cateId
        ]);
    });

    table.draw(); // Cập nhật bảng
}

// Sự kiện khi click vào checkbox "Chọn tất cả"
document.getElementById('selectAll').addEventListener('click', function (e) {
    e.stopPropagation(); // Ngăn không cho sự kiện lan ra ngoài (ví dụ sorting table)
    let checked = this.checked; // Trạng thái hiện tại của checkbox
    let checkboxes = document.querySelectorAll('.product-checkbox');
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = checked; // Set tất cả cùng trạng thái
    });
});

// Sự kiện khi người dùng click vào từng checkbox sản phẩm
document.getElementById('productTable').addEventListener('change', function (e) {
    if (e.target.classList.contains('product-checkbox')) {
        if (!e.target.checked) {
            document.getElementById('selectAll').checked = false;
        }
    }
});


// Khi click vào nút "Áp dụng giảm giá"
document.getElementById("applyDiscountBtn").addEventListener('click', async function () {
    let selectedProducts = [];

    // lấy id sản phẩm cần giảm
    let checkedBoxes = document.querySelectorAll('.product-checkbox:checked');
    checkedBoxes.forEach(function (checkbox) {
        selectedProducts.push(checkbox.value);
    });

    // lấy id mã giảm
    let discount = document.getElementById('discountSelect').value
    console.log(`Mã giảm được chọn có id là: ${discount}`)

    // console.log("Sản phẩm đã chọn:", selectedProducts, typeof selectedProducts);
    // send data về servlet
    let formData = new URLSearchParams();
    selectedProducts.forEach(p => formData.append("productIds", p));
    formData.append("discountId", discount);
    let url = `${contextPath}/admin/apply-discount`;

    try {
        let response = await fetch(url, {
            method: 'POST',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: formData, discount
        });

        let result = await response.json();
        console.log(result);
    } catch (err) {
        console.error("Lỗi khi gửi dữ liệu:", err);
    }

});



