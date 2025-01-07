package controller;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "updateUser", value = "/update-user-client")
public class UpdateUserClient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String addressShipping = request.getParameter("addressShipping");
        String role = request.getParameter("role");

        System.out.println(role);
        CustomerDAO cusDao = new CustomerDAO();
        int row = cusDao.updateUser(name, email, phone, address, addressShipping, role);
        HttpSession session = request.getSession(false);
        Customer c = (Customer) session.getAttribute("customer");
        c.setName(name);
        c.setPhone(phone);
        c.setAddress(address);
        c.setAddressShipping(addressShipping);


        // set lai session customer
        session.setAttribute("customer", c);
        response.sendRedirect("load-profile");
    }
}