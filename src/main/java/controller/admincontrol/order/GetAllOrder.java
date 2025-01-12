package controller.admincontrol.order;

import dao.OrderDAO;
import entity.Order;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetAllOrder", value = "/admin/all-order")
public class GetAllOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO oDao = new OrderDAO();
        List<Order> listO = oDao.getAllOrder();
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("order-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}