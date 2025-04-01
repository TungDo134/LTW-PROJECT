package controller.admincontrol.category;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CategoryDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DeleteCate", value = "/admin/delete-cate")
public class DeleteCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cID = request.getParameter("cID");

        CategoryDAO dao = new CategoryDAO();
        boolean isSuccess = dao.removeCate(cID) > 0;

        response.setContentType("application/json");

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