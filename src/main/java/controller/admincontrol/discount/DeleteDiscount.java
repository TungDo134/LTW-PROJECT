package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.DiscountDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "DeleteDiscount", value = "/admin/delete-discount")
public class DeleteDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String discountId = request.getParameter("discountId");
        DiscountDAO dao = new DiscountDAO();
        dao.deleteDiscountAndUpdateProducts(discountId);

        // Phản hồi về client
        JsonObject result = new JsonObject();
        result.addProperty("isSuccess", true);
        response.setContentType("application/json");

        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(result));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}