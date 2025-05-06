package controller.admincontrol.authorization;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.AuthorizationDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddRole", value = "/admin/add-role")
public class AddRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role_name = request.getParameter("role-name");
        AuthorizationDAO dao = new AuthorizationDAO();
        boolean isSuccess = dao.insertRole(role_name.toUpperCase());

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", isSuccess);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}