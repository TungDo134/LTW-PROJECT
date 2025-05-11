package controller.usercontrol.order;

import entity.Cart;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ShowPreOrder", value = "/show-pre-order")
public class ShowPreOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.getAttribute("cart");
        session.getAttribute("customer");
        Cart c = (Cart) session.getAttribute("cart");
        Customer cus = (Customer) session.getAttribute("customer");

        // Kiểm tra xem login chưa và giỏ hàng rỗng hay không
        if (c == null || c.getList().isEmpty()) {
            request.setAttribute("msgP", "Không có sản phẩm để thanh toán");
            request.getRequestDispatcher("show-cart").forward(request, response);
        } else if (cus == null) {
            request.setAttribute("msgA", "Vui lòng đăng nhập để thanh toán");
            request.getRequestDispatcher("show-cart").forward(request, response);
        } else {
            request.getRequestDispatcher("check-out.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}