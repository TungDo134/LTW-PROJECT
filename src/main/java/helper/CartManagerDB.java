package helper;

import dao.CartDAO;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class CartManagerDB {
    public void saveCartDB(HttpServletRequest request, Customer customer) {
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");

        // ========= SAVE CART DB ========= //
        CartDAO cartDAO = new CartDAO();
        boolean isCartCheckedOutOrExist = cartDAO.getCartCheckedOutOrExistByCusId(customer.getId()) != null;

        if (!isCartCheckedOutOrExist) {
            // tạo cart mới ==> lấy cartId trả về ==> thêm cart item

            int cartID = cartDAO.createCart(customer.getId(), (byte) 0);
            for (CartItem cartItem : c.getList()) {
                cartDAO.insertCartItemByCartID(cartID, cartItem);
            }
        }
        // update cart (add cart item)
        else {
            boolean isCartItemWithPidExist = false;
            int cartID = cartDAO.getCartIDByCusID(customer.getId());

            for (CartItem cartItem : c.getList()) {
                isCartItemWithPidExist = cartDAO.getCartItemByProductID(cartItem.getProductID());

                if (isCartItemWithPidExist) {
                    System.out.println(cartItem);
                    // update slg neu cart item đã tồn tại
                    cartDAO.updateProductInCartItem(cartItem.getProductID(), cartItem.getQuantity(), cartItem.getTotalCt());
                    isCartItemWithPidExist = false;
                } else {
                    cartDAO.insertCartItemByCartID(cartID, cartItem);
                }
            }
        }
    }

    public void deleteCartItemDB(HttpServletRequest request, int productID) {
        CartDAO cartDAO = new CartDAO();
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int cartID = cartDAO.getCartIDByCusID(customer.getId());
        cartDAO.deleteCartByCartItemIDAndPID(cartID, productID);
    }

    public void deleteCartDB(int customerID) {
        CartDAO cartDAO = new CartDAO();
        cartDAO.deleteCart(customerID);
    }
}
