package controller.admincontrol;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
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
        Order order= Odao.getOrderById(order_id);

        CustomerDAO cdao = new CustomerDAO();
        Customer cus = cdao.getCusByID(order.getCusID());

        request.setAttribute("cus", cus);
        request.setAttribute("cID", order.getOrderID());
        request.setAttribute("date", order.getDate());
        request.setAttribute("total", order.getTotalPrice());
        request.getRequestDispatcher("admin/order-detail.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}