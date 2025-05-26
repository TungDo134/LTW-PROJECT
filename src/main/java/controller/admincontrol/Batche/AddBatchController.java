package controller.admincontrol.Batche;

import dao.BatchDAO;
import entity.Batch;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "AddBatchController", value = "/admin/addBatch")
public class AddBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng về form thêm lô hàng (nếu có)
        request.getRequestDispatcher("/admin/addBatche.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Batch batch = new Batch();
            batch.setProductID(Integer.parseInt(request.getParameter("productID")));
            batch.setBatchNumber(request.getParameter("batchNumber"));
            batch.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            batch.setImportDate(Date.valueOf(request.getParameter("importDate")));

            String expiryDate = request.getParameter("expiryDate");
            if (expiryDate != null && !expiryDate.trim().isEmpty()) {
                batch.setExpiryDate(Date.valueOf(expiryDate));
            }

            String supplierID = request.getParameter("supplierID");
            if (supplierID != null && !supplierID.trim().isEmpty()) {
                batch.setSupplierID(Integer.parseInt(supplierID));
            }

            boolean success = new BatchDAO().addBatch(batch);
            if (success) {
                response.sendRedirect("listBatches");
            } else {
                request.setAttribute("error", "Không thể thêm lô hàng. Vui lòng thử lại.");
                request.getRequestDispatcher("/admin/addBatch.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException("Lỗi khi thêm lô hàng", e);
        }
    }
}
