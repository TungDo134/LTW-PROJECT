package controller;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "getProductController", value = "/products")
public class GetAllProduct extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        String searchQuery = request.getParameter("txt");

        List<Product> products;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            products = productDAO.searchProductsByName(searchQuery);
        } else {
            products = productDAO.getProduct();
        }


        request.setAttribute("products", products);
        request.setAttribute("txt", searchQuery);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
