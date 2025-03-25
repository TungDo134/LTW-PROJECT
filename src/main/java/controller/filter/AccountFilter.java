package controller.filter;

import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AccountFilter",urlPatterns = {"/load-profile", "/change-password"})
public class AccountFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();

        Customer cus = (Customer) session.getAttribute("customer");

        // neu chua login thi chuyen ve trang login
        if (cus == null) {
            httpResponse.sendRedirect("forms/login.jsp");
            return;
        }

        chain.doFilter(request, response);
    }
}