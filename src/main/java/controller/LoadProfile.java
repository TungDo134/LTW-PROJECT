package controller;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "LoadProfile", value = "/load-profile")
public class LoadProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //code = 1 khi ng dùng muốn sửa info
        String code = request.getParameter("code");
        HttpSession session = request.getSession(false);
        Customer cus = (Customer) session.getAttribute("customer");
        request.setAttribute("cus", cus);

        if ("1".equals(code)) {
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}