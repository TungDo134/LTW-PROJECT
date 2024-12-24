package controller;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.PaymentDAO;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.Payment;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadProfile", value = "/load-profile")
public class LoadProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //code = 1 khi ng dùng muốn sửa info
        String code = request.getParameter("code");
        HttpSession session = request.getSession(false);
        Customer cus = (Customer) session.getAttribute("customer");
        request.setAttribute("cus", cus);


        // lấy order và order detail
        OrderDAO oDao = new OrderDAO();
        Order order = oDao.getOrderByCusId(cus.getId());
        OrderDetailDAO odDao = new OrderDetailDAO();
        List<OrderDetail> listOrd = odDao.getAllOrderDetail(String.valueOf(order.getOrderID()));


        // lấy payment
        PaymentDAO pDao = new PaymentDAO();
        Payment pay = pDao.getPaymentByOrdID(order.getOrderID());

        request.setAttribute("order", order);
        request.setAttribute("listOrd", listOrd);
        request.setAttribute("pay", pay);

        if ("1".equals(code)) {
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}