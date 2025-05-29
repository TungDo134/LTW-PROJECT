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

@WebServlet(name = "UpdateSupplier", value = "/admin/update-supplier")
public class UpdateSupplier extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Supplier supplier = new SupplierDAO().getSupplierByID(Integer.parseInt(request.getParameter("supplierId")));
        supplier.setSupplierName(request.getParameter("supplierName"));
        supplier.setContactInfo(request.getParameter("supplierInfo"));
        supplier.setAddress(request.getParameter("supplierAddress"));

        // Get date and time
        LocalDateTime dateTime = LocalDateTime.now();
        supplier.setCreatedAt(String.valueOf(dateTime));
        supplier.setUpdatedAt(String.valueOf(dateTime));

        boolean isSuccess = new SupplierDAO().updateSupplier(supplier);
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