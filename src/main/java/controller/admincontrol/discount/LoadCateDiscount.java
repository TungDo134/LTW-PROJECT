package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadCateDiscount", value = "/admin/load-cate-discount")
public class LoadCateDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateId = request.getParameter("cateId");
        boolean isSuccess = false;
        String error = "";
        List<Product> list_p = List.of();

        if (cateId != null) {
            ProductDAO productDAO = new ProductDAO();
            list_p = productDAO.getProductByCate(Integer.parseInt(cateId));
            isSuccess = true;
        } else {
            error = "Không tìm thấy danh mục";
        }

        response.setContentType("application/json");
        JsonObject jsonObject = new JsonObject();

        jsonObject.addProperty("isSuccess", isSuccess);
        jsonObject.addProperty("error", error);

        Gson gson = new Gson();
        JsonElement listJson = gson.toJsonTree(list_p);
        jsonObject.add("products", listJson);

        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}