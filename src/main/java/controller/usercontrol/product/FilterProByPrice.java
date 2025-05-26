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

@WebServlet(name = "FilterProByPrice", value = "/filter-product")
public class FilterProByPrice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String priceRange = request.getParameter("priceRange");
        String category = request.getParameter("category");

        int minPrice = 0;
        int maxPrice = Integer.MAX_VALUE;

        // Lọc giá dựa trên giá trị priceRange từ form
        if (priceRange != null && !priceRange.isEmpty()) {
            switch (priceRange) {
                case "1": minPrice = 0; maxPrice = 50000; break;
                case "2": minPrice = 50000; maxPrice = 100000; break;
                case "3": minPrice = 100000; maxPrice = 200000; break;
                case "4": minPrice = 200000; maxPrice = 500000; break;
                case "5": minPrice = 500000; maxPrice = Integer.MAX_VALUE; break;
            }
        }

        Integer cateID = (category != null && !category.isEmpty()) ? Integer.parseInt(category) : null;

        ProductDAO productDAO = new ProductDAO();
        List<Product> filteredProducts;

        // Gọi DAO để lấy sản phẩm theo tiêu chí phù hợp
        if (cateID != null && priceRange != null && !priceRange.isEmpty()) {
            // Lọc theo cả giá và danh mục
            filteredProducts = productDAO.getProductsByPriceAndCategory(minPrice, maxPrice, cateID);
        } else if (cateID != null) {
            // Chỉ lọc theo danh mục
            filteredProducts = productDAO.getProductByCate(cateID);
        } else if (priceRange != null && !priceRange.isEmpty()) {
            // Chỉ lọc theo giá
            filteredProducts = productDAO.getProByPriceRange(minPrice, maxPrice);
        } else {
            // Không có tiêu chí lọc, trả về tất cả sản phẩm
            filteredProducts = productDAO.getProduct();
        }

        // lấy ra số lượng của product từ kho
        Map<Integer, Inventory> inventoryMap = productDAO.getInventoryMap();
        request.setAttribute("inventoryMap", inventoryMap);

        // Đưa danh sách sản phẩm vào request
        request.setAttribute("products", filteredProducts);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}