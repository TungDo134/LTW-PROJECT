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

@WebServlet(name = "EditBatchController", value = "/admin/editBatch")
public class EditBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int batchID = Integer.parseInt(request.getParameter("batchID"));
            BatchDAO batchDAO = new BatchDAO();
            Batch batch = batchDAO.getBatchByID(batchID)
                    .orElseThrow(() -> new ServletException("Không tìm thấy lô hàng với ID: " + batchID));
            request.setAttribute("batch", batch);
            request.getRequestDispatcher("/admin/editBatch.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy thông tin lô hàng", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Batch batch = new Batch();
            batch.setBatchID(Integer.parseInt(request.getParameter("batchID")));
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

            BatchDAO batchDAO = new BatchDAO();
            batchDAO.updateBatch(batch);

            response.sendRedirect("listBatches");
        } catch (Exception e) {
            throw new ServletException("Lỗi khi cập nhật lô hàng", e);
        }
    }
}
