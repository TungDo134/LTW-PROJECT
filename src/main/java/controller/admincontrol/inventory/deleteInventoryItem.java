package controller.admincontrol.inventory;

import dao.InventoryDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "deleteInventoryItem", value = "/admin/deleteInventoryItem")
public class deleteInventoryItem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy productID từ tham số URL dưới dạng String
        String productID = request.getParameter("productID");

        // Gọi phương thức xóa từ InventoryDAO với productID là String
        InventoryDAO inventoryDAO = new InventoryDAO();
        boolean success = inventoryDAO.deleteInventoryItem(productID); // Truyền productID dạng String vào phương thức

        if (success) {
            // Nếu xóa thành công, chuyển hướng về trang danh sách sản phẩm kho
            response.sendRedirect(request.getContextPath() + "/admin/list-warehouse");
        } else {
            // Nếu xóa thất bại, trả về thông báo lỗi
            response.setContentType("application/json");
            response.getWriter().write("{\"isSuccess\": false, \"msg\": \"Xóa thất bại\"}");

            // Log thông tin để kiểm tra lý do thất bại
            System.out.println("Failed to delete item with productID: " + productID);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không cần xử lý POST trong trường hợp này vì xóa là một hành động GET
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST method is not allowed");
    }

}
