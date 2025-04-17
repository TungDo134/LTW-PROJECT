package controller;

import dao.CartDAO;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "LogoutControl", value = "/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // lấy ss cần cho update cart
        Customer customer = (Customer) session.getAttribute("customer");
        Cart c = (Cart) session.getAttribute("cart");

        /*
         * Check user cart
         * IF user đã có cart check out || chưa có cart nào ==> tạo cart mới
         * ELSE ==> update cart (add cart item)
         */

        CartDAO cartDAO = new CartDAO();
        boolean isCartCheckedOutOrExits = cartDAO.getCartCheckedOutOrExitsByCusId(customer.getId()) != null;

        if (!isCartCheckedOutOrExits) {
            // tạo cart mới ==> lấy cartId trả về ==> thêm cart item

            int cartID = cartDAO.createCart(customer.getId(), (byte) 0);
            for (CartItem cartItem : c.getList()) {
                System.out.println(cartItem);
                cartDAO.insertCartItemByCartID(cartID, cartItem);
            }
        }

        // update cart (add cart item)
        else {
            int cartID = cartDAO.getCartIDByCusID(customer.getId());
            // remove first element vì đã add lúc mới tạo cart
            c.getList().remove(c.getList().getFirst());
            for (CartItem cartItem : c.getList()) {
                System.out.println(cartItem);
                cartDAO.insertCartItemByCartID(cartID, cartItem);
            }
        }


        session.invalidate();
        response.sendRedirect("home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}