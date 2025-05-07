package controller.usercontrol.order;

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

@WebServlet(name = "LoadDetailOrderCus", value = "/load-detail-ord-cus")
public class LoadDetailOrderCus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("oID");
        // lấy order và order detail
        HttpSession session = request.getSession(false);
        Customer cus = (Customer) session.getAttribute("customer");
        request.setAttribute("cus", cus);


        // check xem kh đã mua bh chưa
        List<OrderDetail> listOrdetail = null;
        Payment pay = null;

        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrderById(orderID);

        OrderDetailDAO odDao = new OrderDetailDAO();
        listOrdetail = odDao.getAllOrderDetail(orderID);


        // lấy payment
        PaymentDAO pDao = new PaymentDAO();
        pay = pDao.getPaymentByOrdID(Integer.parseInt(orderID));

        request.setAttribute("order", order);
        request.setAttribute("listOrd", listOrdetail);
        request.setAttribute("pay", pay);

        request.getRequestDispatcher("detail-order.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}