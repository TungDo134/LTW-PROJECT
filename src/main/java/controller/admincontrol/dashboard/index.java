package controller.admincontrol.dashboard;

import dao.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "index", value = "/index")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO odao = new OrderDAO();
        Double totalOrderPrice=odao.totalOrderPrice();


        request.setAttribute("order", totalOrderPrice);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}