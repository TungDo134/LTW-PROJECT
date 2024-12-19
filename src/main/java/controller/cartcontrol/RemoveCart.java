package controller.cartcontrol;

import entity.Cart;
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

        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        c.remove(proID);
        session.setAttribute("cart", c);
//        request.getRequestDispatcher("Shopping-cart.jsp").forward(request,response);
        response.sendRedirect("show-cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}