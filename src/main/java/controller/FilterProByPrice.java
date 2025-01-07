package controller;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterProByPrice", value = "/filter-product")
public class FilterProByPrice extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String priceRange = request.getParameter("priceRange");
        String category = request.getParameter("category");

        int minPrice = 0;
        int maxPrice = Integer.MAX_VALUE;

        // Lọc giá dựa trên giá trị priceRange từ form
        if (priceRange != null) {
            switch (priceRange) {
                case "1": minPrice = 0; maxPrice = 50000; break;
                case "2": minPrice = 50000; maxPrice = 100000; break;
                case "3": minPrice = 100000; maxPrice = 200000; break;
                case "4": minPrice = 200000; maxPrice = 500000; break;
                case "5": minPrice = 500000; maxPrice = Integer.MAX_VALUE; break;
            }
        }


        Integer cateID = category != null ? Integer.parseInt(category) : null;

        ProductDAO productDAO = new ProductDAO();

        List<Product> filterPro = productDAO.getProByPriceRange(minPrice, maxPrice);

        if (cateID != null) {
            filterPro = productDAO.getProductByCate(cateID);
        }

        request.setAttribute("products", filterPro);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}