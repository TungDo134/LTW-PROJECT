package controller.admincontrol.batches;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.BatchDAO;
import entity.Batch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "EditBatchController", value = "/admin/edit-batches")
public class EditBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Batch batch = new Batch();
        batch.setBatchID(Integer.parseInt(request.getParameter("batchesId")));
        batch.setProductID(Integer.parseInt(request.getParameter("productId")));
        batch.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        batch.setPrice(Double.parseDouble(request.getParameter("price")));
        String supplierID = request.getParameter("supplierID");
        if (supplierID != null && !supplierID.trim().isEmpty()) {
            batch.setSupplierID(Integer.parseInt(supplierID));
        }

        boolean isSuccess = new BatchDAO().updateBatch(batch);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", isSuccess);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);

    }
}
