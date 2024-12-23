package controller;

import dao.CouponDAO;
import dao.OrderDAO;
import dao.PaymentDAO;
import dao.ShippingDAO;
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
        // Xử lý logic dựa trên option được chọn
        if ("ATM".equals(payment)) payment = "ATM, VISA";
        else if ("MOMO".equals(payment)) {
            payment = "MOMO";
        } else if ("COD".equals(payment)) {
            payment = "COD";
        }

        customer.setName(name);
        customer.setPhone(phone);
        customer.setAddressShipping(addressShipping);


        session.setAttribute("customer", customer);
        int id = customer.getId();

        // giỏ hàng
        Cart cart = (Cart) session.getAttribute("cart");
        for (CartItem cartItem : cart.getList()) {
            System.out.println(cartItem);
        }


        int total = cart.getTotalQuantity();
        double totalPrice = cart.getTotal();
        String status = "đang xử lí";
        Date date = Date.valueOf(LocalDate.now());

        // tạo order mới
        OrderDAO ordDao = new OrderDAO();
        int ordID = ordDao.createOrder(id, totalPrice, status, total, date);

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