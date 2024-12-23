package controller.admincontrol;

import dao.*;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllOrderDetail", value = "/all-orderDetail")
public class GetAllOrderDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String order_id = request.getParameter("id");
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> listOD = dao.getAllOrderDetail(order_id);
        request.setAttribute("listOD", listOD);


        OrderDAO Odao = new OrderDAO();
        Order order = Odao.getOrderById(order_id);

        CustomerDAO cdao = new CustomerDAO();
        Customer cus = cdao.getCusByID(order.getCusID());

        ShippingDAO shippingDAO = new ShippingDAO();
        Shipping shipping = shippingDAO.getShippingByOrdID(order.getOrderID());

        PaymentDAO pdao = new PaymentDAO();
        Payment payment = pdao.getPaymentByOrdID(order.getOrderID());

        // id khach hang
        request.setAttribute("cus", cus);
        // id don hang
        request.setAttribute("oID", order.getOrderID());
        // ngay tao don
        request.setAttribute("date", order.getDate());
        // tong tien cua don
        request.setAttribute("total", order.getTotalPrice());
        // trang thai van chuyen
        request.setAttribute("shipping", shipping.getStatus());
        // phuong thuc thanh toan
        request.setAttribute("payment", payment.getPayMethods());


        request.getRequestDispatcher("admin/order-detail.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}