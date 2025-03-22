package controller.filter;

import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession();
        Customer admin = (Customer) session.getAttribute("customer");

        // ktra session
        String path = ((HttpServletRequest) request).getContextPath();
        if (admin == null || admin.getRole() != 1) {
            System.out.println("Khong phai admin hoac chua dang nhap");
            httpResponse.sendRedirect(path + "/forms/signup-login.jsp");
            return;
        }
//        System.out.println("You in admin page");
        chain.doFilter(request, response);
    }
}