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
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet(name = "AddBatchController", value = "/admin/add-batches")
public class AddBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Batch batch = new Batch();
        batch.setProductID(Integer.parseInt(request.getParameter("productId")));
        batch.setBatchNumber(request.getParameter("batchesNumber"));
        batch.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        batch.setSupplierID(Integer.parseInt(request.getParameter("supplierID")));

        // Get date and time
        LocalDateTime dateTime = LocalDateTime.now();
        batch.setCreatedAt(String.valueOf(dateTime));
        batch.setImportDate(String.valueOf(dateTime.toLocalDate()));

        // Call addBatch function
        boolean isSuccess = new BatchDAO().addBatch(batch);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("isSuccess", isSuccess);

        Gson gson = new Gson();
        String json = gson.toJson(jsonObject);
        response.getWriter().write(json);
    }
}
