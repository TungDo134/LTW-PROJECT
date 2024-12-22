package controller;

import entity.Cart;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "CreateOrder", value = "/create-order")
public class CreateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        session.getAttribute("cart");
        Cart c = (Cart) session.getAttribute("cart");
        
        if (c == null || c.getList().isEmpty()) {
            request.setAttribute("msg", "Không có sản phẩm để thanh toán");
            request.getRequestDispatcher("show-cart").forward(request, response);
        }else{

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}