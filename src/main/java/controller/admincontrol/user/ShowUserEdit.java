package controller.admincontrol.user;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "EditUser", value = "/admin/edit-user")
public class ShowUserEdit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("cusID");


        CustomerDAO cusDao = new CustomerDAO();
        Customer customers = cusDao.getUserByID(id);

        Byte role = Byte.valueOf(customers.getRole());
        request.setAttribute("role", role);


        request.setAttribute("customers",customers);
        request.getRequestDispatcher("editUser.jsp").forward(request,response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}