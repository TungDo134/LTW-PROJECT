function updateProductTable(products,cateId) {
    console.log(products)
    let tableBody = document.getElementById("productTable"); // Lấy tbody của bảng
    tableBody.innerHTML = ""; // Xóa dữ liệu cũ

    products.forEach(product => {
        let row = `
            <tr>
                <td><input type="checkbox" class="productCheckbox" value="${product.productID}"></td>
                <td>${product.productName}</td>
                <td>${product.productPrice.toLocaleString()} VND</td>
                <td>${cateId}</td>
            </tr>
        `;
        tableBody.innerHTML += row;
    });
}