package controller.admincontrol.inventory;

import dao.InventoryDAO;
import entity.Inventory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/admin/edit-warehouse")
public class EditInventory extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        InventoryDAO dao = new InventoryDAO();
        Inventory in = dao.getInventoryByProductID(productID);

        request.setAttribute("productID", in.getProductID());
        request.setAttribute("productName", in.getProductName());
        request.setAttribute("quantityInStock", in.getQuantityInStock());
        request.setAttribute("quantitySold", in.getQuantitySold());
        request.setAttribute("quantityReserved", in.getQuantityReserved());
        request.setAttribute("reorderLevel", in.getReorderLevel());

        request.getRequestDispatcher("/admin/editWarehouse.jsp").forward(request, response);
    }
}
