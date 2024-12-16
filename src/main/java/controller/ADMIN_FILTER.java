package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebFilter(filterName = "ADMIN_FILTER", urlPatterns = {"/admin/*"})
public class ADMIN_FILTER implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("dang vao trang cua admin");
        chain.doFilter(request, response);
    }
}