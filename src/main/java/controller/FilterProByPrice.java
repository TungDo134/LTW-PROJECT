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
        String price = request.getParameter("priceRange");

        ProductDAO productDAO = new ProductDAO();

        List<Product> filterPro = new ArrayList<>();

        switch (price){
            case "1" :
                 filterPro = productDAO.getProByPriceRange(0,50000);
                 break;
            case "2" :
                 filterPro = productDAO.getProByPriceRange(50000, 100000);
                 break;
            case "3" :
                 filterPro = productDAO.getProByPriceRange(100000, 200000);
                 break;
            case "4" :
                 filterPro = productDAO.getProByPriceRange(200000, 500000);
                 break;
            case "5" :
                 filterPro = productDAO.getProByPriceRange(500000, Integer.MAX_VALUE);
                 break;
            default:
                filterPro = productDAO.getProduct();
                break;
        }

        request.setAttribute("products", filterPro);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}