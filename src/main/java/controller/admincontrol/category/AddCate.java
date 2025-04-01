package controller.admincontrol.category;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.CategoryDAO;
import entity.Category;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "AddCateController", value = "/add-newCate")
public class AddCate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");

        String name = request.getParameter("nameCate");
        String img = request.getParameter("imgCate");
        boolean isSuccess = false;
        String msg = "";
        int cID = 0;

        if (name.isBlank() || img.isBlank()) {
            msg = "Dữ liệu nhập vào không được trống";
        } else {
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = new Category();
            category.setName(name.trim());
            category.setCateImg(img.trim());
            cID = categoryDAO.insertCate(category);
            if (cID > 0) {
                isSuccess = true;
            }
        }

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", isSuccess);
        jsonObject.addProperty("msg", msg);
        jsonObject.addProperty("cID", cID);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);

    }
}