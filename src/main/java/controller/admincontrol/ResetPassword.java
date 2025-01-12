package controller.admincontrol;

import dao.CustomerDAO;
import entity.Customer;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ResetPassword", value = "/admin/reset-password")
public class ResetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cID = request.getParameter("cID");
        CustomerDAO cDAO = new CustomerDAO();
        cDAO.resetPassword(cID);
        response.sendRedirect("all-user");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}