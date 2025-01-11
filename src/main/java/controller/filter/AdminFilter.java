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
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession();
//
//        // Check if session is valid and has customer attribute
//        if (session == null || session.getAttribute("customer") == null) {
//            System.out.println("Session is invalid or missing customer attribute. Redirecting to login");
//            httpResponse.sendRedirect("forms/signup-login.jsp");
//            return;
//        }
//
//        Customer admin = (Customer) session.getAttribute("customer");
//
//        // Redirect only if user is not admin
//        if (admin.getRole() != 1) {
//            System.out.println("User is not admin. Redirecting to login");
//            httpResponse.sendRedirect("forms/signup-login.jsp");
//            return;
//        }

        System.out.println("You in admin page");
        chain.doFilter(request, response);
    }
}