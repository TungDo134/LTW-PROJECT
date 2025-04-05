package controller.admincontrol.discount;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "ApplyDiscount", value = "/admin/apply-discount")
public class ApplyDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productIds");
        String discountId = request.getParameter("discountId");

        if (productIds != null) {
            System.out.println("ID sản phẩm: ");
            for (String id : productIds) {
                System.out.print(" " + id + " ");
            }
        }
        System.out.println("ID mã giảm:" + discountId);


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