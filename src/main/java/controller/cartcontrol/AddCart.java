package controller.cartcontrol;

import dao.CartDAO;
import dao.ProductDAO;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
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

        /*
         * Ktra xem user đã đăng nhập chưa
         * No  ==> ko co gi xay ra
         * Yes ==> Ktra KH có cart 'CHƯA' check out ?
         */
        Customer cus = (Customer) session.getAttribute("customer");
        if (cus != null) {
            /*
             * Ktra KH có cart 'CHƯA' check out ?
             * No  ==> cập nhật cart item mới vô cart sẵn có
             * Yes ==> tạo cart mới và thêm cart item
             */
            CartDAO cartDAO = new CartDAO();
            boolean isCartCheckedOut = cartDAO.getCartCheckOutByCusId(cus.getId()) != null;

            // chưa checkout
            if (!isCartCheckedOut) {
                // cập nhật cart (thêm cart item) ==>
                int cartID = cartDAO.getCartIDByCusID(cus.getId());
                cartDAO.insertCartItemByCartID(cartID);

                System.out.println(c);
            }
            // đã checkout
            else {
                // tạo cart mới (lấy cartId trả về) ==> thêm cart item dựa vào cartId
                int cartID = cartDAO.createCart(cus.getId(), (byte) 0);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}




