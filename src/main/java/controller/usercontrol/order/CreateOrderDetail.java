package controller.usercontrol.order;

import dao.InventoryDAO;
import dao.OrderDetailDAO;
import entity.Cart;
import entity.CartItem;
import entity.Customer;
import helper.CartManagerDB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "CreateOrderDetail", value = "/create-ord-detail")
public class CreateOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ordID = request.getParameter("ordID");
        HttpSession session = request.getSession(false);

        Cart cart = (Cart) session.getAttribute("cart");
        OrderDetailDAO orderDetaiD = new OrderDetailDAO();

        // Kho hàng
        InventoryDAO inventoryDAO = new InventoryDAO();

        for (CartItem cartItem : cart.getList()) {
            orderDetaiD.createOrderDetail(ordID, cartItem.getProductID(), cartItem.getQuantity(),
                    cartItem.getTotalPrice(), cartItem.getTitle(), cartItem.getImg());

            // cập nhật slg sp đang chờ xử lí
            inventoryDAO.UpdateQuantityReservedProduct(cartItem.getProductID(), cartItem.getQuantity());
        }

        // xóa giỏ hàng (session + db)
        CartManagerDB cartManager = new CartManagerDB();
        Customer customer = (Customer) session.getAttribute("customer");
        cartManager.deleteCartDB(customer.getId());

        session.removeAttribute("cart");
        response.sendRedirect("check-out-success.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}