package controller.filter.AuthorizationFilter;

import dao.AuthorizationDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebFilter(urlPatterns = {
        // Product
        "/admin/load-pAdmin", "/admin/add-product",
        "/admin/delete-pro", "/admin/edit-sub-img",
        "/admin/show-add-product", "/admin/show-product-edit",
        "/admin/update-product", "/admin/update-sub-img",
        // Category
        "/add-newCate", "/admin/delete-cate", "/admin/get-all-cate",
        "/admin/get-all-cate", "/admin/get-cate", "/admin/update-cate"
})
public class ProductFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        Customer cus = (Customer) req.getSession().getAttribute("customer");
        AuthorizationDAO auth = new AuthorizationDAO();

        // sẽ bỏ bô filter đoạn này sao
        if (cus == null) {
            res.sendRedirect(req.getContextPath() + "/forms/login.jsp");
            return;
        }

        List<String> list_role = auth.getRoleNamesByCustomerID(cus.getId());
        boolean isAccess = list_role.stream()
                .anyMatch(role -> role.equalsIgnoreCase("product manager")
                        || role.equalsIgnoreCase("admin"));

        if (!isAccess) {
            res.sendRedirect(req.getContextPath() + "/errorPage/no-permission.jsp");
        } else {
            chain.doFilter(request, response);
        }

    }

}