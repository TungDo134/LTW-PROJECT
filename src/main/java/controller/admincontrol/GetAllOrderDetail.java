package controller.admincontrol;

import dao.OrderDetailDAO;
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
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> listOD = dao.getAllOrderDetail();
        request.setAttribute("listOD", listOD);
        request.getRequestDispatcher("/admin/order-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}