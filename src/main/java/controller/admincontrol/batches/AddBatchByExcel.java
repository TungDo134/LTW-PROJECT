package controller.admincontrol.batches;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.BatchDAO;
import entity.Batch;
import helper.ExcelReader;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

import java.util.List;

@WebServlet(name = "AddBatchByExcel", value = "/admin/add-batch-excel")
public class AddBatchByExcel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = "D:\\WorkSpace_IJ\\Project-LTW\\";
        String fileName = request.getParameter("fileName");
        String filePath = path + fileName;

        ExcelReader excelReader = new ExcelReader();
        List<Batch> list_batches = excelReader.readBatchesFromExcel(filePath);
        boolean isSuccess = false;
        for (Batch b : list_batches) {
            isSuccess = new BatchDAO().addBatch(b);
        }
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


