package controller.cartcontrol;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import jakarta.servlet.annotation.*;

import java.io.IOException;

// Controller for handling Add to Cart functionality
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Add", value = "/add-cart")
public class AddCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pID = (request.getParameter("pID"));
//        System.out.println(pID);

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pID);


        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) c = new Cart();
        c.add(product);
        session.setAttribute("cart", c);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}




