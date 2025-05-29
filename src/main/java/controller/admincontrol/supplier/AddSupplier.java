package controller.admincontrol.supplier;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.SupplierDAO;
import entity.Supplier;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "AddSupplier", value = "/admin/add-supplier")
public class AddSupplier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Supplier supplier = new Supplier();
        String addSupplierName = request.getParameter("addSupplierName");
        String addSupplierInfo = request.getParameter("addSupplierInfo");
        String addSupplierAddress = request.getParameter("addSupplierAddress");

        supplier.setSupplierName(addSupplierName);
        supplier.setContactInfo(addSupplierInfo);
        supplier.setAddress(addSupplierAddress);

        // Get date and time
        LocalDateTime dateTime = LocalDateTime.now();
        supplier.setCreatedAt(String.valueOf(dateTime));
        supplier.setUpdatedAt(String.valueOf(dateTime));

        boolean isSuccess = new SupplierDAO().addSupplier(supplier);
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