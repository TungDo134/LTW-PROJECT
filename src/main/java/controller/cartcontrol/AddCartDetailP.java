package controller.cartcontrol;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddCartDetailP", value = "/add-card-dp")
public class AddCartDetailP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pID = Integer.parseInt(request.getParameter("pID"));
        String quantityTxt = request.getParameter("quantity");
//        System.out.println(pID + " " + quantityTxt);

        int quantity = Integer.parseInt(quantityTxt);

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pID);

        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) c = new Cart();
        c.addWithQuantity(product, quantity);
        session.setAttribute("cart", c);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}