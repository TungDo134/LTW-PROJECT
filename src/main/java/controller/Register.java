package controller;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import util.CheckValidEmail;
import util.MaHoaMK;

import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        String msg = "";

        // check valid email
        if (!CheckValidEmail.checkValidEmail(email)) {
            msg = "Email không hợp lệ";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("forms/signup-login.jsp").forward(request, response);
            return;
        }

        CustomerDAO cusDao = new CustomerDAO();
        // check email
        if (cusDao.isUserExistsByEmail(email)) {
            msg = "Email đã tồn tại, vui lòng kiểm tra lại";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("forms/signup-login.jsp").forward(request, response);
        } else {
            // check password
            if (!password.equals(rePassword)) {
                msg = "Mật khẩu nhập lại không chính xác";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("forms/signup-login.jsp").forward(request, response);

            } else {
                password = MaHoaMK.toSHA1(password);
                Customer customer = new Customer();
                customer.setName(username);
                customer.setEmail(email);
                customer.setPass(password);
                customer.setRole((byte) 0);

                cusDao.createNewCustomer(customer);

                // lưu session cho đăng nhập mới
                HttpSession session = request.getSession(true);
                session.setAttribute("customer", customer);

                customer.setPass("");
                response.sendRedirect("home");
            }
        }

    }
}