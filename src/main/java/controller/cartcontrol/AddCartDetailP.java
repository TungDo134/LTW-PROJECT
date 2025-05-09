package controller.cartcontrol;

import dao.ProductDAO;
import entity.Cart;
import entity.Customer;
import entity.Product;
import helper.CartManagerDB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddCartDetailP", value = "/add-card-dp")
public class AddCartDetailP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pID = request.getParameter("pID");
        String quantityTxt = request.getParameter("quantity");
//        System.out.println(pID + " " + quantityTxt);

        int quantity = Integer.parseInt(quantityTxt);

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductByID(pID);
        // xem có giảm giá không
        if (product.getIsDiscount() == 1) {
            product.setProductPrice(product.getDiscountPrice());
        }

        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) c = new Cart();
        c.addWithQuantity(product, quantity);
        session.setAttribute("cart", c);

        // ========= SAVE CART DB ========= //
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
            CartManagerDB cartManagerDB = new CartManagerDB();
            cartManagerDB.saveCartDB(request, customer);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}