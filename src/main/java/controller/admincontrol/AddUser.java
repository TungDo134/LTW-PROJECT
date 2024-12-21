package controller.admincontrol;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddUser", value = "/add-user")
public class AddUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String phone = request.getParameter("numberPhone");
        String address = request.getParameter("address");
        String addressShipping = request.getParameter("addressShipping");
        String role = request.getParameter("role");


        request.setAttribute("customerName", customerName);
        request.setAttribute("email", email);
        request.setAttribute("pass", pass);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("addressShipping", addressShipping);


        if (customerName.isBlank() || email.isBlank()) {
            request.setAttribute("msg", "Vui lòng nhập đầy đủ những thông tin cần thiết");
            request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);

        } else {
            CustomerDAO cusDao = new CustomerDAO();
            int cus = cusDao.insertCustomer(customerName, email, pass, phone, address,addressShipping, role);
            if (cus < 1) {
                request.setAttribute("msg", "Có lỗi với đời");
                request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);

            }
            request.setAttribute("customer", cus);
            request.getRequestDispatcher("all-user").forward(request, response);

        }
    }
}