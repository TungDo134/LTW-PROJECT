package controller.filter;

import entity.Cart;
import entity.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebFilter("/*")
public class CartFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        int cartSize = 0;

        if (session != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                cartSize = cart.getTotalQuantity();
            }
        }

        // Gán vào request để jsp có thể dùng được
        request.setAttribute("cartSize", cartSize);


        chain.doFilter(request, response);
    }
}