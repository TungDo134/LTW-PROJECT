package controller.admincontrol.Batche;

import dao.BatchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ListBatchController", value  = "/admin/listBatches")
public class ListBatchController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            BatchDAO batchDAO = new BatchDAO();
            request.setAttribute("batches", batchDAO.getAllBatches());
            request.getRequestDispatcher("/admin/batches.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy danh sách lô hàng", e);
        }
    }
}
