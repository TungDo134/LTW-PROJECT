package controller.usercontrol.product;

import dao.ProductDAO;
import entity.Inventory;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SortProductController", value = "/sort-product")
public class SortProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String choice = request.getParameter("choice");
        ProductDAO productDAO = new ProductDAO();
        List<Product> sortP = productDAO.getProductSort(choice);

        // lấy ra số lượng của product từ kho
        Map<Integer, Inventory> inventoryMap = productDAO.getInventoryMap();
        request.setAttribute("inventoryMap", inventoryMap);

        request.setAttribute("products", sortP);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}