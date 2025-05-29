package controller.admincontrol.batches;

import context.JDBIContext;
import dao.BatchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteBatchController", value = "/admin/deleteBatch")
public class SoftDeleteBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        String batchID = request.getParameter("batchID");

        BatchDAO batchDAO = new BatchDAO();
        boolean deleted = false;
        boolean unDeleted = false;

        if ("1".equals(option)) {
            deleted = batchDAO.softDeleteBatch(batchID);
        } else {
            unDeleted = batchDAO.unSoftDeleteBatch(batchID);
        }


        if (deleted || unDeleted) {
            // Xóa (lưu trữ) thành công, redirect về danh sách lô hàng
            response.sendRedirect(request.getContextPath() + "/admin/list-batches");
        } else {
            // Xóa thất bại, hiển thị lỗi
            request.setAttribute("error", "Xóa lô hàng thất bại.");
            request.getRequestDispatcher("/admin/list-batches").forward(request, response);
        }

    }
}

