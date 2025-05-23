package controller.usercontrol.order;

import dao.*;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet(name = "CreateOrder", value = "/create-order")
public class CreateOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Customer customer = (Customer) session.getAttribute("customer");

        // info khách hàng
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("numberPhone");
        String addressShipping = request.getParameter("addressShipping");

        String payment = request.getParameter("payment");
        String statusOrder = "";


        // lấy ra phương thức thanh toán
        if ("ATM".equalsIgnoreCase(payment)) {
            payment = "ATM, VISA";
            statusOrder = "đã thanh toán";
        } else if ("MoMo".equalsIgnoreCase(payment)) {
            payment = "MOMO";
            statusOrder = "đã thanh toán";
        } else {
            payment = "COD";
            statusOrder = "đang xử lí";
        }

        customer.setName(name);
        customer.setPhone(phone);
        customer.setAddressShipping(addressShipping);

        String role = String.valueOf(customer.getRole());
        CustomerDAO cusDao = new CustomerDAO();

        cusDao.updateUser(name, email, phone, customer.getAddress(), addressShipping, role);
        session.setAttribute("customer", customer);
        int id = customer.getId();

        // giỏ hàng
        // Cập nhật số lượng sp trong kho
        ProductDAO pDao = new ProductDAO();
        InventoryDAO inventoryDao = new InventoryDAO();
        int productStock;

        int order;
        int cartId;

        Cart cart = (Cart) session.getAttribute("cart");
        for (CartItem cartItem : cart.getList()) {
            System.out.println(cartItem);
            cartId = cartItem.getProductID();

            // kiểm tra xem slg hàng ng dùng mua có nhỏ hơn slg tồn kho không
            productStock = inventoryDao.getInventoryByProductID(cartId + "").getQuantityInStock();
            order = cartItem.getQuantity();

            if (order >= productStock) {
                request.setAttribute("error", "Sản phẩm đã hết hàng hoặc vượt quá số lượng tồn kho");
                request.getRequestDispatcher("check-out.jsp").forward(request, response);
                return;
            }
        }
        int total = cart.getTotalQuantity();

        // lấy giá sau khi giảm nếu có
        String priceDiscount = request.getParameter("priceDiscount");

        // nếu áp được mã giảm giá
        double totalPrice;

        if (("noV").equals(priceDiscount)) {
            totalPrice = cart.getTotal();
        } else {
            totalPrice = Double.parseDouble(priceDiscount);
        }

//        System.out.println("totalPrice: " + totalPrice);
        Date date = Date.valueOf(LocalDate.now());

        // tạo order mới
        OrderDAO ordDao = new OrderDAO();
        int ordID = ordDao.createOrder(id, totalPrice, statusOrder, addressShipping, total, date);

        // tạo trường cho bảng quá trình vận chuyển
        ShippingDAO shippingDAO = new ShippingDAO();
        Shipping shipping = new Shipping();
        shipping.setOrderID(ordID);
        shipping.setStatus("đang chờ");
        shippingDAO.insertShipping(shipping);

        // bảng thanh toán
        PaymentDAO paymentDAO = new PaymentDAO();
        paymentDAO.insertPayment(ordID, payment);


        System.out.println(ordID);
        request.setAttribute("ordID", ordID);
        response.sendRedirect("create-ord-detail?ordID=" + ordID); // Gửi qua URL


    }
}