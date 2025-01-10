package controller;

import dao.OrderDetailDAO;
import dao.ShippingDAO;
import entity.Cart;
import entity.CartItem;
import entity.OrderDetail;
import entity.Shipping;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "CreateOrderDetail", value = "/create-ord-detail")
public class CreateOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ordID = request.getParameter("ordID");
        HttpSession session = request.getSession(false);

        Cart cart = (Cart) session.getAttribute("cart");
        OrderDetailDAO orderDetaiD = new OrderDetailDAO();

        for (CartItem cartItem : cart.getList()) {
            orderDetaiD.createOrderDetail(ordID, cartItem.getQuantity(),
                    cartItem.getTotalPrice(), cartItem.getTitle(), cartItem.getImg());
        }

        // xóa giỏ hàng
        session.removeAttribute("cart");
        response.sendRedirect("check-out-success.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}