package controller.admincontrol.inventory;

import dao.InventoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "add-stock", value = "/admin/add-stock")
public class addStock extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");  // ✅ Đặt content type là JSON
        response.setCharacterEncoding("UTF-8");

        // Lấy các tham số từ form
        String productIDRaw = request.getParameter("productID");
        String quantityRaw = request.getParameter("quantityInStock"); // Đảm bảo khớp với name="quantityInStock" trong form
        String reorderLevelRaw = request.getParameter("reorderLevel");

        // Kiểm tra nếu thiếu thông tin
        if (productIDRaw == null || quantityRaw == null || reorderLevelRaw == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{ \"isSuccess\": false, \"msg\": \"Thiếu thông tin\" }");
            return;
        }

        try {
            // Chuyển các giá trị sang kiểu dữ liệu thích hợp
            int productID = Integer.parseInt(productIDRaw);
            int quantity = Integer.parseInt(quantityRaw); // Lấy số lượng nhập kho
            int reorderLevel = Integer.parseInt(reorderLevelRaw);

            // Xử lý và cập nhật vào cơ sở dữ liệu
            InventoryDAO dao = new InventoryDAO();
            boolean success = dao.addStock(productID, quantity, reorderLevel);

            // Trả về thông báo cho client
            if (success) {
                response.getWriter().write("{ \"isSuccess\": true, \"msg\": \"Nhập kho thành công!\" }");
            } else {
                response.getWriter().write("{ \"isSuccess\": false, \"msg\": \"Lỗi khi nhập kho!\" }");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{ \"isSuccess\": false, \"msg\": \"Lỗi xử lý dữ liệu!\" }");
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}