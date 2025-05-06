package controller.admincontrol.inventory;

import dao.InventoryDAO;
import entity.Inventory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UpdateInventory", value = "/admin/UpdateInventory")
public class UpdateInventory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        int quantityInStock = Integer.parseInt(request.getParameter("quantityInStock"));
        int quantitySold = Integer.parseInt(request.getParameter("quantitySold"));
        int quantityReserved = Integer.parseInt(request.getParameter("quantityReserved"));
        int reorderLevel = Integer.parseInt(request.getParameter("reorderLevel"));
        String productName = request.getParameter("productName");

        Inventory updatedInventory = new Inventory(productID, quantityInStock, quantitySold, quantityReserved, reorderLevel, null, productName);

        // Gọi DAO để cập nhật cơ sở dữ liệu
        InventoryDAO inventoryDAO = new InventoryDAO();
        boolean success = inventoryDAO.updateInventory(updatedInventory);

        if (success) {
            // Trả về phản hồi JSON khi cập nhật thành công
            response.setContentType("application/json");
            response.getWriter().write("{\"isSuccess\": true}");
        } else {
            // Trả về phản hồi lỗi nếu không thành công
            response.setContentType("application/json");
            response.getWriter().write("{\"isSuccess\": false, \"msg\": \"Cập nhật thất bại\"}");
        }
    }
}

