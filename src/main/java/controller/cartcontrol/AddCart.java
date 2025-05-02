package controller.cartcontrol;

import dao.ProductDAO;
import entity.Cart;
import entity.Product;
import helper.CartManagerDB;
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

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pID);

        // xem có giảm giá không
        if (product.getIsDiscount() == 1) {
            product.setProductPrice(product.getDiscountPrice());
        }

        HttpSession session = request.getSession();
        // lưu cart vào session
        Cart c = (Cart) session.getAttribute("cart");

        if (c == null) c = new Cart();
        c.add(product);
        session.setAttribute("cart", c);

        // ========= SAVE CART DB ========= //
        CartManagerDB cartManagerDB = new CartManagerDB();
        cartManagerDB.saveCartDB(request);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}




