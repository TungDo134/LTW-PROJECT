package controller.admincontrol.Batche;

import dao.BatchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteBatchController", value = "/admin/deleteBatch")
public class DeleteBatchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chặn truy cập GET để tránh xóa nhầm qua URL
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for deletion.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String batchIdParam = request.getParameter("batchID");
        if (batchIdParam == null || batchIdParam.trim().isEmpty()) {
            request.setAttribute("error", "Batch ID không được để trống.");
            request.getRequestDispatcher("/admin/listBatches.jsp").forward(request, response);
            return;
        }

        try {
            int batchID = Integer.parseInt(batchIdParam);
            BatchDAO batchDAO = new BatchDAO();
            boolean deleted = batchDAO.deleteBatch(batchID);

            if (deleted) {
                // Xóa thành công, redirect về danh sách lô hàng
                response.sendRedirect(request.getContextPath() + "/admin/listBatches");
            } else {
                // Xóa thất bại, hiển thị lỗi
                request.setAttribute("error", "Xóa lô hàng thất bại.");
                request.getRequestDispatcher("/admin/listBatches.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID lô hàng không hợp lệ.");
            request.getRequestDispatcher("/admin/listBatches.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Đã xảy ra lỗi khi xóa lô hàng.", e);
        }
    }
}
