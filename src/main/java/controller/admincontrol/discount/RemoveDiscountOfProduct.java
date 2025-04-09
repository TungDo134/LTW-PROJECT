package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.DiscountDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RemoveDiscountOfProduct", value = "/admin/remove-discount-products")
public class RemoveDiscountOfProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productIds");
        DiscountDAO dao = new DiscountDAO();
        boolean isSuccess = dao.removeDiscountBatch(List.of(productIds));


        // Phản hồi về client
        JsonObject result = new JsonObject();
        result.addProperty("isSuccess", isSuccess);
        response.setContentType("application/json");

        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(result));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}