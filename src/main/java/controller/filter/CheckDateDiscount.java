package controller.filter;

import dao.DiscountDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebFilter(urlPatterns = {"/products", "/index", "/admin/load-pAdmin", ""})
public class CheckDateDiscount implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        DiscountDAO discountDAO = new DiscountDAO();

        // lấy id các sp có mã hết hạn
        List<String> pIds = discountDAO.getExpiredDiscountProductIds();

        // hủy giảm giá với các sp  có mã hết hạn
        discountDAO.UnDiscount(pIds);

        chain.doFilter(request, response);
    }
}