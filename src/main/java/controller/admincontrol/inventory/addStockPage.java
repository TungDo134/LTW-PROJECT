package controller.admincontrol.inventory;

import dao.InventoryDAO;
import entity.Inventory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/add-stock-page")
public class addStockPage extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIDRaw = request.getParameter("productID");

        if (productIDRaw == null || productIDRaw.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu productID");
            return;
        }

        InventoryDAO dao = new InventoryDAO();
        Inventory inven = dao.getInventoryByProductID(productIDRaw);

        if (inven != null) {
            request.setAttribute("productID", inven.getProductID());
            request.setAttribute("productName", inven.getProductName());
            request.setAttribute("reorderLevel", inven.getReorderLevel());
            request.setAttribute("quantityInStock", inven.getQuantityInStock());
            // Thêm các trường khác nếu cần

            // ✅ Forward tới trang JSP hiển thị form nhập kho
            request.getRequestDispatcher("/admin/addWarehouse.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sản phẩm trong kho");
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}