package controller.cartcontrol;

import entity.Cart;
import entity.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "updateCart", value = "/update-cart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txt_id = request.getParameter("pID");

        int id = Integer.parseInt(txt_id);
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession(false);
        Cart c = (Cart) session.getAttribute("cart");

        c.update(id, quantity);
        session.setAttribute("cart", c);

        // chi tiết giỏ
        CartItem ct = c.getData().get(id);
        System.out.println(ct);

        // Trả về thông tin cần thiết cho giao diện
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // tổng sp, tổng giá, tổng tiền của 1 sp
        response.getWriter().write("{\"TotalQuantity\":" + c.getTotalQuantity() + ", \"Total\":" + c.getTotal() + ", \"TotalCt\":" + ct.getTotalCt() + "}");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}