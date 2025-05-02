package controller.cartcontrol;

import entity.Cart;
import entity.CartItem;
import helper.CartManagerDB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "RemoveController", value = "/remove-cart")
public class RemoveCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pID = (request.getParameter("pID"));
        int proID = Integer.parseInt(pID);
        boolean isSuccess;

        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        c.remove(proID);
        session.setAttribute("cart", c);
        c.getTotalQuantity();
        c.getTotal();
        isSuccess = true;

        // ========= DELETE CART ITEM DB ========= //
        CartManagerDB cartManagerDB = new CartManagerDB();
        cartManagerDB.deleteCartDB(request, proID);

        response.setContentType("application/json");
        response.getWriter().write("{\"isSuccess\":" + isSuccess + ", \"TotalQuantity\":"
                + c.getTotalQuantity() + ", \"Total\":" + c.getTotal() + "}");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}