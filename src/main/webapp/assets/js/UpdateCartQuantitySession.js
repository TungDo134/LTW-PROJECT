function increaseQuantity() {
    let target = Number.parseFloat(document.querySelector('.quantity-bag').textContent)
    document.querySelector('.quantity-bag').textContent = target + 1
}

function updateQuantity(num) {
    document.querySelector('.quantity-bag').textContent = num
}