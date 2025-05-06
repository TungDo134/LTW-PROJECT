package controller.admincontrol.inventory;

import dao.InventoryDAO;
import entity.Inventory;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "allInventory", value = "/admin/list-warehouse")
public class allInventory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryDAO inventoryDAO = new InventoryDAO();
        List<Inventory> inventories = inventoryDAO.getAllInventory();

        request.setAttribute("inventories",inventories);
        request.getRequestDispatcher("/admin/allInventory.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}