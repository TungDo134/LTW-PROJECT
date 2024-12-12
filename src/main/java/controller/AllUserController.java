package controller;

import dao.CustomerDAO;
import entity.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllUserController", value = "/all-user")
public class AllUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CustomerDAO cusDao= new CustomerDAO();
        List<Customer> listAllCus= cusDao.getAllUser();
        request.setAttribute("listC",listAllCus);
        request.getRequestDispatcher("allUser.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}