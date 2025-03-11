package controller.admincontrol.dashboard;

import dao.CustomerDAO;
import dao.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "index", value = "/admin/index")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO odao = new OrderDAO();
        CustomerDAO custdao = new CustomerDAO();
        Double totalOrderPrice = odao.totalOrderPrice();

        int totalOrder = odao.getAllOrder().size();

        int totalUser = custdao.getUsers().size();


        request.setAttribute("orderPrice", totalOrderPrice);
        request.setAttribute("orderTotal", totalOrder);
        request.setAttribute("userTotal", totalUser);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}