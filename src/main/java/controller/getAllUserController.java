package controller;

import dao.CustomerDAO;
import dao.JDBI_Customer_DAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "getAllUserController", value = "/all-user")
public class getAllUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        CustomerDAO cusDao = new CustomerDAO();
//        List<Customer> listC= cusDao.getAllUser();

        JDBI_Customer_DAO dao = new JDBI_Customer_DAO();
        List<Customer> listC = dao.getUsers();

        request.setAttribute("listC", listC);
        request.getRequestDispatcher("admin/allUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}