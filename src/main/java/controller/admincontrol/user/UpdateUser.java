package controller.admincontrol.user;

import dao.CustomerDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "UpdateUser", value = "/admin/update-user")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("username");
        String email = request.getParameter("email");
//        String pass = request.getParameter("password");
        String phone = request.getParameter("numberPhone");
        String address = request.getParameter("address");
        String addressShipping = request.getParameter("addressShipping");
        String role = request.getParameter("role");

        CustomerDAO cusDao = new CustomerDAO();

        boolean isSuccess = cusDao.updateUser(customerName, email, phone, address, addressShipping, role) > 0;

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("isSuccess", isSuccess);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}