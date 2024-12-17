package controller;

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
public class AddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pID = (request.getParameter("pID"));

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pID);
        System.out.println(product.toString());

        HttpSession session = request.getSession(true);

        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) c = new Cart();
        c.add(product);
        session.setAttribute("cart",c);
        response.sendRedirect("products?add-cart=ok");

    }
}




