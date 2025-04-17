package controller.filter;

import dao.CartDAO;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "SaveCart", urlPatterns = {"/logout","/update-cart-db"})
public class SaveCartDB implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession session = req.getSession(false);

        // lấy ss cần cho update cart
        Customer customer = (Customer) session.getAttribute("customer");
        Cart c = (Cart) session.getAttribute("cart");

        /*
         * Check user cart
         * IF user đã có cart check out || chưa có cart nào ==> tạo cart mới
         * ELSE ==> update cart (add cart item)
         */

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
        chain.doFilter(request, response);
    }
}